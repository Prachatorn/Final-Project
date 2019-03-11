# load in package
library(plotly)
library(dplyr)

# Load in dataset

affirmative_asylum <- read.csv("Refugees/country_affirmative_asylum.csv",
                  stringsAsFactors = F)

colnames(affirmative_asylum)[colnames(affirmative_asylum) == 
                                  "ï..Country"] <- "country"

affirmative <- affirmative_asylum %>%
  filter(code != "NA")

affirmative[affirmative == "-"] <- 0
affirmative[affirmative == "D"] <- NA
affirmative <- affirmative %>%
  rename_at (
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

country <- affirmative %>%
  select(
    country
  )
num_affirmative <- data.matrix(affirmative[2:11])
country <- country %>%
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

country <- data.frame(country)
View(country)

# https://plot.ly/r/choropleth-maps/#world-choropleth-map

p <- plot_geo(country) %>%
  add_trace(
    z = ~year_2007,
    color = ~year_2007,
    colors = "Reds",
    text = ~country, 
    locations = ~code, 
    marker = list(
      line = list(
        color = toRGB("black"), 
        width = 0.5
      )
    )
  ) %>%
  colorbar(
    title = '# Of People'
  ) %>%
  layout(
    title = "Affirmative Asylums to the US From Around The World",
    geo = list(
      showframe = FALSE,
      showcoastlines = TRUE,
      projection = list(type = 'Mercator')
    )
  )
p
