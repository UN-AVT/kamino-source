# Required libraries
library(dplyr)

####################################################################################
# Sort a column by ascending order 
f_sort_asc <- function(df, df_sort_asc) {
  df %>% arrange(df_sort_asc)
}

# Call the function to filter the data set 
f_sort_asc(df_1, df_1$carat)
####################################################################################

