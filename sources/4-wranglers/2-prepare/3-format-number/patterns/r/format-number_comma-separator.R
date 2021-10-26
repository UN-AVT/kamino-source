# Required libraries
#NA

####################################################################################
# Use comma seperators for numerical data
f_commasep<- function(df_commasep) {
  df_commasep<<-format(df_commasep, big.mark=",")
}

# Call the function with your values to the parameters
df_1$population <- f_commasep(df_1$population)
####################################################################################
