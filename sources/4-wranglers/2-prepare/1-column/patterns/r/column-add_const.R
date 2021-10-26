# Required libraries
library(tidyverse)
library(dplyr)

####################################################################################
# Add a column with a constant value 
f_column_const <- function(df_column_const,...) {
  add_column(df_column_const,...)
}

# Call the function with your values to the parameters
f_column_const(df,new_col=('I am new'))
####################################################################################

