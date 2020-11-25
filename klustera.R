## Cargar CSV
library(readr)
fklustera <- read.csv("/home/rstudio/datascience-jalisco-b2/e.csv", stringsAsFactors = FALSE)
fklustera
str(fklustera)

## cargar libreria
library(tidyverse)
detach("package:dplyr", unload = TRUE)
library(dplyr)
#1) ¿Cuál es la sucursal que recibe mas conexiones?
#  Agrupar: branch_office
# Colapsar: suma de conexiones por sucursal
by_branch_office <- group_by(fklustera, branch_office)
by_branch_office
summarise(by_branch_office, total_conexiones = length(X))

#2) ¿Qué día de las semana tenemos mas visitantes?
#  Filtrar: visitor = true
#  Agrupar: day_of_week
#  Colapsar: Suma de visitantes por día
filter_visitor <- filter(fklustera, visitor == "true")
by_day_of_week <- group_by(filter_visitor, day_of_week_tz)
by_day_of_week
sumxdia <- summarise(by_day_of_week, total_visitantes = length(X))
arrange(sumxdia, desc(total_visitantes))

#3) ¿Cuál es el tiempo promedio de conexión de un visitante?
#  Filtrar: visitor = true
#  Colapsar: Promedio de tiempo de conexión
summarise(filter_visitor, promedio_tiempo = mean(tiempodeses) )


#4) ¿Cuantas persona por mes han realizado visitas?
#  filtrar: visitors = true
#  agrupar: por mes
#  colapsar: conteo
by_month <- group_by(filter_visitor, month_tz)
by_month
summarise(by_month, personas_x_mes = length(X))

#5) ¿A qué hora se registran más visitantes?
#  Filtrar: Obtener los registros por hora (hour_tz)
#Agrupar: Visitantes y no visitantes (visitor)
#Colapsar: Contar cuantos registros hay en cada grupo (count)
#Se compara cuantos registros de visitantes hay en cada hora.
str(fklustera)
filter_visitor <- filter(fklustera, visitor == "true")
by_hour <- group_by(filter_visitor, hour_tz)
sumxhora <- summarise(by_hour, conexiones_x_hora = length(X))
arrange(sumxhora, desc(conexiones_x_hora))

        