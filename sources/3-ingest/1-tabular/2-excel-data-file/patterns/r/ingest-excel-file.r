# Required libraries
library(tidyverse)


####################################################################################
# Load data
load_data <- function(data_source, sheet_num){
  read_excel(paste(getwd(),data_source,sep="/"), sheet=sheet_num)
}

#Call the function to load the data
load_data("/archetypes/alcohol-consumption-by-country.xlsx",1)
####################################################################################