####################################################################################
# Required libraries
library(dplyr)
####################################################################################
# Unpivot a table
f_unpivot <- function(data,...) {
  
  data %>% 
    pivot_longer(!all_of(...),names_to = "MONTH", values_to = "TOTAL_DEAD")
}

# Call the function 
f_unpivot(df_3, 'Reported Year')
####################################################################################