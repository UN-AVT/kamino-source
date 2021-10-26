# Required libraries
library(tidyverse)

####################################################################################
# Find structure: column name, column type and first rows
f_structure <- function(df_structure) {
  #glimpse(df_structure)
  #names(df_structure)
  #sapply(df_structure, class)
  #sapply(df_structure, typeof)
  
  str(df_structure)
}

# Call the function with your values to the parameters
f_structure(df)
####################################################################################
