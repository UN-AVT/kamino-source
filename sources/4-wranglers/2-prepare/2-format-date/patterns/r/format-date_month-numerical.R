# Required libraries
#NA

####################################################################################
# Extract Month (numerical) from Date Data
f_monthNum <- function(df_monthNum) {
  temp <<- as.Date(df_monthNum) #if not in Date Format
  format(temp,format="%m")
}

# Call the function with your values to the parameters
f_monthNum(df$Time)
####################################################################################
