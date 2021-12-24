# Fuente: https://www.cia.gov/library/publications/the-world-factbook/fields/264rank.html

library(tidyverse)
library(treemapify)

petroleo <- readxl::read_excel("dia_14/petroleo.xlsx")

petroleo <- petroleo %>% 
  mutate(barriles = scales::comma(barriles_millones),
         etiqueta = str_c(pais, "\n", barriles)) %>% 
  filter(barriles_millones > 1000)

p1 <- 
  ggplot(petroleo, aes(area = barriles_millones,
                       label = etiqueta))+
  geom_treemap(colour = "#FDFDFB", 
               fill = "#131423", 
               size = 1.5) +
  geom_treemap_text(colour = "#FDFDFB", 
                    place = "topleft", 
                    min.size = 0, 
                    family = "Roboto Condensed Light",
                    reflow = T,
                    size = 12) +
  labs(title = "Los países con mayores reservas de petróleo, en millones de barriles",
       subtitle = "Países con reservas superiores a 1,000 millones de barriles",
       caption = "Fuente: The World Factbook - CIA") +
  theme_ybn_w()

ggsave("dia_14/14_treemap.png", p1, height = 8.5, width = 11, units = "in", type = "cairo")

