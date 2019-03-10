# load in package
library(leaflet)
library(maps)
library(sp)
library(rgdal)

download.file(url = 'http://biogeo.ucdavis.edu/data/diva/adm/ITA_adm.zip', 
              destfile = 'spain.zip')
unzip(zipfile = 'spain.zip')
spain <- readOGR('SPA_adm0.shp')

# Load in dataset

ghost <- read.csv("Refugees/country_affirmative_asylum.csv", 
                  stringsAsFactors = F)

colnames(ghost)[colnames(ghost) == "ï..Country"] <- "country"



affirmative <- leaflet(data = ghost) %>%
  addProviderTiles("OpenStreetMap.Mapnik")
affirmative  

leaflet(spain) %>%
  addPolygons() %>%
  addTiles()
