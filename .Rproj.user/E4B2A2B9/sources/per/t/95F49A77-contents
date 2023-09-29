
carapa <- read.csv("Datos/Mapeamento_parcelas_corregido.csv", header = T, sep = ";", stringsAsFactors = TRUE)	
head(carapa)

carapa$Parc <- as.factor(carapa$Parc)
carapa$Sub.P <- as.factor(carapa$Sub.P)
carapa$Prod. <- as.logical(carapa$Prod.)

str(carapa)
summary(carapa)


library(spatstat)
