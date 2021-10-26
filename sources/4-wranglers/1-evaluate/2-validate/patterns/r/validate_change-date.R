# Required libraries
#NA

####################################################################################
# Change DataType to Date
f_change_date <- function(df_change_date) {
  as.Date(df_change_date)
}

# Call the function with your values to the parameters
df$DateofLaunch <- f_change_date(df$DateOfLaunch)
####################################################################################
