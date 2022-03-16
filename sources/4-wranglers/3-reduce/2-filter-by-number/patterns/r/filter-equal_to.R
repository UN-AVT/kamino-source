# Required libraries
library(tidyverse)
library(dplyr)

####################################################################################
# Filtering by value to be compared with a row_value within a column 
# Method Where equal 
filter_where_equal <- function(df_where_equal,column_name,value) {
  df_where_equal %>% filter(column_name == value)
}

# Call the function to filter the data set 
filter_where_equal(df,df$Continent,"Africa")
####################################################################################
