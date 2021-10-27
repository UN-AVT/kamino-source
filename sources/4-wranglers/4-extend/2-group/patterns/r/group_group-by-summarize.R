####################################################################################
# Required libraries
library(dplyr)
library(lazyeval)
####################################################################################
# Group More than One variable and Perform Calculation
f_groupby_sum <- function(data,column1_gr, column2_gr, column_sum) {
  data %>%
    group_by_(as.name(column1_gr), as.name(column2_gr)) %>%
    summarise_(SUM_COLUMN = interp(~sum(var, na.rm=T), var = as.name(column_sum)))
}
# Call the function passing your own arguments
f_groupby_sum(df, "Reported Year","Reported Month","Total Dead and Missing")
####################################################################################