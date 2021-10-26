# Required libraries
library(tidyverse)

#########################################################################################
# Display frequency of the values of a column
f_frequency <- function(df_frequency,column) {
  
  df_tmp = table(column)
  as.data.frame(df_tmp) %>% 
    rename(Frequency_column=column ,Freq_absolute=Freq)  %>%
    mutate(Freq_relative=paste0(round(100*Freq_absolute/sum(Freq_absolute),digits=2),"%"))
  
}

# Call the function with your values to the parameters
f_frequency (df,df$Year)
#########################################################################################
