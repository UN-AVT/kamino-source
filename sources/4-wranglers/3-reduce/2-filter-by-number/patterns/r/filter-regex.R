# Required libraries
library(tidyverse)
library(dplyr)

####################################################################################
# Method Where Regular Expression 
filter_where_regex <- function(df,column_name,value) {
  df%>% filter(str_detect(column_name, value))
}

# Call the function to filter the data set
filter_where_regex(df,df$Country,"^A")
####################################################################################