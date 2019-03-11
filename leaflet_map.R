# load in package
library(leaflet)
library(maps)
library(sp)
library(rgdal)
library(plotly)
library(dplyr)

# Load in dataset

affirmative_asylum <- read.csv("Refugees/country_affirmative_asylum.csv",
                  stringsAsFactors = F)

colnames(affirmative_asylum)[colnames(affirmative_asylum) == 
                                  "ï..Country"] <- "country"

df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv',
               stringsAsFactors = F)

affirmative <- affirmative_asylum %>%
  filter(code != "NA")

# https://plot.ly/r/choropleth-maps/#world-choropleth-map
# light grey boundaries
l <- list(color = toRGB("grey"), width = 0.5)

# specify map projection/options
g <- list(
  showframe = FALSE,
  showcoastlines = FALSE,
  projection = list(type = 'Mercator')
)

p <- plot_geo(affirmative) %>%
  add_trace(
    z = ~X2007, color = ~X2007, colors = 'Blues',
    text = ~country, locations = ~code, marker = list(line = l)
  ) %>%
  layout(
    title = "Affirmative_asylums to the US",
    geo = g
  )

p

