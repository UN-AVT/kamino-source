library(tidyverse)
library(ggtext)

esp_vida <- readxl::read_excel("dia_02/esperanza_vida.xlsx")

esperanza_tidy <- esp_vida %>% 
  pivot_longer(cols = 3:61, names_to = "anios", values_to = "valores") %>%
  mutate(anios = as.double(anios),
         colores = case_when(pais == "Camboya" ~ "Camboya",
                             pais == "Rwanda" ~ "Rwanda",
                             TRUE ~ "Otros"))


p1 <- 
  ggplot(esperanza_tidy, aes(anios, valores, group = pais)) +
  geom_line(size = 0.1, colour = "gray70") +
  geom_line(data = esperanza_tidy %>% filter(pais %in% c("Camboya", "Rwanda")),
            aes(anios, valores, group = pais,  colour = colores), size = 0.7) +
  scale_x_continuous(breaks = seq(1960, 2020, by = 10)) +
  scale_y_continuous(breaks = seq(0, 90, by = 20), limits = c(0, 90)) +
  scale_color_manual(values = c("#ffc50c", "#ec640f")) +
  labs(title = "El horror del genocidio en la esperanza de vida <br>de las mujeres de 
       <span style='color:#ffc50c'>**Camboya**</span> y <span style='color:#ec640f'>**Rwanda**</span>", 
       caption = "Fuente: Banco Mundial",
       x = "Año",
       y = "Esperanza de vida de mujeres (años)") + 
  theme_ybn_b(base_size = 11) +
  theme(legend.position = "none",
        plot.title = element_markdown(family = "Roboto Condensed",
                                      colour = "white",
                                      size = 25,
                                      hjust = 0.5))

ggsave("dia_02/02_lineas2.png", p1, height = 11, width = 8.5, units = "in", dpi = 400)

