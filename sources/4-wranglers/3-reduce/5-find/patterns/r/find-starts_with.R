# Required libraries
library(dplyr)
library(gdata)


####################################################################################
# Find Data Points that ends with  exact string
f_startswith <- function(df, df_startswith, string){
  df %>% filter(startsWith(df_startswith, string, ignore.case=TRUE))
}
# Call the function with your values to the parameters
f_startswith(df, df$country, 'a')
####################################################################################

