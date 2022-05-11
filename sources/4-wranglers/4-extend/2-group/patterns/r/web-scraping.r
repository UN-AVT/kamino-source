library(tidyverse)
library(rvest)
#library(tidyr)
#library(reactable)

setwd("C:/GitHub/Perso/kamino/solutions/b-ingest/web-scraping/r")

url = 'https://en.wikipedia.org/wiki/List_of_cities_by_sunshine_duration'

df = url %>% 
  read_html() %>%
  html_node(xpath = '//*[@id="mw-content-text"]/div[1]/table[2]') %>%
  html_table(fill = TRUE)

df

europe <- url %>% 
  read_html() %>%
  html_node(xpath = '//*[@id="mw-content-text"]/div[1]/table[4]') %>%
  html_table(fill = TRUE)

top_10_europe <- europe %>%
  mutate(num_year = as.numeric(gsub(",", "", Year))) %>% arrange(desc(num_year)) %>% 
  head(10) %>% 
  select(City, num_year) %>% rename(individual = City, value = num_year)

