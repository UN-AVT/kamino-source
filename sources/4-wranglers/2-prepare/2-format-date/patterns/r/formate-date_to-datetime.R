# Required libraries
#NA

####################################################################################
# Convert to Date-Time Format
f_dateTime <- function(df_dateTime) {
  as.POSIXct(df_dateTime, format = "%Y-%m-%dT%H",tz=Sys.timezone())
}

# Call the function with your values to the parameters
df$Time2 <- f_dateTime(df$Time)
####################################################################################
