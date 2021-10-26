# Required libraries
library(tidyverse)
library(DBI)
library(RSQLite)


####################################################################################
# Close database
close_database <- function(){
  dbDisconnect(conn)
}

#Call the function to load the data
close_database()
####################################################################################
