# load in package

library(plotly)
library(dplyr)

# Load in dataset

affirmative_asylum <- read.csv("Refugees/country_affirmative_asylum_code.csv",
  stringsAsFactors = F)
defensive_asylum <- read.csv("Refugees/country_defensive_asylum_code.csv",
                             stringsAsFactors = F)
country_arrival <- read.csv("Refugees/country_arrivals_2.csv",
                            stringsAsFactors = F)

# Working on the map for affirmative asylumn for immigrants coming to the
# United States.

affirmative <- affirmative_asylum %>%
  filter(code != "NA")

affirmative[affirmative == "-"] <- 0
affirmative[affirmative == "D"] <- 0
affirmative[affirmative == "X"] <- 0
affirmative <- affirmative %>%
  rename_at(
    vars(starts_with("X")),
    funs(sub("X", "year_", .))
  )

affirmative$year_2007 <- gsub(",", "", affirmative$year_2007)
affirmative$year_2008 <- gsub(",", "", affirmative$year_2008)
affirmative$year_2009 <- gsub(",", "", affirmative$year_2009)
affirmative$year_2010 <- gsub(",", "", affirmative$year_2010)
affirmative$year_2011 <- gsub(",", "", affirmative$year_2011)
affirmative$year_2012 <- gsub(",", "", affirmative$year_2012)
affirmative$year_2013 <- gsub(",", "", affirmative$year_2013)
affirmative$year_2014 <- gsub(",", "", affirmative$year_2014)
affirmative$year_2015 <- gsub(",", "", affirmative$year_2015)
affirmative$year_2016 <- gsub(",", "", affirmative$year_2016)

affirmative_country <- affirmative %>%
  select(
    Country
  )

suppressWarnings(num_affirmative <- data.matrix(affirmative[2:11]))
affirmative_country <- affirmative_country %>%
  mutate(
    year_2007 = num_affirmative[, 1],
    year_2008 = num_affirmative[, 2],
    year_2009 = num_affirmative[, 3],
    year_2010 = num_affirmative[, 4],
    year_2011 = num_affirmative[, 5],
    year_2012 = num_affirmative[, 6],
    year_2013 = num_affirmative[, 7],
    year_2014 = num_affirmative[, 8],
    year_2015 = num_affirmative[, 9],
    year_2016 = num_affirmative[, 10],
    code = affirmative[, 12]
  )

affirmative_country <- data.frame(affirmative_country)

# Working on the map for defensive asylumn for immigrants coming to the
# United States.

defensive <- defensive_asylum %>%
  filter(code != "NA")

defensive[defensive == "-"] <- 0
defensive[defensive == "D"] <- 0
defensive[defensive == "X"] <- 0
defensive <- defensive %>%
  rename_at(
    vars(starts_with("X")),
    funs(sub("X", "year_", .))
  )

defensive$year_2007 <- gsub(",", "", defensive$year_2007)
defensive$year_2008 <- gsub(",", "", defensive$year_2008)
defensive$year_2009 <- gsub(",", "", defensive$year_2009)
defensive$year_2010 <- gsub(",", "", defensive$year_2010)
defensive$year_2011 <- gsub(",", "", defensive$year_2011)
defensive$year_2012 <- gsub(",", "", defensive$year_2012)
defensive$year_2013 <- gsub(",", "", defensive$year_2013)
defensive$year_2014 <- gsub(",", "", defensive$year_2014)
defensive$year_2015 <- gsub(",", "", defensive$year_2015)
defensive$year_2016 <- gsub(",", "", defensive$year_2016)

defensive_country <- defensive %>%
  select(
    Country
  )
num_defensive <- data.matrix(defensive[2:11])
defensive_country <- defensive_country %>%
  mutate(
    year_2007 = num_defensive[, 1],
    year_2008 = num_defensive[, 2],
    year_2009 = num_defensive[, 3],
    year_2010 = num_defensive[, 4],
    year_2011 = num_defensive[, 5],
    year_2012 = num_defensive[, 6],
    year_2013 = num_defensive[, 7],
    year_2014 = num_defensive[, 8],
    year_2015 = num_defensive[, 9],
    year_2016 = num_defensive[, 10],
    code = defensive[, 12]
  )

