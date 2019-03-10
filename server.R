#Read in packages
library(dplyr)
library(ggplot2)
library(shiny)
library(lintr)

#Read in Country Affirmative Asylum Data
affirmative <- read.csv("Refugees/country_affirmative_asylum.csv", stringsAsFactors = FALSE)

#Make data frame from 2008 - 2016
affirmative <- affirmative %>% 
  select(Country, X2008, X2009, X2010, X2011, X2012, X2013, X2014, X2015, X2016)

#Read in Country Defensive Asylum Data
defensive <- read.csv("Refugees/country_defensive_asylum.csv", stringsAsFactors = FALSE)

#Make data frame of 2008-2016
defensive <- defensive %>% 
  select(Country, X2008, X2009, X2010, X2011, X2012, X2013, X2014, X2015, X2016)

#replace non numeric values with NA
Unavailable <- function(value){
  if (value = "-" OR "D")
    return(NA)
}
#Create data frame of total and country

#Utalize affirmative["X2008"][[1]][1] to select columns 

#Use a for loop or sapply to divide each by the total. 