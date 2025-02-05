library(ggplot2)
library(esquisse)

#Analfabetismo
pesquisa<-c("2016","2017","2018","2019","2022","2023")
porcent<-c(9.3,8.8,8.8,8.4,8.0,7.4)
tab<-data.frame(pesquisa,porcent)
ggplot(tab) +
  aes(x = pesquisa, fill = porcent, weight = porcent) +
  geom_bar(position = "dodge") + 
  scale_fill_gradient(low = "#D5FF00", high = "#E21F1F") +
  labs(x = "Pesquisa(ano)", y = "Regsitros", title = "Taxa de analfabetsimo no estado do Pará", 
       subtitle = "intervalo temporal(2016 - 2023)", caption = "Fonte: IBGE\nAutor: Artur Maia", fill = "Porcentagem(%):")+
  geom_label(aes(x = pesquisa, y = porcent, label =porcent)) +
  coord_flip() +
  theme_linedraw() +
  theme(plot.title = element_text(size = 20L, face = "bold", hjust = 0.5), plot.subtitle = element_text(size = 18L, 
      face = "bold.italic", hjust = 0.5), plot.caption = element_text(size = 13L, face = "bold.italic"), 
        axis.title.y = element_text(size = 13L, face = "bold.italic"), axis.title.x = element_text(size = 13L, 
      face = "bold.italic"))