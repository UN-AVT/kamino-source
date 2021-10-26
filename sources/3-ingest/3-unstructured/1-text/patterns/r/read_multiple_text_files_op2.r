# Required libraries
library(tidyverse)
library(readtext)
library(readr)

####################################################################################
# Read multiple text files - option#2 - read_file
load_multiple_files_2 <- function(base_url){
  
  txt_files <- list.files(base_url, pattern="^sona_.*\\.txt$", full.names=TRUE, recursive=FALSE)
  
  txt_set_2 <- c()
  for (f in txt_files) {
    txt_set_2 <- c(txt_set_2, paste(read_file(f)))
  }
  as.data.frame(txt_set_2)
}
#Call the function to load the data
load_multiple_files_2("./archetypes/ghana-state-of-the-nation-addresses/")
####################################################################################