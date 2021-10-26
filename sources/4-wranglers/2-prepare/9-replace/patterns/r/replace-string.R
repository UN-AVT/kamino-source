# Required libraries
#Not Required

####################################################################################
# Replace a String of Characters
f_replace <- function(original, replace, df_replace){
  gsub(original, replace, df_replace)
}
# Call the function with your values to the parameters
df$MEASURE <- f_replace("\\(L)", "in Liter", df$MEASURE)
####################################################################################
