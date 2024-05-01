import numpy as np

"""
DATOS:
Album con 640 figuritas
Cada figurita se imprime en cantidades iguales y se distribuye aleatoriamente
Cada paquete trae 5 figuritas
"""
#EJ 1- Simular el numero de una figurita elegida al azar si el album es de 6 figuritas
#si la distribucion es uniforme
a = np.random.randint(6)
print("EJ 1 Simulo la compra de una figurita: ", a)

#Ej 2- simular el llenado del album de 6 figuritas e indicar cuantas se debieron comprar para completarlo
album = []
cant_figus = 0
while len(album) < 6:
    figu = np.random.randint(1, 7)
    if figu not in album:
        album.append(figu)
    cant_figus+=1;

#print(album)
print("EJ 2 La cantidad de figus que necesito comprar para llenar el album de 6 figuritas es: ", cant_figus)

#EJ 3- 
def cuantasFigus(figusTotal):
    album = []
    cant_figus = 0
    while len(album) < figusTotal:
        figu = np.random.randint(1, figusTotal+1)
        if figu not in album:
            album.append(figu)
        cant_figus+=1;
    return cant_figus

n = 10
cant_figus = cuantasFigus(n)
#print("EJ 3", cant_figus)

#EJ 4
n = 1000
simu_n_veces = [cuantasFigus(6) for x in range(0, n)]

#puedo calcular la media poblacional a la antigua, sumando todos los resultados y dividiendo por el total de veces que corri el experimento
media = sum(simu_n_veces) / n
#o puedo usar numpy
media_1 = np.mean(simu_n_veces)
print("EJ 4-a El promedio de figuritas que debo comprar para llenar el album de 6 figuritas es: ", media_1)

#probabilidad de completar el album comprando 16 figuritas
#cuantos 'experimentos exitosos' hay? cuantas veces complete el album usando menos o igual cantidad de 16 figuritas?
menos_16_figs = [x for x in simu_n_veces if x <= 16]
#eventos exitosos sobre eventos totales 
prob_menos_16 = len(menos_16_figs)/n
print("EJ 4-b proba de llenar el album de 6 figuritas comprando 16 figuritas: ", prob_menos_16)

#numero de figuritas que hay que comprar para tener una probabilidad del 90% de completar el album?
num_figs = 16
proba = len([x for x in simu_n_veces if x <= num_figs])/n
while proba < 0.9:
    num_figs+=1;
    proba = len([x for x in simu_n_veces if x <= num_figs])/n

print(f"EJ 4-c se necesitan comprar {num_figs} figuritas para tener una proba del {proba} de llenar el album de 6 figuritas")
#EJ 5
n = 100
#simu_n_veces = [cuantasFigus(640) for x in range(0, n)]
#media = np.mean(simu_n_veces)
#print("EJ 5 ", media)

#EJ 6
#Un paquete sera un vector aleatorio con la misma distribucion de la variable aleatoria marginal
paquete = [np.random.randint(1, 640 + 1) for x in range(0, 5)]
#print(paquete)

#EJ 7
def genPaquete(figusTotal, figusPaquete):
    return [np.random.randint(1, figusTotal+1) for x in range(0, figusPaquete)]

#print(genPaquete(100, 5))

#EJ 8 
def cuantosPaquetes(figusTotal, figusPaquete):
    album = []
    cant_paquetes = 0
    while len(album) < figusTotal:
        paquete = genPaquete(figusTotal, figusPaquete)
        for figu in paquete:
            if figu not in album:
                album.append(figu)
        cant_paquetes+=1;
    return cant_paquetes

#print(cuantosPaquetes(640, 5))

#EJ 9
n = 100
figusTotal = 640
figusPaquete = 5
simu_n_veces = [cuantosPaquetes(figusTotal, figusPaquete) for x in range(0, n)]

media = np.mean(simu_n_veces)
print("Ej 9-a cantidad de paquetes promedio para completar album de 640: ", media)
print("Ej 9-a cantidad de figuritas promedio para completar album de 640: ", media*5) #cada paquete tiene 5 figuritas
 
#probabilidad de completar el album comprando 300 paquetes de figuritas
#cuantos 'experimentos exitosos' hay? cuantas veces complete el album usando menos o igual cantidad de 300 paquetes?
menos_300_paqs = [x for x in simu_n_veces if x <= 300]
#eventos exitosos sobre eventos totales 
prob_menos_300 = len(menos_300_paqs)/n
print("EJ 9-b probabilidad de completar album de 640 figus comprando 300 paquetes: ", prob_menos_300)
#vemos que la probabilidad es 0, pues no hubo eventos exitosos. Eso lo podemos ver en la lista
#print(menos_300_paqs)

#numero de figuritas que hay que comprar para tener una probabilidad del 90% de completar el album?
num_paqs = 300
proba = len([x for x in simu_n_veces if x <= num_paqs])/n
while proba < 0.9:
    num_paqs+=1;
    proba = len([x for x in simu_n_veces if x <= num_paqs])/n

print(f"EJ 9-c se necesitan comprar {num_paqs} paquetes para tener una proba del {proba} de llenar el album de 640 figuritas")

