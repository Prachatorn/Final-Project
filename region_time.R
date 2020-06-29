library(dplyr)
library(ggplot2)
source("regional_and_caps.R")

region_plot <- function(area) {
  region_plot <- ggplot(
    regionals,
    aes_string(
      x = "years",
      y = area
    )
  ) +
    geom_line(color = "orange") +
    scale_x_continuous(breaks = seq(2008, 2016, 1)) +
    ggtitle(
      paste0(
        "Change In Total Regional Arrivals By ",
        area,
        " From 2008-2016"
      )
    ) +
    xlab("Year") +
    ylab("Arrivals")
  
  region_plot2 <- ggplotly(region_plot)
  return(region_plot2)
}