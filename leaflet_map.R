# load in package
library(leaflet)
library(maps)
library(sp)
library(rgdal)

# Load in dataset

ghost <- read.csv("Refugees/country_affirmative_asylum.csv", 
                  stringsAsFactors = F)

colnames(ghost)[colnames(ghost) == "ï..Country"] <- "country"



affirmative <- leaflet(data = ghost) %>%
  addProviderTiles("OpenStreetMap.Mapnik") %>%
  addMarkers(group = ghost$country)
affirmative  

leaflet(spain) %>%
  addPolygons() %>%
  addTiles()
