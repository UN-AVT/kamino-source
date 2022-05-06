# Loading libraries [install the libraries before if not already installed]
library(knitr)
library(rmarkdown)
library(mailR)

# Knits rmd file (.Rmd is saved in the working directory)
knit('ethiopia_monitor_rmd.Rmd')

# Creates the html output
csvname <- as.character(Sys.Date())
csvname2 <- paste0(csvname, "ethiopia_monitor.html")

Sys.setenv(RSTUDIO_PANDOC="C:/Program Files/RStudio/bin/pandoc")
render("ethiopia_monitor_rmd.md", output_file = csvname2, 
       output_dir =  "C:/Users/PC/Desktop/UN Internship/Min's Development/Ethiopia Text Analytics/output",
       output_options = c("self_contained = TRUE"),
       clean = TRUE)

