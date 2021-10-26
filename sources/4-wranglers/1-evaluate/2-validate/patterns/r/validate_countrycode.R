# Required libraries
library(countrycode)

####################################################################################
# Find if Data matches the Country Codes or Country Names
f_countrycode <- function(df_countrycode, ori, dest) {
  ori <- deparse(substitute(ori))
  dest <- deparse(substitute(dest))
  countrycode(df_countrycode, origin = ori, destination = dest)
}
# Call the function with your values to the parameters
func(df_11$iso, iso2c, country.name)
####################################################################################
