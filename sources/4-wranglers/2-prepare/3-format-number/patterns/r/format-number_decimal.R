# Required libraries
#NA

####################################################################################
# Change numerical Data to Decimal Format
f_decimal <- function(df_decimal, num) {
  df_decimal <- format(round(df_decimal,num), nsmall=num)
}

# Call the function with your values to the parameters
df_1$avg_hourly_wage_men <-  f_decimal(df_1$avg_hourly_wage_men,3)
####################################################################################
