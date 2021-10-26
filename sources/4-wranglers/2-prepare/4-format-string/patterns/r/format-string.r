
# Required libraries
library(tidyverse)

# Load dataset
df <- read.csv('file-path/file.csv')


# Convert Case
# Uppercase

df$COLUMN<-str_to_upper(df$COLUMN, locale = "en")

# Lowercase

df$COLUMN<-str_to_lower(df$COLUMN, locale = "en")

# Sentence

df$COLUMN<-str_to_sentence(df$COLUMN, locale = "en")

# Title 

df$COLUMN<-str_to_title(df$COLUMN, locale = "en")

# Combine by separator " - "

df$COMBINED<-paste(df$COLUMN1,df$COLUMN2, sep=" - ")


# Split by pattern " - "

slist<-str_split(string = df$COMBINED,pattern = "[-]")

Code<-data.frame((Reduce(rbind,slist)))

df<-cbind(df,Code)




# Truncate 
list<-str_sub(string = df$COLUMN,start=starting_position,end=ending_position)
NEW_COLUMN<-data.frame((Reduce(rbind,list)))
df<-cbind(df,NEW_COLUMN)

# Remove non-numeric characters

df$COLUMN<- gsub("[^0-9]", "", df$COLUMN)


# Remove non-alpha-numeric characters

df$COLUMN<-str_replace_all(df$COLUMN, "[^[:alnum:]]", " ") 


