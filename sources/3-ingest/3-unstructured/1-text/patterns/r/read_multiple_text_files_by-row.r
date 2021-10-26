# Required libraries
library(tidyverse)
library(readtext)
library(readr)

####################################################################################
# Read multiple text files - Each line as a row - option#3
load_multiple_files_3 <- function(base_url){
  
  txt_files <- list.files(base_url, pattern="^sona_.*\\.txt$", full.names=TRUE, recursive=FALSE)
  
  txt_set_3 <- c()
  for (f in txt_files) {
    txt_set_3 <- c(txt_set_3, paste(read_lines(f)))
  }
  as.data.frame(txt_set_3)
  
}
#Call the function to load the data
load_multiple_files_3("./archetypes/ghana-state-of-the-nation-addresses/")
####################################################################################