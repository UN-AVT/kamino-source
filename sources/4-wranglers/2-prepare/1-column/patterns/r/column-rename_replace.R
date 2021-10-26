# Required libraries
library(tidyverse)
library(dplyr)

####################################################################################
# Rename multiple columns with the same rule 
f_rename_replace <- function(df_rename_replace,value) {
  set_names(df_rename_replace,~stringr::str_replace_all(.,value, ""))
}

# Call the function with your values to the parameters
f_rename_replace(df,"UN_")
####################################################################################