# Required libraries
library(dplyr)

####################################################################################
# Sort a column by descending order 
f_sort_desc <- function(df, df_sort_desc) {
  df %>% arrange(desc(df_sort_desc))
}

# Call the function to filter the data set 
f_sort_desc(df_1, df_1$carat)
####################################################################################

