# Required libraries
#NA

####################################################################################
# Convert Double Format to Scientific Format
f_scientific <- function(df_scientific) {
  df_scientific<<-format(df_scientific,scientific = TRUE)
}

# Call the function with your values to the parameters
df_1$population <- f_scientific(df_1$population)
####################################################################################
