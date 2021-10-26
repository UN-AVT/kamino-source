# Required libraries
#NA

####################################################################################
# Extract Month (Alphabetical) from Date Data
f_monthAlpha <- function(df_monthAlpha) {
  temp <- as.Date(df_monthAlpha) #if not in Date Format
  format(temp,format="%b")
}

# Call the function with your values to the parameters
df$Month <- f_monthAlpha(df$Time)
####################################################################################