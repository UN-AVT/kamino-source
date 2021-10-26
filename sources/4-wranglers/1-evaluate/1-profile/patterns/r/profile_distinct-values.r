# Required libraries
library(tidyverse)

####################################################################################
# Display distinct values of a column
f_distinct_values <- function(df_distinct_values,...) {
  distinct(df_distinct_values,...) %>% arrange(...)
}

# Call the function with your values to the parameters
f_distinct_values(df,`Country name`)
####################################################################################
