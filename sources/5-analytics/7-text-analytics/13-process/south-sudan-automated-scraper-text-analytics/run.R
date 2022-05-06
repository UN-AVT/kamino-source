# Loading libraries [install the libraries before if not already installed]
library(knitr)
library(rmarkdown)
library(mailR)

# Knits rmd file (.Rmd is saved in the working directory)
knit('sudanspostrmd.Rmd')

# Creates the html output
csvname <- as.character(Sys.Date())
csvname2 <- paste0(csvname, "sudanpost.html")

Sys.setenv(RSTUDIO_PANDOC="C:/Program Files/RStudio/bin/pandoc")
render("sudanspostrmd.md", output_file = csvname2 )

#, output_format="html_document"