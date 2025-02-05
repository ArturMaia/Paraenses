#Bibliotecas para usar
library(ggplot2)
library(esquisse)
library(plotly)
library(gganimate)
library(htmlwidgets)
library(plotrix)
library(scales)
library(RColorBrewer)
library(readxl)
#carregando arquivos tabelados(excel)
SISNAC <- read_excel("C:/ARTUR/Pará/SISNAC.xlsx")
SISM <- read_excel("C:/ARTUR/Pará/SISM.xlsx")
racas <- read_excel("C:/ARTUR/Pará/racas.xlsx")
Matricula <- read_excel("C:/ARTUR/Pará/Matricula.xlsx",col_types = c("text", "numeric", "numeric"))
#                     NASCIMENTO DE PARAENSES
#Gerando gráficos
grafico1<-SISNAC%>%
  ggplot(aes(Ano,natalidade))+
  labs(title="Natalidade do Estado do Pará",
       subtitle = "Registro temporal: (1996 - 2022)",
       x="Ano",
       y="Nascidos vivos")+
  geom_line(size=0.7,color="green")+
  geom_point(color="green",fill="green",shape=21,size=3.5)+
  theme_bw()
grafico2<-SISM%>%
  ggplot(aes(Ano,mortalidade))+
  labs(title="Mortalidade do Estado do Pará",
       subtitle = "Registro temporal: (1996 - 2022)",
       x="Ano",
       y="Nascidos vivos")+
  geom_line(size=0.7,color="red")+
  geom_point(color="red",fill="red",shape=21,size=3.5)+
  theme_bw()

#Deixando arquivos interativos e salvando
arquivo1 = ggplotly(grafico1)
arquivo1
arquivo2 = ggplotly(grafico2)
arquivo2
saveWidget(arquivo1,file = "natalidade.html")
saveWidget(arquivo2,file = "mortalidade.html")
#-------------------------------------------------------------------------------------------------------------------------------
#                   CARACTERÍSTICAS DA POPULAÇÃO PARAENSE
#Faixa etária de idade
cores<-brewer.pal(4,"Dark2") #cores do gráfico
fase<-c("Criancas","Jovens","Adultos","Idosos") #titulos
porc<-c(24.5,17.7,50.6,7.2)                       #valores
valores=paste(fase,"\n",porc,sep="")      #titulos+valores
pie3D(porc,radius=0.95,labels=valores,explode=0.1,main="Faixa etaria dos Paraenses(%)\n Ano(2022)",
      col=cores) #gráfico 

#raças
racial<-ggplot(racas) +
  aes(x = raca, fill = Percentual, weight = Quantidade) +
  geom_bar() + scale_fill_viridis_c(option = "inferno", direction = -1) +
  coord_flip()+
  scale_y_continuous(labels = unit_format(unit = "Milhões", scale = 1e-6))+
  labs(x = "Raça/Cor",y = "Registros",title = "Autodeclaração étnico-racial dos Paraenses (2022)",fill = "Registros(%):") +
  theme_gray() +
  theme(plot.title = element_text(size = 16L,face = "bold", hjust = 0.5), 
        axis.title.y = element_text(size = 14L,face = "bold.italic"),axis.title.x = element_text(size = 14L,face = "bold.italic"))
grafico = ggplotly(racial)
grafico
saveWidget(grafico,file = "racial.html")

#alfabetização
situacao<-c("Alfabetizados","Alfabetizados","Não alfabetizados","Não alfabetizados")
sexo<-c("Homens","Mulheres","Homens","Mulheres")
quantidade<-c(44.58,46.66,4.96,3.8)
tabela<-data.frame(sexo,quantidade,situacao)
ggplot(tabela) +
 aes(x = situacao, fill = sexo, weight = quantidade) +
 geom_bar(position = "dodge",color="black") +
 scale_fill_hue(direction = -1) +
 labs(x = "Alfabetização", y = "Quantidade(%)", title = "A alfabetização dos paraenses (2022)", 
 caption = "Fonte: IBGE", fill = "Sexo:") +
 theme_bw() +
 theme(plot.title = element_text(face = "bold", 
 hjust = 0.5), plot.caption = element_text(size = 10L, face = "bold.italic"), axis.title.y = element_text(face = "bold.italic"), 
 axis.title.x = element_text(face = "bold.italic"))

#educação
educa<-ggplot(Matricula, aes(x=Ano, y=Matriculas, color=Nivel)) +
  geom_line(size=1) +
  geom_point()+
  labs(title = "Evolução da expectativa de vida por continente",
       x = "Ano",
       y = "Matriculas",
       color = "Nível de ensino:")+
  theme_bw()
  matriculados = ggplotly(educa)
  matriculados