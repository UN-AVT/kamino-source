# Required libraries
library(tidyverse)
library(dplyr)

####################################################################################
# Combine columns
f_column_combine <- function(df_column_combine,...) {
  df_column_combine %>% unite( ..., sep = "_", remove = TRUE, na.rm = FALSE)
}

# Call the function with your values to the parameters
f_column_combine(df,"member_region",Member,UN_REGION_NAME)
####################################################################################


