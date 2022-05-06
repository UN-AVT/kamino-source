

# Text-Analytics Mini Project: Web-Scraping Online News

# Features:

#1. Scrape sudanspost.com for the latest news articles for text analysis.
#2. Automate the R-script daily/hourly to get the latest analytics/updates
#3  Email notification system for certain triggers


# Methods:

# 1. Web Scrape using rvest and chrome extension. In our case, headlines, date, articles, links.

# 2. Save the scraped data into csv for further use

# 3. KEYWORD CATCHER: capture keywords such as "Breaking News"

# 4. Send an email whenever a keyword is triggered.

# 5. Perform Word-Frequency Analysis and Save Plots 

# 6. Perform Sentiment Analysis and Save Plots

# 7. Create a Batch File so that we can knit html file, save csv/plots

# 8. Use Windows Task Scheduler to automate the R-script








################### Web Scraping Part ###################

library(rvest)
library(dplyr)

url = "https://www.sudanspost.com/"
page = read_html(url)

headlines <- page %>%
  html_nodes(".jeg_post_title a") %>%
  html_text()

links <- page %>%
  html_nodes(".jeg_post_title a") %>%
  html_attr("href")



sudan_post <- data.frame(headlines,links)


summary <- list()
timearticle <- list()
body <- list()

for (i in sudan_post$links){
  url1 <- read_html(i)
 
   summ <- url1 %>%
    html_node(".jeg_post_subtitle") %>%
    html_text()
  summary <- append(summary, summ)
  
  datar <- url1 %>%
    html_node(".jeg_meta_date a") %>%
    html_text()
  timearticle <- append(timearticle, datar)
  
  bodies <- url1 %>%
    html_node(".content-inner p")%>%
    html_text()
  bodies <- paste (bodies, collapse = " ")
  body <- append(body, bodies)
  
}

sudan_post$summary <- as.character(summary)
sudan_post$body <- as.character(body)
sudan_post$date <- as.character(timearticle)




csvname <- as.character(Sys.Date())
csvname2 <- paste0(csvname, "sudanpost.csv")
write.csv(sudan_post, csvname2)

################## End Web Scraping############################


################# Keyword Catcher and Email Notification#######
test <- sudan_post
test$body <- tolower(test$body)

x <- grep("covid", test$body)
email <- sudan_post[x,]
email

library(mailR)

if (nrow(email)>0){


from <- "<minthihamyo@gmail.com>"
to <- "<minthihamyo@gmail.com>"
subject <- "Sudan Post Keyword Notification"
body <- email

send.mail(from=from,to=to, subject=subject, body= body, control=mailControl,
smtp = list(host.name = "smtp.gmail.com", port = 587, user.name = "youremail", passwd =    "password", tls = TRUE),
authenticate = TRUE,
send = TRUE)
}
#####################################################


################# Corpus and Stop Word of HEADLINES ######################

library(tm)

TextDoc <- VCorpus(VectorSource(sudan_post$headlines))

# Convert the text to lower case
TextDoc <- tm_map(TextDoc, content_transformer(tolower))
# Remove numbers
TextDoc <- tm_map(TextDoc, removeNumbers)
# Remove english common stopwords
TextDoc <- tm_map(TextDoc, removeWords, stopwords("english"))
# Remove punctuations
TextDoc <- tm_map(TextDoc, removePunctuation)
# Remove your own stop word ("South" and "sudan")
TextDoc <- tm_map(TextDoc, removeWords, c("south", "sudan", "sudans", "sudanese", "breaking", "us", "united states", "says")) 

#############################################




############### Word Frequency and Plot ###############

# Build a term-document matrix
TextDoc_dtm <- TermDocumentMatrix(TextDoc)
dtm_m <- as.matrix(TextDoc_dtm)
# Sort by descearing value of frequency
dtm_v <- sort(rowSums(dtm_m),decreasing=TRUE)
dtm_d <- data.frame(word = names(dtm_v),freq=dtm_v)
# Display the top 5 most frequent words
head(dtm_d, 5)


# Plot the most frequent words

jpegname <- paste0(csvname, "headlines_word_frequency.jpeg")
jpeg(jpegname, width = 800, height = 600, quality = 100)
barplot(dtm_d[1:15,]$freq, las = 2, names.arg = dtm_d[1:15,]$word,
        col ="steelblue", main ="Top 15 most frequent words",
        ylab = "Word frequencies")
dev.off()
###############################


#################### Word Cloud ############################

library(wordcloud)

set.seed(1234)
wordcloud(words = dtm_d$word, freq = dtm_d$freq, min.freq = 4,
          random.order=FALSE, rot.per=0.40, 
          colors=brewer.pal(8, "Dark2"))


###################### End Word Cloud #######################




################ Sentiment Analysis ###########
library("syuzhet")

ss <- sudan_post$headlines

syuzhet_vector <- get_sentiment(ss, method="syuzhet")

# see summary statistics of the vector
sahead <- summary(syuzhet_vector)
sahead
head(syuzhet_vector)


d<-get_nrc_sentiment(ss)
library(ggplot2)
td<-data.frame(t(d))
#The function rowSums computes column sums across rows for each level of a grouping variable.
td_new <- data.frame(rowSums(td))
#Transformation and cleaning
names(td_new)[1] <- "count"
td_new <- cbind("sentiment" = rownames(td_new), td_new)
rownames(td_new) <- NULL
td_new3<-td_new[1:8,]
#Plot One - count of words associated with each sentiment


jpegname2 <- paste0(csvname, "sentiment_headlines.jpeg")
jpeg(jpegname2, width = 800, height = 600, quality = 100)
quickplot(sentiment, data=td_new3, weight=count, geom="bar", fill=sentiment, ylab="count")+ggtitle("Emotion sentiments of Headlines")
dev.off()
##########################################################


