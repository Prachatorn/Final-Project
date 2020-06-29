library(dplyr)
library(ggplot2)

# Read arrival marital status data

arrival_marital_status <- read.csv(
  "Refugees/arrival_marital_status/combined_marital_status.csv",
  stringsAsFactors = FALSE
)

marital_status_chart <- function(year_marital_status) {
  marital_status_data <- arrival_marital_status %>%
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
  
  marital_status_data <- marital_status_data %>%
    mutate(color = c("brown2","yellowgreen", "seagreen",
                     "deepskyblue2", "magenta1"
    ))
  
  marital_status_data[is.na(marital_status_data)] <- 0
  
  chart_four <- ggplot(data = marital_status_data) +
    geom_col(
      mapping = aes_string(
        x = "character",
        y = year_marital_status
      ), fill = marital_status_data$color
    ) + 
    labs(
      x = "Marital Status",
      y = "Total Number of Refugees",
      title = paste0(
        "Total Number of Refugees Arrived by Marital Status during ", 
        gsub("year_", "", year_marital_status)
      )
    ) +
    theme(
      axis.text.x = element_text(angle = 60, hjust = 1),
      legend.position = "none"
    ) + 
    coord_flip()
  chart4 <- ggplotly(chart_four)
  return(chart4)
}