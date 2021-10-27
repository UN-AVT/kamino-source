####################################################################################
# Required libraries
library(dplyr)
####################################################################################
# Unpivot a table
f_pivot <- function(data, cole, ...) {
  
  data %>% 
    pivot_wider(names_from = cole, values_from = sum_number) %>% 
    relocate(all_of(...),Jan , Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
}

# Call the function 
f_pivot(df_2, 'Reported Month', 'Reported Year')
####################################################################################