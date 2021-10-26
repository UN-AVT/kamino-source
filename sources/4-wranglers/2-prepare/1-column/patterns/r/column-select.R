# Required libraries
library(tidyverse)
library(dplyr)

####################################################################################
# Select columns
f_column_select <- function(df_column_select,...) {
  df_column_select %>% select(...)
}

# Call the function with your values to the parameters
f_column_select(df,c(Member,'StateDate of Admission',UN_REGION_NAME))
####################################################################################

