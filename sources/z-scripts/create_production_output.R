## ---------------------------
##
## Script name: CREATE PRODUCTION OUTPUT
##
## Purpose of script: migrate html file to web package
##
## ---------------------------
##
## Notes:
##   
##  html file is copied
##  masthead image file is copied
##  html file is modified for web site paths
##  local vendor folder is deleted
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
html_file <- paste0(file, ".html")

# copy html file to package directory

destination_path <- file.path("../../../../packages/web/content/", taxonomy$activity, taxonomy$subactivity, taxonomy$task)
destination_file <- file.path(destination_path, "/", html_file)

# file.info(as.character(rmd_file))

# check if the source file exists
if ( file.exists(as.character(html_file)) ) {
  
  #print("file exists")
  
  # check if destination folder exists
  if (!dir.exists(destination_path) ) {
    #print("dir does not exist")
    #print(destination_path)
    dir.create(destination_path, showWarnings = TRUE, recursive = TRUE)
  }
  
  # if old version exists, delete
  if ( file.exists(destination_file) ) {
    print("old version exists")
  }
  
  # now copy file to directory
  # print(html_file)
  file.copy(html_file, destination_file, overwrite = TRUE)
  # then delete from source
  file.remove(html_file)
  
  # now copy assets files
  # masthead
  file.copy(masthead, paste0(destination_path, sub(".*assets", "", masthead)), overwrite = TRUE)

}

# STEP 2: FIND AND REPLACE PATH TEXT
tx  <- readLines(destination_file)
tx1  <- gsub(pattern = "../../../z-assemblers/", replace = "../../../../", x = tx)
tx2  <- gsub(pattern = "vendor/", replace = "../../../../vendor/knitr/", x = tx1)
tx3  <- gsub(pattern = masthead, replace = sub(".*assets/", "", masthead), x = tx2)
writeLines(tx3, con=destination_file)


# STEP 3: REMOVE VENDOR FOLDER
unlink(c("vendor"), recursive = TRUE, force = FALSE, expand = TRUE)