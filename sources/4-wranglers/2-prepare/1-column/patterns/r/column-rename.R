# Required libraries
library(tidyverse)
library(dplyr)

####################################################################################
# Rename one or more columns 
f_rename_column <- function(df_rename,...) {
  rename(df_rename,...)
}

# Call the function with your values to the parameters
f_rename_column(df,c(MEMBER_STATE='Member', ADMISSION_DATE='StateDate of Admission'))
####################################################################################