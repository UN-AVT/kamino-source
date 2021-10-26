# Required libraries
library(tidyverse)
library(readtext)
library(readr)

####################################################################################
# Read a single text file - Each line as a row - option#3
load_data_text_3 <- function(data_source){
  
  con <- file(paste(getwd(),data_source,sep="/"), blocking = FALSE)
  txt <- readLines(con)
  close(con)
  
  as.data.frame(txt)
}
#Call the function to load the data
load_data_text_3("/archetypes/ghana-state-of-the-nation-addresses/sona_2008.txt")
####################################################################################