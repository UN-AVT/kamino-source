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
##  Depends on create_metadata script for taxonomy variables
##  html file is copied
##  masthead image file is copied
##  html file is modified for web site paths
##  local vendor folder is deleted
##
## ---------------------------

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
  
  # now copy assets files
  # masthead
  file.copy(masthead, paste0(destination_path, sub(".*assets", "", masthead)), overwrite = TRUE)
  # icon
  file.copy(paste0("assets/", svg_file), paste0(destination_path, "/", svg_file), overwrite = TRUE)

}

# STEP 2: FIND AND REPLACE PATH TEXT
tx  <- readLines(destination_file)
tx1  <- gsub(pattern = "../../../z-assemblers/", replace = "../../../../", x = tx)
tx2  <- gsub(pattern = "C:/Users/jaybe/Desktop/kamino-dev/sources/z-assemblers/", replace = "../../../../", x = tx1)
tx3  <- gsub(pattern = "vendor/", replace = "../../../../vendor/knitr/", x = tx2)
tx4  <- gsub(pattern = masthead, replace = sub(".*assets/", "", masthead), x = tx3)
writeLines(tx4, con=destination_file)


# STEP 3: REMOVE VENDOR FOLDER
#unlink(c("vendor"), recursive = TRUE, force = FALSE, expand = TRUE)