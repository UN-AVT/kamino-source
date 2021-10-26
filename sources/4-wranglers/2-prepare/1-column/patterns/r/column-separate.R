# Required libraries
library(tidyverse)
library(dplyr)

####################################################################################
# Separate columns
f_column_separate <- function(df_column_separate,column_name,...) {
  df_column_separate %>% separate(column_name, ...,"/")
}

# Call the function with your values to the parameters
f_column_separate(df,'StateDate of Admission',c('day','month','year'))
####################################################################################


