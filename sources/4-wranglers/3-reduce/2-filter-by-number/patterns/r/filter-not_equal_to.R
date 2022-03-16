# Required libraries
library(tidyverse)
library(dplyr)

####################################################################################
# Method Where not equal  
filter_where_not_equal <- function(df_where_not_equal,column_name,value) {
  df_where_not_equal %>% filter(column_name != value)
}


# Call the function to filter the data set 
filter_where_not_equal(df,df$Continent,"Africa")
####################################################################################
