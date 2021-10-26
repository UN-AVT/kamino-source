# Required libraries
library(tidyverse)
library(DBI)
library(RSQLite)


####################################################################################
# Load database table
load_database_table <- function(table_name){
  dbReadTable(conn, table_name)
}

#Call the function to load the data
load_database_table('Question')
####################################################################################
