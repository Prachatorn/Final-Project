library(dplyr)
library(ggplot2)
source("countries.R")

country_plot <- function(country) {
  country_plot <- ggplot(
    countries,
    aes_string(
      x = "year",
      y = country
    )
  ) + 
    geom_line(color = "purple") +
    scale_x_continuous(breaks = seq(2008, 2016, 1)) +
    ggtitle(
      paste0(
        "Change In Total Arrivals By ",
        country,
        " From 2008-2016"
      )
    ) +
    xlab("Year") +
    ylab("Arrivals")
  
country_plot2 <- ggplotly(country_plot)

return(country_plot2)

}