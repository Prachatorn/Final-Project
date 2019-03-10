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
  newdata <- list()
  newdata$years <- c(2008:2016)
  newdata$africa <- c(regional_arrivals$`2008`[2],
                      regional_arrivals$`2009`[2],regional_arrivals$`2010`[2], 
                      regional_arrivals$`2011`[2], regional_arrivals$`2012`[2],
                      regional_arrivals$`2013`[2], regional_arrivals$`2014`[2],
                      regional_arrivals$`2015`[2], regional_arrivals$`2016`[2])
  newdata$asia <- c(regional_arrivals$`2008`[3],
                    regional_arrivals$`2009`[3],regional_arrivals$`2010`[3], 
                    regional_arrivals$`2011`[3], regional_arrivals$`2012`[3],
                    regional_arrivals$`2013`[3], regional_arrivals$`2014`[3],
                    regional_arrivals$`2015`[3], regional_arrivals$`2016`[3])
  
  newdata$europe <- c(regional_arrivals$`2008`[4],
                      regional_arrivals$`2009`[4],regional_arrivals$`2010`[4], 
                      regional_arrivals$`2011`[4], regional_arrivals$`2012`[4],
                      regional_arrivals$`2013`[4], regional_arrivals$`2014`[4],
                      regional_arrivals$`2015`[4], regional_arrivals$`2016`[4])
  
  newdata$north_america <- c(regional_arrivals$`2008`[5],
                             regional_arrivals$`2009`[5],regional_arrivals$`2010`[5], 
                             regional_arrivals$`2011`[5], regional_arrivals$`2012`[5],
                             regional_arrivals$`2013`[5], regional_arrivals$`2014`[5],
                             regional_arrivals$`2015`[5], regional_arrivals$`2016`[5])
  
  newdata$oceania <- c(regional_arrivals$`2008`[6],
                       regional_arrivals$`2009`[6],regional_arrivals$`2010`[6], 
                       regional_arrivals$`2011`[6], regional_arrivals$`2012`[6],
                       regional_arrivals$`2013`[6], regional_arrivals$`2014`[6],
                       regional_arrivals$`2015`[6], regional_arrivals$`2016`[6])
  
  newdata$south_america <- c(regional_arrivals$`2008`[7],
                             regional_arrivals$`2009`[7],regional_arrivals$`2010`[7], 
                             regional_arrivals$`2011`[7], regional_arrivals$`2012`[7],
                             regional_arrivals$`2013`[7], regional_arrivals$`2014`[7],
                             regional_arrivals$`2015`[7], regional_arrivals$`2016`[7])
  
  newdata$unknown <- c(regional_arrivals$`2008`[8],
                       regional_arrivals$`2009`[8],regional_arrivals$`2010`[8], 
                       regional_arrivals$`2011`[8], regional_arrivals$`2012`[8],
                       regional_arrivals$`2013`[8], regional_arrivals$`2014`[8],
                       regional_arrivals$`2015`[8], regional_arrivals$`2016`[8])
  
  regionals <- data.frame(newdata)
  
  
  #Plots 
   output$region_time <- renderPlot({
    ggplot(regionals,
                   aes(
                     x = years,
                     y = input$area
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
