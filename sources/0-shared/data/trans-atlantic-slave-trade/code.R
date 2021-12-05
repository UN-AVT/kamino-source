### CODE FOR FLOWMAP>BLUE ####

library(dplyr)
setwd("~/Flowmap/data")

port <- read.csv("port_info.csv")
from <- read.csv("data_1.csv")
merged <- merge(port, from, by = "Start")
#write.csv(merged, "from_data.csv")

from_data <- read.csv("from_data.csv")
merged <- merge(port, from_data, by = "Start")
#write.csv(merged, "purchase_data.csv")

purchase_data <- read.csv("purchase_data.csv")
merged <- merge(port, purchase_data, by = "Start")
#write.csv(merged, "end_data.csv")

end_data <- read.csv("end_data.csv")
from_purchase <- end_data %>% 
  group_by(From_ID, Purchase_ID) %>% 
  summarise(x = sum(Count))
#write.csv(from_purchase, "from_purchase.csv")

purchase_end <- end_data %>% 
  group_by(Purchase_ID, End_ID, Year) %>% 
  summarise(x = sum(Count))
#write.csv(purchase_end, "purchase_end.csv")

-------------------------------------------------

### CODE FOR R ###

#devtools::install_github("FlowmapBlue/flowmapblue.R")
library(flowmapblue)

flows <- read.csv('https://raw.githubusercontent.com/wandabodnar/flowmap/master/flows.csv')
locations <- read.csv('https://raw.githubusercontent.com/wandabodnar/flowmap/master/locations.csv')
mapboxAccessToken <- 'token'
flowmapblue(locations, flows, mapboxAccessToken, clustering = FALSE, darkMode = TRUE, animation = TRUE)
