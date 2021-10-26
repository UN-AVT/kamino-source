# Required libraries
library(tidyverse)
library(dplyr)

####################################################################################
# Method Where not between (value types: numeric, date)
filter_where_not_between <- function(df,column_name,value1,value2) {
  df%>% filter(!between(column_name,value1,value2))
}

# Call the function to filter the data set
filter_where_not_between(df,df$Population,"10000", "50000")
####################################################################################