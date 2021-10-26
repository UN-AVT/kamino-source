# Required libraries
#NA

####################################################################################
# Find If Data is AlphaNumerical
f_isalphanum <- function(df_isalphanum) {
  grepl("^[0-9A-Za-z]+$", df_isalphanum, perl = T)
}

# Call the function with your values to the parameters
f_isalphanum(df$Operator.Owner)
####################################################################################
