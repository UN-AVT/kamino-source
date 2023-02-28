# Required libraries
#NA

####################################################################################
# Change numerical Data to Currency Format
f_currency <- function(df_currency) {
  df_currency <- paste0("$ ", df_currency)
}

# Call the function with your values to the parameters
df_1$avg_hourly_wage_men <-  f_currency(df_1$avg_hourly_wage_men)
####################################################################################
