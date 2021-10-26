# Required libraries
library(tidyverse)
library(dplyr)

####################################################################################
# Method Where less than equal (value types: numeric, date)
filter_less_than_equal <- function(df,column_name,value) {
  df%>% filter(column_name <= value)
}

# Call the function to filter the data set
filter_less_than_equal(df,df$Population,"50000")
####################################################################################