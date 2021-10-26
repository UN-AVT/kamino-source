# Required libraries
library(tidyverse)

####################################################################################
# Replace an empty cell from a specific column with a new value
f_replace_value <- function(df_replace_value,column_name,value){
  df_replace_value[is.na(column_name),]$column_name <- value
}

# Call the function with your values to the parameters
f_replace_value(df,df$Loan_Expire_Date,"01/01/2030")
####################################################################################
