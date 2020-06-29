library(dplyr)
library(ggplot2)

# Read arrival gender data

arrival_gender_data <- read.csv("Refugees/arrival_gender/combined_gender.csv",
                                stringsAsFactors = FALSE)

gender_chart <- function(year_gender) {
  arrival_f_m <- arrival_gender_data %>%
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
  
  arrival_f_m <- arrival_f_m %>%
    mutate(color = c("lightcoral", "cyan3"))
  
  chart_three <- ggplot(data = arrival_f_m) +
    geom_col(
      mapping = aes_string(
        x = "character",
        y = year_gender
        # fill = "character"
      ), fill = arrival_f_m$color
    ) +
    labs(
      x = "Gender",
      y = "Total Number of Refugees",
      title = paste0(
        "Total Number of Refugees Arrived by Gender during ",
        gsub("year_", "", year_gender)
      )
    ) +
    theme(
      axis.text.x = element_text(angle = 60, hjust = 1),
      legend.title = element_blank(),
      legend.position = "none") +
    coord_flip()
  chart3 <- ggplotly(chart_three)
  return(chart3)
}