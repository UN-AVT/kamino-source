# Required libraries
library(dplyr)

####################################################################################
# Sort by multiple columns
f_sev_col <- function(df, ...) {
  df %>% arrange(...)
}

# Call the function to filter the data set 
f_sev_col(df_1, df_1$carat, desc(df_1$price))
####################################################################################

