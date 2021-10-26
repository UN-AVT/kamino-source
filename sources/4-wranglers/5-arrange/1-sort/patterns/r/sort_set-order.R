# Required libraries
library(dplyr)

####################################################################################
# Sort a Dataset by a given set order 
f_sort_ref <- function(df, df_sort_ref, ref) {
  df %>% arrange(factor(df_sort_ref, levels = ref))
}

# Call the function to filter the data set 
reference<-c('IF','VVS1','VVS2','VS1','VS2','SI1','SI2','I1')
f_sort_ref(df_1, df_1$clarity, reference)
####################################################################################

