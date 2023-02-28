# Required libraries
library(sitools)

####################################################################################
# Convert from Long to Readable Format
f_readable<- function(df_readable) {
  df_readable<<-f2si(df_readable)
}

# Call the function with your values to the parameters
df_1$population <- f_readable(df_1$population)
####################################################################################
