# Required libraries
library(tidyverse)
library(ggplot2)


#########################################################################################
# Display histograms of numerical variable
f_histogram <- function(df_histogram,column_1,column_2) {
  
  column_name1=deparse(substitute(column_1))
  column_name2=deparse(substitute(column_2))    
  
  df_long <- df_histogram %>%
    pivot_longer(
      column_name1:column_name2,
      names_to = "measure",
      values_to = "value"
    )
  
  ggplot(df_long, aes(x=value)) +
    geom_histogram(fill = "#79B8E5") +
    facet_wrap(~ measure, scales="free")+
    theme(panel.grid = element_blank(), 
          strip.background = element_blank(),
          panel.background = element_blank()
    ) 
  
  
}

# Call the function with your values to the parameters
f_histogram (df,`Life Ladder`,`Most people can be trusted, WVS round 2010-2014`)
#########################################################################################