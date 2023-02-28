# Required libraries
library(dplyr)

####################################################################################
# Calculate the percentage increase/decrease for each yeaar
f_percentage<- function(df_percentage){
  
  data <- df_percentage%>%
    group_by(Entity)%>%
    mutate(avg_hourly_wage_diff_men=(avg_hourly_wage_men/lag(avg_hourly_wage_men) - 1)*100)%>%
    mutate(avg_hourly_wage_diff_women=(avg_hourly_wage_women/lag(avg_hourly_wage_women) - 1)*100)%>%
    dplyr::select(Entity,Year,avg_hourly_wage_diff_men,avg_hourly_wage_diff_women)
  
  data <- na.omit(data)
  
  data$avg_hourly_wage_diff_men<-format(round(data$avg_hourly_wage_diff_men,1), nsmall=1)
  data$avg_hourly_wage_diff_men<-paste0(data$avg_hourly_wage_diff_men," %")
  
  data$avg_hourly_wage_diff_women<-format(round(data$avg_hourly_wage_diff_women,1), nsmall=1)
  data$avg_hourly_wage_diff_women<-paste0(data$avg_hourly_wage_diff_women," %")
  return(data)
}

# Call the function with your values to the parameters
df_2 <- f_percentage(df_1)
####################################################################################