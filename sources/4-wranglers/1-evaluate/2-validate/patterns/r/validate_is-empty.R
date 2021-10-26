# Required libraries
#NA

####################################################################################
# Find If There is an empty data point
f_isempty<- function(df_isempty) {
  nchar(df_isempty)==0
}

# Call the function with your values to the parameters
f_isempty(df$Purpose)
####################################################################################
