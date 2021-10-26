# Required libraries
library(tidyverse)

####################################################################################
# Replace one element in any cell containing a specific value with another value
f_replace <- function(df_replace,value1,value2) {
  replace(df_replace, df_replace==value1, value2 )
}

# Call the function with your values to the parameters
f_replace(df,"value1","value2")
####################################################################################
