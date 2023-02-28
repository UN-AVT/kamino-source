####################################################################################
# Required libraries
library(dplyr)
library(MASS)
####################################################################################


####################################################################################
# Convert to a Ratio and Fraction Format
f_fraction <- function(df_fraction){
  df_fraction%>%
    mutate(avg_hourly_wage_women_men_ratio=avg_hourly_wage_women/avg_hourly_wage_men)%>%
    mutate(fraction=as.character(fractions(avg_hourly_wage_women_men_ratio)))%>%
    dplyr::select(Entity,Year,avg_hourly_wage_women_men_ratio,fraction)
}

# Call the function with your values to the parameters
df_2 <- f_fraction(df_1)
####################################################################################