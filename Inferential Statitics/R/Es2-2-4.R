set.seed(12)
N = 1e+5

n=4
k=3

pdf_os3 <- function(x, k, n) {
    oo = n*choose(n-1, k-1)*dnorm(x)
    oo = oo * pnorm(x)**(k-1) * (1-pnorm(x))**(n-k)
    return(oo)
}

xval = seq(-3, 3, len=300)
fval = sapply(xval, pdf_os3, k=k, n=n)

X = matrix(rnorm(n*N), nrow=N, ncol=n)

kth_smallest <- function(x, k){
    x_sorted = sort(x)
    return(x_sorted[k])
}

xsim = apply(X, 1, kth_smallest, k=3)

hist(xsim, freq = F, breaks = 40) #F to specify it's a pdf
lines(xval, fval, type = "l", lwd = 2, col=2)