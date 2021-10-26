# Required libraries
library(stringr)

####################################################################################
# Split a String by A Particular Pattern
f_split<- function(df_split, pattern){
  
  slist<-str_split(string = df_split,pattern = pattern)
  Code<-data.frame((Reduce(rbind,slist)))
}


# Call the function with your values to the parameters
df <- cbind(df,f_split(df$listed_in, ","), row.names=NULL)
####################################################################################