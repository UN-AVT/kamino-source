# Required libraries
library(stringr)

####################################################################################
# Convert Char Data to UpperCase
f_uppercase<- function(df_uppercase) {
  str_to_upper(df_uppercase, locale = "en")
}


# Call the function with your values to the parameters
df$type <- f_uppercase(df$type)
####################################################################################
