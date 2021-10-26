# Required libraries
library(tidyverse)
library(readtext)
library(readr)

####################################################################################
# Read multiple text files - option#1 - readtext
load_multiple_files_1 <- function(base_url){
  
  txt_files <- list.files(base_url, pattern="^sona_.*\\.txt$", full.names=TRUE, recursive=FALSE)
  
  txt_set_1 <- c()
  for (f in txt_files) {
    txt_set_1 <- c(txt_set_1, paste(readtext(f)))
  }
  as.data.frame(txt_set_1)
}
#Call the function to load the data
load_multiple_files_1("./archetypes/ghana-state-of-the-nation-addresses/")
####################################################################################