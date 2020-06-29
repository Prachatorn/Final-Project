library(dplyr)
library(ggplot2)

# Read arrival age data

arrival_age_data <- read.csv("Refugees/arrival_age/combined_age.csv",
                             stringsAsFactors = FALSE)

age_chart <- function(year_age) {
  arrival_age <- arrival_age_data %>%
    filter(character != "Total") %>%
    mutate(year_2008 = as.numeric(gsub(",", "", arrival_total_2008)),
           year_2009 = as.numeric(gsub(",", "", arrival_total_2009)),
           year_2010 = as.numeric(gsub(",", "", arrival_total_2010)),
           year_2011 = as.numeric(gsub(",", "", arrival_total_2011)),
           year_2012 = as.numeric(gsub(",", "", arrival_total_2012)),
           year_2013 = as.numeric(gsub(",", "", arrival_total_2013)),
           year_2014 = as.numeric(gsub(",", "", arrival_total_2014)),
           year_2015 = as.numeric(gsub(",", "", arrival_total_2015)),
           year_2016 = as.numeric(gsub(",", "", arrival_total_2016))) %>%
    select(character, year_2008, year_2009, year_2010,
           year_2011, year_2012,
           year_2013, year_2014,
           year_2015, year_2016)
  
  chart_two <- ggplot(data = arrival_age) +
    geom_col(
      mapping = aes_string(
        x = year_age, 
        y = "character",
        width = 5
      )
    ) +
    geom_point(
      mapping = aes_string(
        x = year_age,
        y = "character",
        color = year_age,
        size = year_age)) +
    labs(
      y = "Age",
      x = "Total Number of Refugees",
      title = paste0(
        "Total Number of Refugees Arrived by Age during ",
        gsub("year_", "", year_age)),
      color = "Number of Refugee Arrivals",
      size = "Number of Refugee Arrivals"
    ) +
    theme(
      axis.text.x = element_text(angle = 60, hjust = 1)) +
    ylim(
      "Under 1 year",
      "1 to 4 years",
      "5 to 9 years",
      "10 to 14 years",
      "15 to 19 years",
      "20 to 24 years",
      "25 to 29 years",
      "30 to 34 years",
      "35 to 39 years",
      "40 to 44 years",
      "45 to 49 years",
      "50 to 54 years",
      "55 to 59 years",
      "60 to 64 years",
      "65 to 74 years",
      "75 years and over"
    ) +
    scale_color_gradient(high = "darkblue", low = "lightblue")
    return(chart_two)
}