#<<<<<<< HEAD
#<<<<<<< HEAD
#=======
#<<<<<<< HEAD
#Read in packages
library(dplyr)
library(ggplot2)
library(shiny)
library(lintr)

# #Read in Country Affirmative Asylum Data
# affirmative <- read.csv("Refugees/country_affirmative_asylum.csv", stringsAsFactors = FALSE)
# 
# #Make data frame from 2008 - 2016
# affirmative <- affirmative %>% 
#   select(Country, X2008, X2009, X2010, X2011, X2012, X2013, X2014, X2015, X2016)
# 
# #Read in Country Defensive Asylum Data
# defensive <- read.csv("Refugees/country_defensive_asylum.csv", stringsAsFactors = FALSE)
# 
# #Make data frame of 2008-2016
# defensive <- defensive %>% 
#   select(Country, X2008, X2009, X2010, X2011, X2012, X2013, X2014, X2015, X2016)
# 
# #replace non numeric values with NA
# Unavailable <- function(value){
#   if (value = "-" OR "D")
#     return(NA)
# }
#Create data frame of total and country

#Utalize affirmative["X2008"][[1]][1] to select columns 

#Use a for loop or sapply to divide each by the total. 
# =======
# <<<<<<< HEAD
# >>>>>>> 7e9644afd8ad1a5258086d4b1512c3bf871a9cc9
# shinyServer(function(input, output) {
#   
# })
# #=======
library(shiny)
library(dplyr)
library(ggplot2)


#<<<<<<< HEAD
server <- function(input, output) {

  # Obama Era Stats
  regional_arrivals <- read.csv("Refugees/regional_arrivals.csv", 
                                stringsAsFactors = F)
  regional_arrivals <- regional_arrivals %>% 
    rename("2007" = X2007, "2008" = X2008, "2009" = X2009, "2010" = X2010, 
           "2011" = X2011, "2012" = X2012, "2013" = X2013, "2014" = X2014, 
           "2015" = X2015, "2016" = X2016)  
  
  regional_arrivals[,-1] <- suppressWarnings(as.numeric(gsub(",", "", 
                                                      as.matrix(
                                                      regional_arrivals[,-1]))))
  regional_arrivals[is.na(regional_arrivals)] <- 0
  regionals <- regional_arrivals %>%
    select(Region.and.country.of.nationality, `2008`, `2009`, `2010`, `2011`, `2012`,
           `2013`, `2014`, `2015`, `2016`) %>%
    gather(key = year, value = totals, `2008`:`2016`, -Region.and.country.of.nationality) # all columns except `state`
  
  country_arrivals <- read.csv("Refugees/country_arrivals.csv", 
                               stringsAsFactors = F)
  
  country_arrivals <- country_arrivals %>% 
    rename("2007" = X2007, "2008" = X2008, "2009" = X2009, "2010" = X2010, 
           "2011" = X2011, "2012" = X2012, "2013" = X2013, "2014" = X2014, 
           "2015" = X2015, "2016" = X2016)  
  
  country_arrivals[,-1] <- suppressWarnings(as.numeric(gsub(",", "", 
                                                      as.matrix(
                                                      country_arrivals[,-1]))))
  country_arrivals[is.na(country_arrivals)] <- 0
  
  #Plots 
  output$region_time <- renderPlot({
    ggplot(regionals,
                  aes_string(
                    x = "year",
                    y = input$region
                    )
  ) + geom_line() +
    ggtitle("Change in Total Regional Arrivals From 2008-2016") +
    xlab("Year") +
    ylab("Arrivals")
})

  # output$country_time <- renderPlot({
  #    ggplot(country_arrivals,
  #                   aes(
  #                     x = country_arrivals[2:11],
  #                     y = input$country,
  #                     color = "pink")
  #   ) + geom_line() +
  #     ggtitle("Change in Total Arrivals From 2008-2016") +
  #     xlab("Year") +
  #     ylab("Arrivals")
  # })
  
  
}
#<<<<<<< HEAD
#=======
#>>>>>>> af830ed980fdf2674a8ba0d4d7efa0d61b93f098
#>>>>>>> c692460e25121cfd7948c0bca12df35a41c89ba6
# 
# =======
# =======
# >>>>>>> af830ed980fdf2674a8ba0d4d7efa0d61b93f098
# >>>>>>> c692460e25121cfd7948c0bca12df35a41c89ba6
# >>>>>>> 05cc561354c505ab5c4c5d4066c97bf699c0e797
# >>>>>>> 7e9644afd8ad1a5258086d4b1512c3bf871a9cc9
