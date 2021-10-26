# Required libraries
#NA

####################################################################################
# Find Data that Differs
f_difference<- function(df_difference, column, entity) {
  print(subset(df_difference, !(column %in% entity)), row.names = FALSE)
}

# Call the function with your values to the parameters
f_difference(df, df$Continent, list)
####################################################################################