defensive_country <- data.frame(defensive_country)

# Country Arrival Maps

arrival <- country_arrival %>%
  filter(CODE != "NA")

arrival[arrival == "-"] <- 0
arrival[arrival == "D"] <- 0
arrival[arrival == "X"] <- 0
arrival <- arrival %>%
  rename_at(
    vars(starts_with("X")),
    funs(sub("X", "year_", .))
  )

arrival$year_2007 <- gsub(",", "", arrival$year_2007)
arrival$year_2008 <- gsub(",", "", arrival$year_2008)
arrival$year_2009 <- gsub(",", "", arrival$year_2009)
arrival$year_2010 <- gsub(",", "", arrival$year_2010)
arrival$year_2011 <- gsub(",", "", arrival$year_2011)
arrival$year_2012 <- gsub(",", "", arrival$year_2012)
arrival$year_2013 <- gsub(",", "", arrival$year_2013)
arrival$year_2014 <- gsub(",", "", arrival$year_2014)
arrival$year_2015 <- gsub(",", "", arrival$year_2015)
arrival$year_2016 <- gsub(",", "", arrival$year_2016)

country_arrival <- arrival %>%
  select(
    Country
  )

suppressWarnings(num_arrival <- data.matrix(arrival[2:11]))
country_arrival <- country_arrival %>%
  mutate(
    year_2007 = num_arrival[, 1],
    year_2008 = num_arrival[, 2],
    year_2009 = num_arrival[, 3],
    year_2010 = num_arrival[, 4],
    year_2011 = num_arrival[, 5],
    year_2012 = num_arrival[, 6],
    year_2013 = num_arrival[, 7],
    year_2014 = num_arrival[, 8],
    year_2015 = num_arrival[, 9],
    year_2016 = num_arrival[, 10],
    code = arrival[, 12]
  )

# https://plot.ly/r/choropleth-maps/#world-choropleth-map

world_map <- function(asylums, years) {
  if (asylums == "Affirmative") {
    affirm_map <- plot_geo(affirmative_country) %>%
      add_trace(
        z = ~get(paste0("year_", years)),
        color = ~get(paste0("year_", years)),
        colors = c("yellow", "red"),
        text = ~Country,
        locations = ~code,
        marker = list(
          line = list(
            color = toRGB("black"),
            width = 0.5
          )
        )
      ) %>%
      colorbar(
        title = "# Of People"
      ) %>%
      layout(
        title = "Affirmative Asylums to the US From Around The World",
        geo = list(
          showframe = FALSE,
          showcoastlines = TRUE,
          projection = list(type = "Mercator")
        )
      )
    return(affirm_map)
  } else if (asylums == "Defensive") {
    defensive_map <- plot_geo(defensive_country) %>%
      add_trace(
        z = ~get(paste0("year_", years)),
        color = ~get(paste0("year_", years)),
        colors = c("green", "blue"),
        text = ~Country,
        locations = ~code,
        marker = list(
          line = list(
          color = toRGB("black"),
          width = 0.5
        )
      )
    ) %>%
      colorbar(
        title = "# Of People"
      ) %>%
      layout(
        title = "Defensive Asylums to the US From Around The World",
        geo = list(
        showframe = FALSE,
        showcoastlines = TRUE,
        projection = list(type = "Mercator")
      )
    )
    return(defensive_map)
  } else {
  country_arrival <- data.frame(country_arrival)
  
  map_arrival <- plot_geo(country_arrival) %>%
    add_trace(
      z = ~get(paste0("year_", years)),
      color = ~get(paste0("year_", years)),
      colors = c("orange", "purple"),
      text = ~Country,
      locations = ~code,
      marker = list(
        line = list(
          color = toRGB("black"),
          width = 0.5
        )
      )
    ) %>%
    colorbar(
      title = "# Of People"
    ) %>%
    layout(
      title = "Arriving Immigrants to the US From Different Countries",
      geo = list(
        showframe = FALSE,
        showcoastlines = TRUE,
        projection = list(type = "Mercator")
      )
    )
  return(map_arrival)
  }
}