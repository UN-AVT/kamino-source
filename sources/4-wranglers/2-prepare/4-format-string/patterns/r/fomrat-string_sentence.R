# Required libraries
library(stringr)

####################################################################################
# Convert String to a Sentence Format
f_sentence<- function(df_sentence) {
  str_to_sentence(df_sentence, locale = "en")
}


# Call the function with your values to the parameters
df$type <- f_sentence(df$type)
####################################################################################