# SEARCH ENGINES TOPICS
- Features in Search Engines:
    - query completion
    - query suggestions (related or more in-depth)
    - recommendation
    - knowledge panel (NLP)
    - organic results (IR)
    - ...
- kinds of Information Retrival (IR):
    - Library 
    - Social Media
    - Desktop
    - Mail
    - Product
    - Conversarional (chatbots)
    - Image/Audio
    - Legal
    - ...  

### IR: field concerned with the structure, analysis, organization storage, searching and retrieval of information.  

Documents:
- have title, author date, suject, sender, ...
- lots of fields

### Types of retrieval 
- ad hoc search (find exact document)
- answer seeking (find answers to questions)
- decision making (how to do this)
- expert search (find a person that does x)
- ...

### IR is not a database search:
- database have well defined attributes
- it's easy to compare fields in database
- free text is more difficult
- text is full of ambiguity
- DB have exact match without ranking, IR has best match with ranking
- Interaction is fundamental in IR

### Comparing the query text to the document text and find what is a good match  
- exact matching is not enough

Sometimes it's useful to re-rank the topics after a first ranking phase (es with nlp on the top x documents)

### The Y of information retrieval
- documents -> indexing -> index
- query -> indexing -> query representation
- matching between index and query representation -> retrieval results

Indexing is offline, query is online.  

### The concept of relevance is subjective
- A document is relevant if the user perceives it as containing information of value with respect to it's personal information needs

### What makes a document "relevant"
- contains query terms
- contains query terms lots of time
- contains query terms close together
- contains terms similar to the query
- is it authoritative
- clicked by many other people for the same query
- is it recent

### Indexing basics
- parsing a document
- tokenization (splitting document into words)
- stop word removal (removing words that are common in every document)
- stemming (reducing every word to it's root (kinda))
- building the inverted index (word: list of documents insthead of document: body) -> faster

### Tokenization
- text to stream of words
- black spaces and punctuation as separators
- words converted to lower case -> tokens
- there are lots of special cases (numbers, hyphens, specific terms, acronyms, ...)
- small words can be important in some queries
- both hyphenated and not forms of many words are common
- special characters are important for tags, urls, code, etc
- Capitalized words have different meaning from lower case words
- Apostrophes could be part of a word, of a possessive, or a mistake
- numbers can be important
- periods occur in numbers, abbreviations, urls, acronyms, ...


### Stopwords removal
- Words with appear in 80% of the documents are not informative
- reduces the size of the index (more or less 40%)
- list of stopwords can be a standard list or computed from the collection

### Stemming
- removing prefix and suffix to allow syntactic variations
- can cause controversy and many conflicting conclusions
- three types:
    - dictionary based: uses lists of related words
    - algorithmic: uses program to determine related words
    - statistical: uses document corpora statistics to learn how to stem

### Handling different languages is hard since each one has different rules, characters or grammar

### Phrases
- many wueries are 2-3 words phrases
- more precise than words
- difficult to rank them
- how can we recognise them?
    - part-of-speech tagger
    - use n-grams
    - store word positions and use proximity operators

### Part of speech tagger
- use statistical models of text to predict syntactic tags of words
- phrases can be defined as simple noun groups

### N-grams
- POS too slow for large collections
- define a phrase: sequence of n words (n-gram)
- ngrams formed from overlapping sequences of words
- frequent ngrams are more likely to be meaningful phrases
- index all ngrams up to a specified length (lots of storage)

### Name entity recognition
- identify words that refer to something of interest in a particular application
- a branch of information extraction, aims to automatically extract structure from text
- rule-based:
    - uses lexicons that categorize names
    - either developed manually or using machine learning
- statistical:
    - use statistical models of the words
    - probabilities estimated using training data

### Evaluation
- must be scientifically valid (mesures, statistics, large-scale, repeatable)
- must be realistic
- must be understandable

### Evaluation measures
- set based retrieval
    - binary relevance: precision, recall, f-mesure
- rank based retrieval:
    - binary relevance: precision at cutoff, recall at cutoff, Rprecision, AveragePrecision, RankBiased Precision, ...
    - multigraded relevance: discounted cumulated gain


### Precision
- proportion of retrieved documents that are actually relevant
- P = #(retrieved and relevant) / #(retrieved)

### Recall
- proportion of relevant documents actually retrieved
- R = #(retrieved and relevant) / #(relevant)

Together precision and recall measure retrieval effectiveness: ability of a system to retrieve relevant documents while holding back non relevant ones

### F-measure
- is the armonic mean of precision and recall
- F = #(retrieved and relevant) / ( (#(relevant) + #(retrieved)) / 2 )

### Precision at cutoff
- $P(k)=\frac{1}{k}\sum_{n=1}^kr_n$ with $r_n$ the relevance degree of the n-th document

### Recall at cutoff
- $R(k)=\frac{1}{RB}\sum_{n=1}^kr_n$ where $RB$=#(relevant)

Rprec is the precision computed at the recall base $Rprec=P(RB)$

We can interpolate precision at standard recall value $R_j$ using the maximum precision obtained for any recall $R$ greather (or equal) than $R_j$:  
$iP@R_j=max_{R\geq R_j}P@R$

### Average Precision
$AP=\frac{rr}{RB}\cdot\frac{1}{rr}\sum_{k\in R}P(k)$
where:
- $R$ is the set of the rank position of the relevant retrieved documents
- $rr=|R|$ the number of relevant retrieved documents
- $\frac{rr}{RB}$ is the recall
- $\frac{1}{rr}\sum_{k\in R}P(k)$ is the arithmetic mean of $P(k)$
- The MAP (Mean Average Precision) is the mean of AP over a set of topics

### Precision Recall curve
- The area under the curve of the precision-recall curve (AUC) is an important indicator of the overall system effectiveness
- through some calculations we get that $AUC=AP$

### Discounted cumulated gain
- Naturally handles multi-graded relevance
- does not depend on the recall base
- is not bounded in [0,1]  

$DCG(k)=\{$  
- $\sum_{n=1}^kr_n$ if $k<b$
- $DCG(k-1)+\frac{r_k}{log_b(k)}$ if $k\geq b$  

$= \sum_{n=1}^k{\displaystyle\frac{r_n}{max(1, log_b(n))}}$

The base of the logarithm $b$ indicates the patience of the user scanning the result list:
- b=2 impatient
- b=10 patient

$\sum_{n=1}^kr_n$ if $k<b$ is the Cumulated Gain (CG)

To normalize DCG in [0,1] we must compute the ideal run, which represents the best retrieval posible (and the maximum value of the DCG)  

$nDCG(k)=\frac{DCG(k)}{iDCG(k)}$

### User models
- browsing model (how user interacts with the results)
- model of documented utility (how a user derives utility from individual relevant documents)
- utility accumulation model (describes how a user accumulates utility in the course of browsing)

Use models may be more or less artificial -> less correlated with actual user behaviour

### Rank biased precision
- the user starts from the top ranked document and with probability $p$ called persistence goes to the next document
- $p=.5$ -> impatient user
- $p=.8$ -> patient user
- $RBP=(1-p)\sum_{k\in R}p^{k-1}$
- note that RBP is independent from the recall base