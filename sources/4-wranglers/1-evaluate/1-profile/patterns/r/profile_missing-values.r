# Required libraries
library(tidyverse)

####################################################################################
# Count missing values 
f_missing_values <- function(df_missing_values) {
  purrr::map_df(df_missing_values, ~ sum(is.na(.))) %>%
    gather('Column name', 'Count of missing values')
}

# Call the function with your values to the parameters
f_missing_values(df)
####################################################################################
