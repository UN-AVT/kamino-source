# Required libraries
library(dplyr)
library(stringr)


####################################################################################
# Find Data Points with an exact string
f_strfind <- function(df, df_strfind, string){
  df %>% filter(str_detect(df_strfind, string))
}
# Call the function with your values to the parameters
f_strfind(df, df$country, "USA")
####################################################################################

