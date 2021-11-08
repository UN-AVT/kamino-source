library(tidyverse)
library(tidyr)

df = read.csv("bar-vertical/archetypes/figure-2-11.csv", header = TRUE)
head(df)

long <- df %>% gather(type, value, -c(ï..Region))
levels(long$ï..Region) <- gsub(" ", "\n", levels(long$ï..Region))
gg<-ggplot(long, aes(y=value , x=ï..Region)) + 
  geom_col(aes(fill=type),position="stack") +
  labs(title = "Lone-parent households by age and sex of parent, age of child and region, latest available year")+
  theme( panel.background = element_rect(fill = "white"),axis.title.x=element_blank())+
  geom_text(aes(label=value), position = position_stack(vjust = 0.5),check_overlap = TRUE,color="white" )

print(gg)

