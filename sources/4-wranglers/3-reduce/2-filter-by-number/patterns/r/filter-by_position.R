# Required libraries
library(tidyverse)
library(dplyr)

####################################################################################
# Filtering by position of rows and/or columns 
filter_position <- function(df_position,row_var,column_var) {
  df_position[row_var,column_var]
}

# Call the function to filter the data set 
filter_position(df,c(4,10,100:600), c(1,3:5))
####################################################################################
