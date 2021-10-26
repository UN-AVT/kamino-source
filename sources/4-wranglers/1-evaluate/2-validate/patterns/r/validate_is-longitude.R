# Required libraries
#NA

####################################################################################
# Find If Data fits Longitude Maximums
f_longitude <- function(df_longitude) {
  df_longitude<180.0 |df_longitude>-180.0
}

# Call the function with your values to the parameters
f_longitude(df$Geo_Longitude)
####################################################################################