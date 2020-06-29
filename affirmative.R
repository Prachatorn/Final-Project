library(dplyr)
library(ggplot2)
source("gather_asylums.R")

affirmative_plot <- function(select_country) {
  filtered_Data <- reactive({
    filtered_D <- filter(
      gather_affirm,
      gather_affirm$Country == select_country
    )
  })
  affirmative_plot <- ggplot(filtered_Data(), aes(x = Year,y = Value)) + 
    geom_bar(stat = "identity", fill = "cornflowerblue") +
    ggtitle(paste0("Affirmative Asylum for ", select_country)) +
    xlab("Year") +
    ylab("Number of Affirmative Asylum Cases") +
    theme_grey(base_size = 18)
  return(affirmative_plot)
}

