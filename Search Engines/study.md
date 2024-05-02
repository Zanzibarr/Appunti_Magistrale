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

### Retrieval models
- problem: predict which documents are relevant
- goal: create a function that assigns scores to documents with regard to a given query

### Boolean model
- simplest
- index terms are present or absent in the document
- result isn't a ranking but a set of documents
- pros:
    - results are predictable
    - many features can be incorporated
    - efficient processing
- cons:
    - effectiveness depends on the query
    - doesn't take into account term frequency

### zipf's law
- distribution of word frequencies is skewed
- observation that the rank of a word times it's frequency is a constant

### term weighting
- not all terms are equally useful for describing the document contents
- a weight is associated to each term index

### Raw Frequency
- weight of a term is proportional to it's raw frequency
- significant words have a resolving power
- cons:
    - elimination of high frequency terms cause losses in recall
    - elimination of low frequency terms cause losses in precision

### Term frequency
- term frequency must be related to a specific document
- relative frequency measures terms occurring with substantial frequencies within a document, with a relatively low overall collection frequency

### Inverse Document Frequency
- measures exhaustivity of a document: coverage a term provides for the main topic
- measures specificity of a term: how well the term describes a document topic

### Vector space model
- goal: allow partial matching
- queries and documents are represented as vectors
- cosine used to compute the similarity
- the closer a document vector to a query vector, the higher the rank position
- the optimal query maximizes the difference between the average vector representing the relevant documents and the average vector representing the non-relevant ones
- advantages:
    - simple and fast
    - returns a ranking of documents
    - allows for partial matching
- disadvantages:
    - "bag of words": term proximity is not considered
    - heuristic nature: not solidly grounded in a theoretical framework

### Pseudo relevance feedback
- the system generates a document ranking from the initial query
- selected a small number of documents from the top ranking
- initiates an iteration of relevance feedback assuming the top documents are all relevant
- this method can suffer from wuery drift: documents used for relevance feedback contain few or no relevant document
- some queries will be imprved, other won't

### Probabilistic model
- A document is relevant if $P(r|d,q) > P(\overline{r}|d,q)$

### Language model
- A statistical language model is a probability distribution over word sequences
- can be context depentent
- use a model to generate text (generative model)
- unigram language models
    - assumes that a word sequence is generated by picking each word independently
    - assume a multinomial distribution in order to simplify computations and estimations
- a language model provides us with a principled way to quantify the uncertainties associated with the use of natural language
- common approach: MLE
- rank documents by the probability that the query text could be generated by the document language model
- for each document we estimate it's own language model and compute the probability of the query be generated by that document
- smoothing
    - if any of the query words are missing from the document, the score given by the whole query likelihood model will be zero
    - words associated with a topic should have some probability of occurrring, even if they where not mentioned in the document
    - lower the probability estimates for words that are seen in the document, and assign a leftover probability to the estimates for the words not seen in the document

### Indexing
- indexes are data structures designed to support search
- efficiency of an IR system:
    - indexing time
    - indexing space
    - index storage
    - query latency
- inverse index
    - mapping between terms and locations in documents
    - each document is given an unique number
    - each term is associated with a posting list (list of documents where the term appears)
- composed of:
    - inverted file, vocabulary, 
    - term statistics
    - collection statistics

### Distributed Indexing
- need to analyzer huge amounts of data
- large number of "inexpensive" servers rather than fewer expensive servers
- used MapReduce for distributed computing
- index merging: new documents are indexed, the existing index is merged with the new one
- with small amount of new data, a new smaller index is created and stored, then merged when it's big enough

### Query processing
- Document-at-a-time (DAAT), calculates complete scores for the documents by processing all term lists, one document at a time
- Term-at-a-time (TAAT), accumulates scores for documents by processing term lists one at a time

### Distributed query processing
- all queries sent to a director machine
- director sends messages to many index servers, which does some portion of the query processing
- director organizes the results
- organizzation:
    - document distrinution (the most popular)
        - each server acts as a search engine for a small fraction of the total collection
        - collection statistics should be shared for effective ranking
    - term distribution
        - single index
        - each inverted list is assigned to one index server
        - one of the index server is chosen to process the query and other index servers send information to that server
        - load balacing depends on the distribution of the query terms
- caching
    - 50% of the queries are unique, but some are very popular
    - 15% have never occurred before
    - caching improves effectiveness
    - caches must be refreshed to prevent stale data

### Lucene index
- composed of multiple sub-indexes (segments)
- searches might involve multiple segments
- inside:
    - info (metadata)
    - field names
    - inverted index
        - term dictionary
        - term frequency data
        - term proximity data
        - stored fields data
        - stored fields values
        - normalization factors
        - per document values
    - direct index (term vectors): for each field in each document term text and frequency might be stored
    - ...

### Lucene codec
- used to store the index in a text file (not for production, but for learning)

### Statistical hypostesis testing
- matematical framework to conduct statistical inference from the data
- compares the null hypotesis against an alternative hypotesis
- comparison is statistically significant if the data are unlikely to be a realisation of the null hypotesis with respect to a chosen threshold (significance level $\alpha$)
- types of error:
    - type 1 error: false positive (reject $H_0$ which is true)
        - concerns the comparison of 2 alternatives
        - multiple comparisone increases the type 1 error probability (easier to reject the null hypotesis even if I shouldn't since the comparisons are independent):  

        $$P(No\;type\;1\;errors)=(1-\alpha)^m$$
    - type 2 error: false negative (accept $H_0$ which is false)

### Student's test
- assume to have a random sample of size n from two normally distributed random variables with same variance
- define the difference among these two random variables: this follows the student's distribution with $k=n-1$ degrees of freedom
$$T=\frac{\hat{\mu}_D+\mu_D}{\sqrt{\hat{\sigma_D}^2/n}}\sim t(n-1)$$
- assumptions:
    - independence: topics and systems can be considered independent
    - normality: typical IR measures are bounded in [0,1] 
    - homoskedasticity: variance changes across systems
- it is considered robust to violations of normality and homoskedasticyty