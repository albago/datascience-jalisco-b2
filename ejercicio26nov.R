#1. ¿Qué pasaría si trataras de pivotar esta tabla a lo ancho? ¿Por qué?
#  ¿Cómo podrías agregar una nueva columna que identifique de manera única cada valor?
#  personas <- tribble(
#    ~nombre, ~nombres, ~valores,
#    #-----------------|--------|------
#    "Phillip Woods", "edad", 45,
#    "Phillip Woods", "estatura", 186,
#    "Phillip Woods", "edad", 50,
#    "Jessica Cordero", "edad", 37,
#    "Jessica Cordero", "estatura", 156
#  )
personas <- tribble(
  ~nombre, ~nombres, ~valores, ~medicion,
  #-----------------|--------|------
  "Phillip Woods", "edad", 45, 1,
  "Phillip Woods", "estatura", 186, 1,
  "Phillip Woods", "edad", 50, 2,
  "Jessica Cordero", "edad", 37, 1,
  "Jessica Cordero", "estatura", 156, 1,
)
personas
pivot_wider(personas, names_from = nombres, values_from = valores)


#  2. Ordena la siguiente tabla. ¿Necesitas alargarla o ensancharla? ¿Cuáles son las variables?
#    embarazo <- tribble(
#      ~embarazo, ~hombre, ~mujer,
#      "sí", NA, 10,
#      "no", 20, 12
#    )
#  ¿Qué hacen los argumentos extra y fill en separate()? Experimenta con las diversas opciones a partir de los siguientes datasets de ejemplo.

embarazo <- tribble(
  ~embarazo, ~hombre, ~mujer,
  "sí", NA, 10,
  "no", 20, 12
)
embarazo
embarazo %>%
  pivot_longer(cols = c('hombre','mujer'), names_to = 'sexo', values_to = 'casos')

#  3. ¿Por qué falla el siguiente código?
#    tabla4a %>%
#    pivot_longer(c(1999, 2000), names_to = "anio", values_to = "casos")
#  #> Error: Can't subset columns that don't exist.
#  #> ✖ Locations 1999 and 2000 don't exist.
#  #> ℹ There are only 3 columns.


tabla4a
tabla4a %>%
  pivot_longer(c(`1999`, `2000`), names_to = "anio", values_to = "casos")

#  4. Tanto unite() como separate() tienen un argumento remove. ¿Qué es lo que hace? ¿Por qué lo dejarías en FALSE?
#    https://rdrr.io/cran/tidyr/man/separate.html
#  https://rdrr.io/cran/tidyr/man/unite.html