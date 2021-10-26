# Required libraries
library(tidyverse)
library(dplyr)

####################################################################################
# Method Where between (value types: numeric, date)
filter_where_between <- function(df_where_between,column_name,value1,value2) {
  df_where_between %>% filter(between(column_name,value1,value2))
}

# Call the function to filter the data set 
filter_where_between(df,df$Population,"10000", "50000")
####################################################################################
