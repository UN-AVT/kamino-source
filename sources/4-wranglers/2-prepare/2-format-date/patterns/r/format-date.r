
# Required libraries
library(tidyverse)

# Load dataset
df <- read.csv('file-path/file.csv')

# Convert character format into date format 

df_1 <- df
df_1$COLUMN1 <- as.Date(df$COLUMN1)

# Convert into time format, if it's hourly data
df_2 <- df
df_2$COLUMN1 <-as.POSIXct(df_2$COLUMN1, format = "%Y-%m-%dT%H",tz=Sys.timezone())

# Quarter

df_3 <- df
df_3$Quarter <-quarters(df_2$COLUMN1)

# Year

df_4 <- df_2
df_4$Year <- format(df_2$COLUMN1,format="%Y")

# Year_Month

df_5 <- df_2
df_5$Year_Month <-format(df_2$COLUMN1,format="%Y-%m")

# Month

df_6 <- df_2
df_6$Month_Num <-format(df_2$COLUMN1,format="%m")
df_6$Month_ABR <-format(df_2$COLUMN1,format="%b")

# Month_Day

df_7 <- df_2
df_7$MM_DD_Num <- format(df_2$COLUMN1,format="%m-%d")
df_7$DD_MM_Name <- format(df_2$COLUMN1,format="%d %B")