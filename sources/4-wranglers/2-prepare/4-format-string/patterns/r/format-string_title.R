# Required libraries
library(stringr)

####################################################################################
# Convert String to a Title Format (Capitalizes Each Word)
f_title<- function(df_title) {
  str_to_title(df_title, locale = "en")
}


# Call the function with your values to the parameters
df$title <- f_title(df$title)
####################################################################################