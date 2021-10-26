# Required libraries
#NA

####################################################################################
# Extract Month-Day (Alphabetical) from Date Data
f_monthDay <- function(df_monthDay) {
  temp <<- as.Date(df_monthDay) #if not in Date Format
  format(temp,format="%d %B")
}

# Call the function with your values to the parameters
df$Time2 <- f_monthDay(df$Time)
####################################################################################
