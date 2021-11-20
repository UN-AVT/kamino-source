####################################################################################
# Required libraries
#Not Required

####################################################################################
# Write a dataset to a .csv file
f_write_csv <- function(df_write_csv, path) {
  write.csv(df_write_csv, paste(getwd(), path,sep="/"))
}

# Call the function 
f_write_csv(df, "test.csv")
####################################################################################