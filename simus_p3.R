# Ej 3
# X ~ Bi(10,1/5)
# a. P(X>=2) = 1 - P(X<2)
res <- 1-pbinom(1,size=10, prob = 0.2)

# b.
# P(X>=2 | X>=1) = P(X>=2)/P(X>=1)

res <- (1-pbinom(1, size=10, prob = 0.2))/(1-pbinom(0, size=10, prob = 0.2))

# Ej 6
# X ~ Bi(n,p)
# n = k+r-1
# P(X=k | Y = r-1)
k <- 3
r <- 2
# p_kExitos_rfracasos <- 