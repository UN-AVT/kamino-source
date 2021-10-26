# Required libraries
library(tidyverse)
library(scales)
# Load dataset
df <- read.csv('file-path/file.csv')

# Remove NA value first
df <- na.omit(df)

# scientific
df_2<-df
df_2$COLUMN<-format(df_2$COLUMN,scientific = TRUE)

# comma separators

df_3<-df
df_3$COLUMN <-format(df_1$COLUMN, big.mark=",") 

# Long to readable

df_8<-df
df_8$COLUMN<-label_number_si(accuracy=0.1)(df_8$COLUMN)

# currencies

df_4<-df
df_4$COLUMN<-paste0("$ ", df_4$COLUMN)



# decimal
df_5<-df
df_5$COLUMN<-format(round(df_5$COLUMN,1), nsmall=1)

# percentage
df_6<-df

df_6$COLUMN<-paste0(df_6$COLUMN," %")


# Fraction

df_7<-df%>%mutate(fraction=as.character(fractions(COLUMN)))
