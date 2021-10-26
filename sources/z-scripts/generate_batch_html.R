library(rmarkdown)

# Script to knit all Rmd files as html for web migration

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

# 1-Base Camp

# 2-Process

# 3-Ingest

# 4-Wranglers

# 5-Analytics

# 6-Views

# 7-Charts
setwd("../7-charts/")
render("1-correlation/10-scatter-quadrant/infectious-disease.Rmd", output_format = "html_document")
render("1-correlation/2-bubble-facet/access-to-water-and-sanitation.Rmd", output_format = "html_document")

# 8-diagrams

# 9-graphs

# 10-maps

# 11-semiographics

# 12-tables

# 13-temporals

# 14-trees

# 15-composition

# 16-storytelling

# 17-summit

# 18-case-studies

# 19-exercises