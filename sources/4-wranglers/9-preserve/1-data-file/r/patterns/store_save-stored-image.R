####################################################################################
# Required libraries
library(ggplot2)

####################################################################################
# Save an plot from R Session
f_save_img <- function(path, df_plot) {
  ggsave(filename= paste(path), plot=df_plot, scale=1, width=11, height=11, units="in")
}


# Call the function 
f_save_img("testing.png", x) #Put any image extensions in file name (eg. jpg and svg)
####################################################################################