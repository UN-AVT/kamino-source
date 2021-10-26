# Required libraries
#NA

####################################################################################
# Find If Data is Divisible by a certain number
f_divisible<- function(df_divisible, divisor) {
  df_divisible%%divisor==0
}

# Call the function with your values to the parameters
f_divisible(df$Perigee..km., 3)
####################################################################################
