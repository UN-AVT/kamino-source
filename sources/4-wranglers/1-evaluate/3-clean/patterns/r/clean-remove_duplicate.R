# Required libraries
library(tidyverse)

####################################################################################
# Remove duplicates
f_remove_duplicates <- function(df_remove_duplicates){
  unique(df_remove_duplicates)
}

# Call the function with your values to the parameters
f_remove_duplicates(df)
####################################################################################