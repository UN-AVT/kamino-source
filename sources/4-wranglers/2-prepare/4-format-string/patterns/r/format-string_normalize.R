# Required libraries
library(stringi)

####################################################################################
# Normalize Data
f_normalize<- function(df_normalize){
  
  stri_trans_nfd(df_normalize)
}
# Call the function with your values to the parameters
df$cast <- f_normalize(df$cast)
####################################################################################