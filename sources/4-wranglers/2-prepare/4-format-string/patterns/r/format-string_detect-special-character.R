# Required libraries
library(stringr)

####################################################################################
# Detect String that has a Special Character
f_detect_sc<- function(df, df_detect_sc, character){
  
  df[str_detect(string = df_detect_sc,character),c('show_id','type','title','director','cast')]
}
# Call the function with your values to the parameters
df3 <- f_detect_sc(df, df$cast, '-')
####################################################################################