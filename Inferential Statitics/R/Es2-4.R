dd <- read.table("eggs.txt", header = T)
str(dd)

mu = 1/2 + -1 * dd$vol + 1*dd$height + 0.1*dd$roughness

theta = 1/(1+exp(-mu))

rbinom(100, size = 1, theta)