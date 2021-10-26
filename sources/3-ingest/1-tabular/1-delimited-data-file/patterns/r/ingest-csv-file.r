# Required libraries
library(tidyverse)


####################################################################################
# Load data
load_data <- function(data_source){
  read_csv(paste(getwd(),data_source,sep="/"))
}

#Call the function to load the data
load_data("./archetypes/child-labor/average-working-hours-of-children.csv")
####################################################################################