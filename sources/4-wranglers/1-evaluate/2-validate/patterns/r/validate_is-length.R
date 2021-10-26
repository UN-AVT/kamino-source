# Required libraries
#NA

####################################################################################
# Find Data with a specific length
f_islength<- function(df_islength, length) {
  nchar(df_islength)==length
}

# Call the function with your values to the parameters
f_islength(df$Perigee..km., 5)
####################################################################################
