# Required libraries
library(tidyverse)
library(dplyr)

####################################################################################
# Method Where less than (value types: numeric, date)
filter_less_than <- function(df,column_name,value) {
  df%>% filter(column_name < value)
}

# Call the function to filter the data set
filter_less_than(df,df$Population,"50000")
####################################################################################