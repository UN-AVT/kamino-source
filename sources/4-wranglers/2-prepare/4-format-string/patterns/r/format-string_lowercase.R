# Required libraries
library(stringr)

####################################################################################
# Convert Char Data to LowerCase
f_lowercase<- function(df_lowercase) {
  str_to_lower(df_lowercase, locale = "en")
}


# Call the function with your values to the parameters
df$type <- f_lowercase(df$type)
####################################################################################
