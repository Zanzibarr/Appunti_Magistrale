x_sorted <- sort(c(8.935, 0.492, 6.951, 4.102, 0.111, 2.699, 3.255, 6.254, 2.120, 29.389))

n = length(x_sorted)

yq_1 = qexp((1:n)/(n+1))
yq_1over4 = qexp((1:n)/(n+1), rate = 1/4)
yq_4 = qexp((1:n)/(n+1), rate = 4)

plot(x_sorted, yq_1, pch=20, ylim=c(0,30))
points(x_sorted, yq_4, pch=21, col=2)
points(x_sorted, yq_1over4, pch=22, col=5)
abline(a=0, b=1, lwd=2, lty=2)

# Longer tail