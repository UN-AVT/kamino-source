# Required libraries
#NA

####################################################################################
# Extract Several Date Formats by substituting "type"
f_dateType <- function(df_dateType, type) {
  temp <<- as.Date(df_dateType) #if not in Date Format
  format(temp,format=type)
}

# Call the function with your values to the parameters
df$Time2 <- f_dateType(df$Time, "%d %B")
####################################################################################