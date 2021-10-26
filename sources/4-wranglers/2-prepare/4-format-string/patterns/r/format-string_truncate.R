# Required libraries
library(stringr)
library(dplyr)

####################################################################################
# Truncate a String so that only numbers are displayed
f_truncate<- function(df_truncate, data){
  
  list<-str_sub(string = df_truncate,start=2,end=5)
  id<-data.frame((Reduce(rbind,list)))
  data<-cbind(data,id)
  rownames(data) <- NULL
  data<-data%>%rename(id=X.Reduce.rbind..list..)
}
# Call the function with your values to the parameters
df2 <- f_truncate(df$show_id, df)
####################################################################################