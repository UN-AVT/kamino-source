# Required libraries
library(tidyverse)
library(DBI)
library(RSQLite)


####################################################################################
# Open database
open_database <- function(database_source){
  
  db <- dbDriver("SQLite")
  conn <- dbConnect(db,paste(getwd(),database_source,sep="/"))
  as.data.frame(dbListTables(conn))
}

#Call the function to load the data
open_database('/archetypes/mental-health/mental_health.sqlite')
####################################################################################