####################Analyze the body of the Article ##############


################# Corpus and Text Mining ######################

library(tm)

TextDoc2 <- VCorpus(VectorSource(sudan_post$body))

# Convert the text to lower case
TextDoc2 <- tm_map(TextDoc2, content_transformer(tolower))
# Remove numbers
TextDoc2 <- tm_map(TextDoc2, removeNumbers)
# Remove english common stopwords
TextDoc2 <- tm_map(TextDoc2, removeWords, stopwords("english"))
# Remove punctuations
TextDoc2 <- tm_map(TextDoc2, removePunctuation)
# Remove your own stop word ("South" and "sudan")
TextDoc2 <- tm_map(TextDoc2, removeWords, c("south", "via", "sudan", "sudans", "sudanese", "breaking", "us", "united states", "says", "photo", "president")) 

#############################################




############### Word Frequency and Plot ###############

# Build a term-document matrix
TextDoc_dtm2 <- TermDocumentMatrix(TextDoc2)
dtm_m2 <- as.matrix(TextDoc_dtm2)
# Sort by descearing value of frequency
dtm_v2 <- sort(rowSums(dtm_m2),decreasing=TRUE)
dtm_d2 <- data.frame(word = names(dtm_v2),freq=dtm_v2)
# Display the top 5 most frequent words
head(dtm_d2, 5)


# Plot the most frequent words

jpegname3 <- paste0(csvname, "body_word_frequency.jpeg")
jpeg(jpegname3, width = 800, height = 600, quality = 100)

barplot(dtm_d2[1:10,]$freq, las = 2, names.arg = dtm_d2[1:10,]$word,
        col ="lightgreen", main ="Top 10 most frequent words of Body",
        ylab = "Word frequencies")
dev.off()
###############################


#################### Word Cloud ############################

library(wordcloud)

set.seed(1234)
wordcloud(words = dtm_d2$word, freq = dtm_d2$freq, min.freq = 10,
          random.order=FALSE, rot.per=0.40, 
          colors=brewer.pal(8, "Dark2"))

###################### End Word Cloud #######################


################# Bi Gram Analysis #################
library(tidytext)
doc_co <- Corpus(VectorSource(sudan_post$body))

doc_co <- tm_map(doc_co, removePunctuation)
doc_co <- tm_map(doc_co, content_transformer(tolower))
doc_co  <- tm_map(doc_co , removeWords, stopwords("english"))
doc_co  <- tm_map(doc_co , removePunctuation)

doc_co  <- tm_map(doc_co , removeWords, c("south", "sudan", "sudans", "sudanese", "breaking", "us", "united states", "says", "photo")) 
text_df <- data.frame(text_clean = get("content", doc_co), stringsAsFactors = FALSE)


bigram <- text_df %>% unnest_tokens(bigram, text_clean, token = "ngrams", n = 2)

bigram_count <- bigram  %>% count(bigram, sort = TRUE)
bigram_count

par(mar=c(4,8,4,4))
barplot(bigram_count[1:15,]$n, las=2, horiz = TRUE, names.arg = bigram_count[1:15,]$bigram,
        col ="steelblue", main ="Bi-Gram Word Analysis",
        xlab = "Bi-Gram Word frequencies")
dev.off()


bigram2 <- text_df %>% unnest_tokens(bigram, text_clean, token = "ngrams", n = 2) %>%   separate(bigram, c("word1", "word2"), sep = " ")
bigram2$bigram <- bigram

negation_words <- c("not", "no", "never", "without")

AFINN <- get_sentiments("afinn")


bigram2 %>%
  filter(word1 %in% negation_words)

negated_words <- bigram2 %>%
  filter(word1 %in% negation_words) 


afinn_165_sentiment <- negated_words %>% inner_join(AFINN) %>% count(word, value, sort = TRUE)
#%>% count(word, sentiment, sort = TRUE)
afinn_165_sentiment
#############################################


################ Sentiment Analysis ###########
library("syuzhet")

ss2 <- sudan_post$body

syuzhet_vector2 <- get_sentiment(ss2, method="syuzhet")

# see summary statistics of the vector
sabody <- summary(syuzhet_vector2)


d2<-get_nrc_sentiment(ss2)
library(ggplot2)
td2<-data.frame(t(d2))
#The function rowSums computes column sums across rows for each level of a grouping variable.
td_new2 <- data.frame(rowSums(td2))
#Transformation and cleaning
names(td_new2)[1] <- "count"
td_new2 <- cbind("sentiment" = rownames(td_new2), td_new2)
rownames(td_new2) <- NULL
td_new4<-td_new2[1:8,]
#Plot One - count of words associated with each sentiment

jpegname4 <- paste0(csvname, "sentiment_body.jpeg")
jpeg(jpegname4, width = 800, height = 600, quality = 100)

quickplot(sentiment, data=td_new4, weight=count, geom="bar", fill=sentiment, ylab="count")+ggtitle("Emotion sentiments of Body")
dev.off()
##########################################################


############### Sentiment Analysis using entire sentencess ##########

library(sentimentr)


bounded_sentences <- ss %>% 
  sentimentr::get_sentences() %>% 
  sentimentr::sentiment() 

head(bounded_sentences)

summary(bounded_sentences$sentiment)



#################################################

textname <- paste0(csvname, "sentiment.txt")
sink(textname)
cat("Sentiment Analysis of Headlines")
cat("\n")
cat("Min. 1st Qu.  Median    Mean 3rd Qu.    Max. ")
cat("\n")
cat(sahead)
cat("\n")
cat("Sentiment Analysis of Body")
cat("\n")
cat("Min. 1st Qu.  Median    Mean 3rd Qu.    Max. ")
cat("\n")
cat(sabody)
sink()
