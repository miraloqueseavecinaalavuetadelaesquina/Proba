# x ~ Bi(n,p)
#n=15
probaprobar<-1-pbinom(7, size = 15,prob = 0.25)
#probaprobar <- sum(dbinom(8:15, size = 15,prob = 0.25 ))
probaprobar
sum(dbinom(8:15, size = 15,prob = 0.25 ))

# n=20
probaprobar<-1-pbinom(10, size = 20,prob = 0.25)
probaprobar

# caso general
ene<-8:20

probaprobar<-1-pbinom(pmax(7,ene/2), size = ene,prob = 0.25)

plot(ene,probaprobar,type="l",lwd=2,xlab="n")
points(ene,probaprobar,pch=16,col="red")

# sin restricciones de respuestas incorrectas
# si no hubiera restricciones sobre cantidad de respuestas
# incorrectas (instrucciones en R)
probaprobarsinrestric<-1-pbinom(7, size = ene,prob = 0.25)
plot(ene,probaprobarsinrestric,type="l",lwd=2,col="blue"
     ,xlab = "n")
points(ene,probaprobarsinrestric,col="blue",pch=16)
points(ene,probaprobar,pch=16,col="black")
lines(ene,probaprobar,lwd=2)
max(probaprobarsinrestric)
legend("topleft",c("sin restricciones","sistema actual"),
       pch=c(16,16),lwd=c(2,2),col=c("blue","black"))

# X ~ H(N,M,n)
# dnbinom(0, size = 4, prob = p)

# X ~ P(lambda)
#  p(X=x)dpois(x,lambda)

# Distribucions absolutamente continuas

# X ~ N()
# dnorm(x, mean, sd) -> calcula la fX (x) para X ∼ N (mean, sd2).
# pnorm(x, mean, sd) -> calcula la FX (k) para dicha distribución.
# qnorm(p, mean, sd) -> calcula el p−cuantil de la distribución de X ∼ N (mean, sd2)
# pnorm y qnorm son funciones inversas

# Exponencial
# X ∼ E(λ)

x <- seq(0.1, 4, 0.1)
y <- dgamma(x, shape=1/2, rate=3)
plot(x,y, type= "l")
y1 <- dgamma(x, shape=1, rate=3)
lines(x,y1,col=2)
y2 <- dgamma(x, shape=2, rate=3)
lines(x,y2,col=3)
y3 <- dgamma(x, shape=3, rate=3)
lines(x,y3,col=4)


#----------------------------------------------------
#
#Generacion de numeros al azar
#----------------------------------------------------
set.seed(07052020)
uu<-runif(1000)
uu[1:10]
xx<-qnorm(uu)


