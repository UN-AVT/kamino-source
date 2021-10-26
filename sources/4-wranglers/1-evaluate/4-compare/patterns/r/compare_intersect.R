# Required libraries
#NA

####################################################################################
# Find Data that Intersects
f_intersect <- function(df_intersect, column, entity) {
  print(subset(df_intersect, column %in% entity), row.names = FALSE)
}

# Call the function with your values to the parameters
f_intersect(df, df$Continent, list)
####################################################################################
