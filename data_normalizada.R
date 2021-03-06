## Lendo as datas de grava��o
data_grava<-read.csv(
  file = "fmk_data_grava.csv", 
	header = FALSE, 
	col.names = c("id_musica_78rpm", "ano", "mes", "dia", "tipo")
)

## Atribuindo o tipo de data
data_grava$tipo<-"Grava��o"

## Limpando as NA do ano
bad <- is.na(data_grava)[ ,"ano"]
data_grava[bad, "ano"] <- ""

## Limpando as NA do dia
bad <- is.na(data_grava)[ ,"dia"]
data_grava[bad, "dia"] <- ""

## Lendo as datas de lancamento
data_lan�a<-read.csv(
	file = "fmk_data_lan�a.csv", 
	header = FALSE, 
	col.names = c("id_musica_78rpm", "ano", "mes", "dia", "tipo"),
)

## Atribuindo o tipo de data
data_lan�a$tipo<-"Lan�amento"

## Limpando a vari�vel dia
data_lan�a$dia<- ""

## Limpando as NA do ano
bad <- is.na(data_lan�a)[ ,"ano"]
data_lan�a[bad, "ano"] <- ""

## Lendo as datas promedio aproximadas de lan�amento
data_aprox<-read.csv(
  file = "fmk_data_aprox.csv", 
  header = FALSE, 
  col.names = c("id_musica_78rpm", "ano", "mes", "dia", "tipo")
)

## Atribuindo o tipo de data
data_aprox$tipo<-"C. promedio lan�amento"

## Limpando as vari�veis mes e dia
data_aprox$mes<-""
data_aprox$dia<-""

## Exportando os dados
data_mus<-rbind(data_grava, data_lan�a, data_aprox)
write.csv(data_mus, file="data_normalizada.csv")