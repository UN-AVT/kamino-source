# Required libraries
#NA

####################################################################################
# Find If Data is Alphabetical 
f_isalpha <- function(df_isalpha) {
  grepl("^[A-Za-z]+$", df_isalpha, perl = T)
}

# Call the function with your values to the parameters
f_isalpha(df$Users)
####################################################################################
