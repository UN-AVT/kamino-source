####################################################################################
# Required libraries
# Not Required

####################################################################################
# Concatanate Rows using two Dataframes
f_concatanate <- function(df_first, df_second) {
  bind_rows(df_first, df_second)
}

# Call the function 
f_concatanate(df_left_table, df_right_table)
####################################################################################