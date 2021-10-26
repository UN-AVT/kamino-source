# Required libraries
#NA

####################################################################################
# Find If Data is Date Datatype
f_date <- function(df_date) {
  class(df_date)=='Date'
}

# Call the function with your values to the parameters
f_date(df$DateOfLaunch)
####################################################################################
