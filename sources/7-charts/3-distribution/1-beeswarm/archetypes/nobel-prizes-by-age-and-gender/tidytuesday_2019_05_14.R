
library(extrafont)

loadfonts(device = "win")

library(tidyverse)
library(ggthemes)
library(lubridate)
library(ggbeeswarm)

nobel_winners <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-05-14/nobel_winners.csv")

my_font <- "Lucida Sans"

base_color <- "#f5f3dc"

font_color <- "#42ac96" # or #213549

my_theme <- theme(text = element_text(family = my_font, color = font_color),
                  rect = element_rect(fill = base_color, color = NA), 
                  plot.background = element_rect(fill = base_color, color = NA), 
                  panel.background = element_rect(fill = base_color, color = NA), 
                  panel.border = element_blank(),
                  legend.background = element_rect(fill = base_color, color = NA),
                  legend.key = element_rect(fill = base_color),
                  plot.caption = element_text(size = 8, color = "#223a4f"),
                  axis.title.x = element_text(margin = margin(20,0,0,0)),
                  axis.title.y = element_text(margin = margin(0,20,0,0)),
                  plot.title = element_text(margin = margin(0,0,20,0), size = 14))

theme_set(theme_light() + my_theme)

plot_data <- nobel_winners %>% 
  mutate(age = prize_year - year(birth_date)) 

plot_data %>% 
  ggplot(aes(x = category, y = age, col = gender)) +
  geom_beeswarm(alpha = 0.7, size = .8) +
  coord_flip() +
  labs(title = "Nobel prizes by Age and Gender",
       x = "Category",
       y = "Age",
       caption = "Source: Kaggle \nVisualization by Jose M @Joseph_Mike",
       colour = "") +
  theme(legend.position = "top") +
  scale_color_manual(values = c("#70283D", "#E2525B")) 

ggsave("TidyTuesday_2019_05_14.png", width = 10, height = 6.5,device = "png", type = "cairo")



  