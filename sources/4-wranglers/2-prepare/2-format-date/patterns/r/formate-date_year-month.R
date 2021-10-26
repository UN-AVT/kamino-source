# Required libraries
#NA

####################################################################################
# Extract Year-Month from Date Data
f_yearMonth <- function(df_yearMonth) {
  temp <<- as.Date(df_yearMonth) #if not in Date Format
  format(temp,format="%Y-%m")
}

# Call the function with your values to the parameters
df$Time2 <- f_yearMonth(df$Time)
####################################################################################
