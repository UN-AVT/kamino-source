# Required libraries
#NA

####################################################################################
# Convert Character Format to Date Format
f_chardate <- function(df_chardate) {
  as.Date(df_chardate)
}

# Call the function with your values to the parameters
df$Time2 <- f_chardate(df$Time)
####################################################################################
