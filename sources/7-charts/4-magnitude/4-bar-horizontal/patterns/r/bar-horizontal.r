####################################################################################
# Chart Theme
theme_opts <- theme(
  plot.margin = margin(.25, 1, .25, .25, "cm"),
  plot.background = element_blank(),
  panel.background = element_blank(),
  legend.position = "none",
  axis.title.x=element_blank(),
  axis.title.y=element_blank(),
  axis.ticks.y=element_blank(),
  axis.ticks.x=element_blank(),
  axis.text.x=element_blank(),
  strip.placement = "outside",                      # Place facet labels outside x axis labels.
  strip.background = element_rect(fill = "white"),  # Make facet label background white.
  axis.title = element_blank()                     # Remove x and y axis titles.
)

# Make the plot function
make_hbar <- function(df, x_field, y_field, fill_str, title_str) {
  
  x_var <- c(x_field)
  y_var <- c(y_field)
  
  ggplot(df, aes(x=get(x_var), y=get(y_var))) + 
    geom_bar(stat="identity", fill=fill_str) +
    coord_cartesian(clip="off") +
    labs(title = title_str) +
    theme_opts
  
}

# Call the function with your values to the parameters
v1 <- make_hbar(df, "Family.Integration.Policy.Average.Scores", "Country", "#88b88a", "FAMILY INTEGRATION POLICY AVERAGE SCORES BY COUNTRY, 2014")
v1
####################################################################################