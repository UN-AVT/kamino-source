# Required libraries
library(tidyverse)
library(readtext)
library(readr)

####################################################################################
# Read a single text file - option#1 - readtext
load_data_text_1 <- function(data_source){
  txt <- readtext(paste(getwd(),data_source,sep="/"))
  as.data.frame(txt)
}
#Call the function to load the data
load_data_text_1("/archetypes/ghana-state-of-the-nation-addresses/sona_2008.txt")
####################################################################################