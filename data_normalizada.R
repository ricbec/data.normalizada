## Lendo as datas de gravação
data_grava<-read.csv(
  file = "fmk_data_grava.csv", 
	header = FALSE, 
	col.names = c("id_musica_78rpm", "ano", "mes", "dia", "tipo")
)

## Atribuindo o tipo de data
data_grava$tipo<-"Gravação"

## Limpando as NA do ano
bad <- is.na(data_grava)[ ,"ano"]
data_grava[bad, "ano"] <- ""

## Limpando as NA do dia
bad <- is.na(data_grava)[ ,"dia"]
data_grava[bad, "dia"] <- ""

## Lendo as datas de lancamento
data_lança<-read.csv(
	file = "fmk_data_lança.csv", 
	header = FALSE, 
	col.names = c("id_musica_78rpm", "ano", "mes", "dia", "tipo"),
)

## Atribuindo o tipo de data
data_lança$tipo<-"Lançamento"

## Limpando a variável dia
data_lança$dia<- ""

## Limpando as NA do ano
bad <- is.na(data_lança)[ ,"ano"]
data_lança[bad, "ano"] <- ""

## Lendo as datas promedio aproximadas de lançamento
data_aprox<-read.csv(
  file = "fmk_data_aprox.csv", 
  header = FALSE, 
  col.names = c("id_musica_78rpm", "ano", "mes", "dia", "tipo")
)

## Atribuindo o tipo de data
data_aprox$tipo<-"C. promedio lançamento"

## Limpando as variáveis mes e dia
data_aprox$mes<-""
data_aprox$dia<-""

## Exportando os dados
data_mus<-rbind(data_grava, data_lança, data_aprox)
write.csv(data_mus, file="data_normalizada.csv")