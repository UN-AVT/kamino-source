# Required libraries
library(tidyverse)
library(jsonlite)


####################################################################################
# Load nested column
explore_nested_column <- function(nested_column){
  list1 <- nested_column
  as.data.frame(list1)
}

#Call the function to load the data
explore_nested_column (df$prizes.laureates[2])
####################################################################################