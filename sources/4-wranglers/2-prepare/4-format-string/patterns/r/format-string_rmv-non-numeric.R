# Required libraries
library(stringr)

####################################################################################
# Remove Non Numeric Characters
f_rmv_non_numeric<- function(df_rmv_non){
  
  gsub("[^0-9]", "", df_rmv_non)
}
# Call the function with your values to the parameters
df$show_id <- f_rmv_non_numeric(df$show_id)
####################################################################################