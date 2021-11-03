# Required libraries
library(dplyr)
library(stringr)

####################################################################################
# Find Data Points that contains any digits
f_notContain <- function(df, df_notContain, string){
  df %>% filter(!str_detect(df_notContain, string))
}
# Call the function with your values to the parameters
f_notContain(df, df$institution, "University")
####################################################################################
