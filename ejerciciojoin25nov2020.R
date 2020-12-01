#install.packages('datos')
library(nycflights13)
library(dplyr)
??flights
#1.- Filtra los vuelos para mostrar únicamente los aviones que han realizado al menos cien viajes.

# Sin pipes

groupflights <- group_by(flights, tailnum)
flightscount <- count(groupflights)
planesmore100 <- filter(flightscount, n>99)
a1 <- right_join(planesmore100,flights, by="tailnum")

#con pipes

a1 <- group_by(flights, tailnum) %>%
  count() %>%
  filter(n>99) %>%
  left_join(flights, by="tailnum")

#2.- Combina datos::vehiculos y datos::comunes para encontrar los registros de los modelos más comunes.
View(datos::vehiculos)
View(datos::comunes)

vcomunes <- left_join(datos::comunes, datos::vehiculos)
vcomunes

#3.- Encuentra las 48 horas (en el transcurso del año) que tengan los peores atrasos. Haz una referencia cruzada con la tabla clima.
#¿Puedes observar patrones?

datos::vuelos
summary(datos::vuelos$atraso_salida)
vuelos_retrasados <- arrange(datos::vuelos, -atraso_salida, -atraso_llegada)
# Obtener los 48 vuelos mas atrasados
vuelos_48hrs <- vuelos_retrasados[1:48,]
vuelos_48hrs
#clima
datos::clima
vuelosclima <- vuelos_48hrs %>%
  left_join(datos::clima)
vuelosclima


#4.-  ¿Qué te indica anti_join(vuelos, aeropuertos, by = c("destino" = "codigo_aeropuerto"))? 
# ¿Qué te indica anti_join(aeropuertos, vuelos, by = c("codigo_aeropuerto" = "destino"))?

anti_join(datos::vuelos, datos::aeropuertos, by = c("destino" = "codigo_aeropuerto"))
anti_join(datos::aeropuertos, datos::vuelos, by = c("codigo_aeropuerto" = "destino"))

