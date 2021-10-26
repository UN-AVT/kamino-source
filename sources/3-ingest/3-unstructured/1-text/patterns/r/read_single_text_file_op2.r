# Required libraries
library(tidyverse)
library(readtext)
library(readr)

####################################################################################
# Read a single text file - option#2 - read_file
load_data_text_2 <- function(data_source){
  txt <- read_file(paste(getwd(),data_source,sep="/"))
  
  as.data.frame(txt)
}
#Call the function to load the data
load_data_text_2("/archetypes/ghana-state-of-the-nation-addresses/sona_2008.txt")
####################################################################################