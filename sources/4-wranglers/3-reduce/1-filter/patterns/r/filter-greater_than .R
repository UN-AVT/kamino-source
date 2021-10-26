# Required libraries
library(tidyverse)
library(dplyr)

####################################################################################
# Method Where greater than (value types: numeric, date)
filter_greater_than <- function(df,column_name,value) {
  df%>% filter(column_name > value)
}

# Call the function to filter the data set
filter_greater_than(df,df$Population,"50000")
####################################################################################
