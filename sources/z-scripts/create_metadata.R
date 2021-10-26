## ---------------------------
##
## Script name: CREATE METADATA
##
## Purpose of script: create metadata csv file for executing project file.
##
## ---------------------------
##
## Notes: 
## 
## Script is executed from project Rmd documents
## A csv metadata file is written to outputs folder  
##
## ---------------------------


# Get full file path
full_path <- rstudioapi::getActiveDocumentContext()$path

# Remove file extension
full_path <- gsub(".Rmd", "", full_path)

# Create relative path
relative_path <- sub(".*sources/", "", full_path)

# Use path as unique id, make sure file names conform to standard (hyphenate spaces)
id <- gsub("/", "-", relative_path)

# Split path to create taxonomy
taxonomy <- data.frame(do.call('rbind', strsplit(as.character(relative_path),'/',fixed=TRUE)))
colnames(taxonomy) <- c("activity", "subactivity", "task", "file")
# taxonomy

activity <- taxonomy$activity
subactivity <- taxonomy$subactivity
task <- taxonomy$task
file <- taxonomy$file # without extension

rmd_file <- paste0(file, ".Rmd")
html_file <- paste0(file, ".html")
svg_file <- paste0(file, "-icon.svg")

# remove extension and hyphens from title
title <- gsub("-", " ", file)

url <- paste0(relative_path, ".html")

# icon is just file name with extension
icon <- svg_file

last_update <- Sys.Date()

metadata <- data.frame(id, activity, subactivity, task, methods, title, url, keywords, commands, sources, icon, last_update)
metadata
write.csv(metadata, paste0("../../../../packages/web/models/meta/", file, '-metadata.csv'), row.names = FALSE)