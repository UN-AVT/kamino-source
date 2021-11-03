# Required libraries
library(dplyr)


####################################################################################
# Find Data Points that ends with  exact string
f_endswith <- function(df, df_endswith, string){
  df %>% filter(endsWith(df_endswith, string))
}
# Call the function with your values to the parameters
f_endswith(df, df$country, 'a')
####################################################################################

