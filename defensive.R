library(dplyr)
library(ggplot2)
source("gather_asylums.R")

defensive_plot <- function(select_country) {
  filtered <- reactive({
    filter <- filter(
      gather_defens,
      gather_defens$Country == select_country
    )
  })
  defensive_plot <- ggplot(filtered(), aes(x = Year,y = Value)) + 
    geom_bar(stat = "identity", fill = "forestgreen") +
    ggtitle(paste0("Defensive Asylum for ", select_country)) +
    xlab("Year") +
    ylab("Number of Defensive Asylum Cases") +
    theme_grey(base_size = 18)
  return(defensive_plot)
}