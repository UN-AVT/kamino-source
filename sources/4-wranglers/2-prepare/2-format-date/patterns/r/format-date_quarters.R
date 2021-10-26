# Required libraries
#NA

####################################################################################
# Crete Quarter Column from Date Data
f_quarter <- function(df_quarter) {
  temp <<- as.Date(df_quarter) #if not in Date Format
  quarters(temp)
}

# Call the function with your values to the parameters
df$Time2 <- f_quarter(df$Time)
####################################################################################
