# Required libraries
library(tidyverse)
library(dplyr)

####################################################################################
# Rename all columns 
f_rename_all <- function(df_rename_all) {
  #names(df_rename_all) <- toupper(names(df_rename_all))
  names(df_rename_all) <- tolower(names(df_rename_all))
  df_rename_all
}

# Call the function with your values to the parameters
f_rename_all(df)
####################################################################################
