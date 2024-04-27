# TP

#***********
#*Funciones
#***********

# Ej 3
cuantasFigus <- function(figusTotal){
  # Generamos album vacio
  album <- rep(T,times=figusTotal)
  cantFiguras <- 0
  vacias <- figusTotal
  while (vacias>0) {
    figura <- sample(1:figusTotal,1,replace = T)
    if(album[figura]){album[figura] <- F} # figura encontrada
    vacias <- sum(album)
    cantFiguras <- cantFiguras + 1
  }
  return(cantFiguras)
}



# Ej 7
genPaquete <- function(figusTotal, figusPaquete){
  return(sample(1:figusTotal,figusPaquete, replace = T))
}

# Ej 8
cuantosPaquetes <- function(figusTotal, figusPaquete){
  album <- rep(T,times=figusTotal)
  cantPaquetes <- 0
  vacias <- figusTotal
  while (vacias>0) {
    paquete <- genPaquete(figusTotal, figusPaquete)
    for (fig in 1:figusPaquete){
      if (album[paquete[fig]]){album[paquete[fig]] <- F} # figura encontrada
    }
    vacias = sum(album)
    cantPaquetes <- cantPaquetes + 1
  }
  return(cantPaquetes)
}

simuFiguritas <- function(figusTotal, figusPaquete=1, Nrep=10, tipoSimu=F){
  vec <- c()
  if(tipoSimu){
    for (i in 1:Nrep){
      experimento <- cuantosPaquetes(figusTotal, figusPaquete)
      vec[i] <- experimento
    }
  }else{
    for (i in 1:Nrep){
      experimento <- cuantasFigus(figusTotal)
      vec[i] <- experimento
    }
  }
  return(vec)
}


#***********
#*Ejercicios.
#***********

# Ej 1.
figurita <- sample(1:6,1)
print(figurita[1])

# Ej 2.
resultados <- cuantasFigus(figusTotal = 6)

# Ej 4.
## a
resultados <- simuFiguritas(figusTotal = 6,Nrep = 1000)
media <- mean(resultados)
print(paste("La cantidad de figuritas promedio para completar el album de 6 figuritas es : ", media))

## b La probabilidad de completar el album comprando 16 figuritas.
print(paste("La probabilidad de completar el albúm comprando 16 figuritas es : ", ifelse(16/media>=1,1, 16/media)))

## c El número de figuritas que hay que comprar para tener probabilidad del 90% de completar el álbum.
print(paste("El número de figuritas que hay que comprar para tener probabilidad del 90% de completar el álbum es :", floor(media*0.9)))


# Caso intermedio: consideremos ahora que el álbum es de figusTotal=640 figuritas y que las figuritas se siguen comprando individualmente.
# Ej 5.
resultados <- simuFiguritas(figusTotal = 640,Nrep = 100)
media <- mean(resultados)
print(paste("La cantidad de figuritas promedio para completar el album de 6 figuritas es : ", media))

# Ej 9.
resultados <- simuFiguritas(figusTotal = 640, figusPaquete = 5, Nrep = 100, tipoSimu = T)

## a.
media <- mean(resultados)
print(paste("La cantidad de figuritas promedio para completar el album de 6 figuritas es : ", media))

## b. La probabilidad de completar el álbum comprando 300 paquetes figuritas.
print(paste("La probabilidad de completar el álbum comprando 300 paquetes figuritas es : ", ifelse(300/media >=1, 1, 300/media)))

## c El número de figuritas que hay que comprar para tener probabilidad del 90% de completar el álbum.
print(paste("El número de paquetes que hay que comprar para tener probabilidad del 90% de completar el álbum es :", floor(media*0.9)))

