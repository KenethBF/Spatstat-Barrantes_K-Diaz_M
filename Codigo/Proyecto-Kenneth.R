## Librerias
library(dplyr)
library(spatstat)


### Cargar set de datos
carapa <- read.csv("Datos/Mapeamento_parcelas_corregido.csv",
                   header = T,
                   sep = ";",
                   stringsAsFactors = TRUE)	
head(carapa)


# Funcion crear variables
randv <- function( x, y, z) {
  sample(seq(x, y, l = z), size = length(carapa$DAP), replace = TRUE)
} 

carapa$dbranch <- randv(0, 4, 5) # ramas muertas

carapa$vinec <- randv(0, 4, 5) # cobertura enredaderas

carapa$leafq <- randv(0, 4, 5) # carga de hojas

carapa$arth <- randv(0, 1, 2) # dano por artropodos

carapa$respr <- randv(0, 1, 2) # rebrote

carapa$cank <- randv(0, 1, 2) # cancros

carapa$height <- randv(1.5, 18, 1000) # altura arbol

carapa$repr <- sample(c("flower", # estatus reproductivo
                        "acorn",
                        "a_fall",
                        "n_repr"),
                      size = length(carapa$DAP),
                      replace = TRUE)


# convertir a factor
carapa <- carapa %>% mutate_at(c("Parc",
                                 "Sub.P",
                                 "NumAr",
                                 "vinec",
                                 "repr",
                                 "leafq"),
                               as.factor)

# convertir a logicos
carapa <- carapa %>% mutate_at(c("Prod.",
                                 "arth",
                                 "respr",
                                 "cank"),
                               as.logical)


head(carapa)
str(carapa)



