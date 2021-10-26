####################################################################################
# Required libraries
# Not Required

####################################################################################
# Full Outer Join: Keep all records from the Both Table
f_outer_join <- function(df_table_left, df_table_right) {
  full_join(df_table_left,df_table_right)
}

# Call the function 
f_outer_join(df_left_table, df_right_table)
####################################################################################