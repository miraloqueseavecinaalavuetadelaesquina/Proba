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
