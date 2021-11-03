# Required libraries
library(dplyr)
library(stringr)

####################################################################################
# Find Data Points that contains any digits
f_containDigit <- function(df, df_containDigit){
  df %>% filter(str_detect(df_containDigit, "\\d"))
}
# Call the function with your values to the parameters
f_containDigit(df, df$institution)
####################################################################################
