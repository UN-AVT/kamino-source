# Required libraries
library(tidyverse)

####################################################################################
# Drop an entire row if one cell in a column is empty
f_drop_row <- function(df_drop_row,column_name) {
  df_drop_row[!is.na(column_name), ]
}

# Call the function with your values to the parameters
f_drop_row(df, df$Country) 
####################################################################################



