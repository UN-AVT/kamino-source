####################################################################################
# Required libraries
library(ggplot2)

####################################################################################
# Save the last plot from R Session
f_save_img <- function(path) {
  ggsave(filename= paste(path), plot=last_plot(), scale=1, width=11, height=11, units="in")
}


# Call the function 
f_save_img("test 2.svg") #Put any image extensions in file name (eg. jpg and svg)
####################################################################################