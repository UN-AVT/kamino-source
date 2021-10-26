# Required libraries
library(stringr)

####################################################################################
# Detect String that begins with Particular Alphabet
f_detect<- function(df, df_detect, letter){
  
  df[str_sub(string = df_detect,start=1, end=1)==letter,c('show_id','type','title','director','cast')]
}
# Call the function with your values to the parameters
df2 <- f_detect(df, df$director, 'C')
####################################################################################