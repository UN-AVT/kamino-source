# Required libraries
library(stringr)

####################################################################################
# Combine Strings of Two Columns with a pattern
f_combine <- function(df_combine_1, df_combine_2){
  paste(df_combine_1,df_combine_2, sep=" - ")
}


# Call the function with your values to the parameters
df$country_release <- f_combine(df$country, df$release_year)
####################################################################################