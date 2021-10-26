# Required libraries
library(stringr)

####################################################################################
# Remove Non Alpha-Numeric Characters
f_non_alphanum<- function(df_alphanum){
  
  str_replace_all(df_alphanum, "[^[:alnum:]]", " ") 
}
# Call the function with your values to the parameters
df$title_New <- f_non_alphanum(df$title)
####################################################################################