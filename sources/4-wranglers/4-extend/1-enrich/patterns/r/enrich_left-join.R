####################################################################################
# Required libraries
# Not Required

####################################################################################
# Inner Join: Match rows from both input tables
f_left_join <- function(df_table_left, df_table_right) {
  left_join(df_table_left,df_table_right)
}

# Call the function 
f_left_join(df_left_table, df_right_table)
####################################################################################