# Required libraries
#NA

####################################################################################
# Extract Year from Date Data
f_year <- function(df_year) {
  temp <<- as.Date(df_year) #if not in Date Format
  format(temp,format="%Y")
}

# Call the function with your values to the parameters
df$Time2 <-f_year(df$Time)
####################################################################################
