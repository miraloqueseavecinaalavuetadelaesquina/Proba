# Aproximaciones de??
ans <- 0
N <- 10000
for(i in 1:N){
  # sample(r) = A_i, evento
  r1 <- sample(1:6,2,replace = T)
  ans[i] <- sum(r1)/2 == round(sum(r1)/2)
}
mean(ans)

Omega <- expand.grid(1:6, 1:6)
espar <- rowSums(Omega)/2 == round(rowSums(Omega)/2)
mean(espar)
print(espar)
typeof(espar)

cbind(Omega, rowSums(Omega),espar)


# Definir funciones
probsumaPar <- function(n){
  ans <- 0
  N <- 10000
  for(i in 1:N){
    r1 <- sample(1:6,2,replace = T)
    ans[i] <- sum(r1)/2 == round(sum(r1)/2)
  }
  mean(ans)
}


probSumaMultk <- function(n,k) {
  ans <- 0
  N <- 10000
  for(i in 1:N){
    r1 <- sample(1:6,2,replace = T)
    ans[i] <- sum(r1)/k == round(sum(r1)/k)
  }
  mean(ans)
}
probsumaPar(9)

FX <- function(t){
  if(t<0) ans<-0
  if(t>=0 & t<1) ans <- 1/4
  if(t>=1 & t<2) ans <- 3/4
  if(t>=2) ans <- 1
  ans
}

FX <- Vectorize(FX)
tes <- seq(-4,4,length=100)
plot(tes, FX(tes))

# Otra forma
FX <- function(t){
  1/4 * (t>=0 & t<1) + 3/4 * (t>=1 & t<2) + 1 * (t>=2) 
}

FX <- Vectorize(FX)
tes <- seq(-4,4,length=100)
plot(tes, FX(tes))


X <- 1:100

bo <- TRUE + TRUE

if(bo) print("boo")

#  vector -> c(params)
#names(values) <- labels <=>  lengh(values)-lengh(names) = 0

# vector > n -> v[i]>n -> BOOL
# all/any(v) > n 
# which(v) > n  -- v[v>n] -- v[cond]->retorna vector de posiciones donde el condicional es verdader


