####################################################################################
# Required libraries
# Not Required

####################################################################################
# Anti Join: Record that has no matches
f_anti_join <- function(df_table_left, df_table_right) {
  anti_join(df_table_left,df_table_right)
}

# Call the function 
f_anti_join(df_left_table, df_right_table)
####################################################################################