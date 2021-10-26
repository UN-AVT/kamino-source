####################################################################################
# Required libraries
# Not Required

####################################################################################
# Right Join: Keep all records from the Right Table
f_right_join <- function(df_table_left, df_table_right) {
  right_join(df_table_left,df_table_right)
}

# Call the function 
f_right_join(df_left_table, df_right_table)
####################################################################################