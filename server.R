<<<<<<< HEAD
# <<<<<<< HEAD
# #<<<<<<< HEAD
# =======
# <<<<<<< HEAD
=======
#<<<<<<< HEAD
#<<<<<<< HEAD
#=======
#<<<<<<< HEAD
>>>>>>> 9ffd48e968d4cf7a30f4275f48387e7c03a10b38
#Read in packages
library(dplyr)
library(ggplot2)
library(shiny)
library(lintr)
library(tidyr)
library(rsconnect)

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
<<<<<<< HEAD
=======
# 
# #replace non numeric values with NA
# Unavailable <- function(value){
#   if (value = "-" OR "D")
#     return(NA)
# }
#Create data frame of total and country
>>>>>>> 9ffd48e968d4cf7a30f4275f48387e7c03a10b38

# Read arrival age data
arrival_age_data <- read.csv("Refugees/arrival_age/combined_age.csv",
                             stringsAsFactors = FALSE)
# Read arrival gender data
arrival_gender_data <- read.csv("Refugees/arrival_gender/combined_gender.csv",
                                stringsAsFactors = FALSE)
# Read arrival marital status data
arrival_marital_status <- read.csv("Refugees/arrival_marital_status/combined_marital_status.csv",
                                   stringsAsFactors = FALSE)

<<<<<<< HEAD
# #replace non numeric values with NA
# Unavailable <- function(value){
#   if (value = "-" OR "D")
#     return(NA)
# }
# #Create data frame of total and country
# 
# #Utalize affirmative["X2008"][[1]][1] to select columns 
# 
# #Use a for loop or sapply to divide each by the total. 
=======
#Use a for loop or sapply to divide each by the total. 
>>>>>>> 9ffd48e968d4cf7a30f4275f48387e7c03a10b38
# =======
# <<<<<<< HEAD
# >>>>>>> 7e9644afd8ad1a5258086d4b1512c3bf871a9cc9
# shinyServer(function(input, output) {
#   
# })
<<<<<<< HEAD
#=======
# library(shiny)
# library(dplyr)
# library(ggplot2)
=======
# #=======
library(shiny)
library(dplyr)
library(ggplot2)
>>>>>>> 9ffd48e968d4cf7a30f4275f48387e7c03a10b38


#<<<<<<< HEAD
server <- function(input, output) {
<<<<<<< HEAD
# 
#   # Obama Era Stats
#   regional_arrivals <- read.csv("Refugees/regional_arrivals.csv", 
#                                 stringsAsFactors = F)
#   regional_arrivals <- regional_arrivals %>% 
#     rename("2007" = X2007, "2008" = X2008, "2009" = X2009, "2010" = X2010, 
#            "2011" = X2011, "2012" = X2012, "2013" = X2013, "2014" = X2014, 
#            "2015" = X2015, "2016" = X2016)  
#   
#   y <- gsub(",", "", regional_arrivals$`2007`)
#   regional_arrivals[,-1] <- suppressWarnings(as.numeric(gsub(",", "", 
#                                                       as.matrix(
#                                                       regional_arrivals[,-1]))))
#   regional_arrivals[is.na(regional_arrivals)] <- 0
#   
#   country_arrivals <- read.csv("Refugees/country_arrivals.csv", 
#                                stringsAsFactors = F)
#   
#   country_arrivals <- country_arrivals %>% 
#     rename("2007" = X2007, "2008" = X2008, "2009" = X2009, "2010" = X2010, 
#            "2011" = X2011, "2012" = X2012, "2013" = X2013, "2014" = X2014, 
#            "2015" = X2015, "2016" = X2016)  
#   
#   country_arrivals[,-1] <- suppressWarnings(as.numeric(gsub(",", "", 
#                                                       as.matrix(
#                                                       country_arrivals[,-1]))))
#   country_arrivals[is.na(country_arrivals)] <- 0
#   
#   #Plots 
#   output$region_time <- renderPlot({
#     ggplot(regional_arrivals,
#                   aes(
#                     x = regional_arrivals[2:11],
#                     y = input$region,
#                     color = "blue")
#   ) + geom_line() +
#     ggtitle("Change in Total Regional Arrivals From 2008-2016") +
#     xlab("Year") +
#     ylab("Arrivals")
# })
# 
#   output$country_time <- renderPlot({
#      ggplot(country_arrivals,
#                     aes(
#                       x = country_arrivals[2:11],
#                       y = input$country,
#                       color = "pink")
#     ) + geom_line() +
#       ggtitle("Change in Total Arrivals From 2008-2016") +
#       xlab("Year") +
#       ylab("Arrivals")
#   })
  
  # Arrival Age Chart
  output$age_chart <- renderPlot({
    arrival_age <- arrival_age_data %>%
      # filter(rename(character == "Under 1 year", character == "0 to 1 year")) %>% 
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
    
    chart_two <- ggplot(data = arrival_age) +
      geom_col(
        mapping = aes_string(
          x = input$year_age, 
          y = "character", 
          fill = input$year_age,
          width = 5)
      )  +
      geom_point(
        mapping = aes_string(
          x = input$year_age,
          y = "character",
          color = input$year_age)) + 
      labs(
        y = "Age",
        title = "Total Number of Refugees Arrived by Age vs. Given Year") +
       theme(
         axis.text.x = element_text(angle = 60, hjust = 1)) 
       
    
    chart_two
    
  })
=======

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
                   aes_string(
                     x = "years",
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
>>>>>>> 9ffd48e968d4cf7a30f4275f48387e7c03a10b38
  
  # Arrival Gender Chart
  output$gender_chart <- renderPlot({
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
    
    chart_three <- ggplot(data = arrival_f_m) +
      geom_col( 
        mapping = aes_string(
          x = "character",
          y = input$year_gender,
          fill = "character")
      ) + 
      labs(
        x = "Gender", title = "Total Number of Refugees Arrived by Gender vs. Given Year") +
      theme(
        axis.text.x = element_text(angle = 60, hjust = 1),
            legend.title = element_blank(),
        legend.position = "none") + 
      coord_flip()
    
    chart_three 
  })
  
  # Arrival Marital Status Chart
  output$martial_status_chart <- renderPlot({
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
    
    chart_four <- ggplot(data = marital_status_data) +
      geom_col(
        mapping = aes_string(
          x = "character",
          y = input$year_marital_status,
          fill = "character")
      ) + 
      labs(
        x = "Marital Status",
           title = "Total number of Refugees Arrived by Marital Status vs. Given Year") +
      theme(
        axis.text.x = element_text(angle = 60, hjust = 1), legend.position = "none") + 
      coord_flip()
    
    chart_four
  })
}
<<<<<<< HEAD
# <<<<<<< HEAD
# #=======
# #>>>>>>> af830ed980fdf2674a8ba0d4d7efa0d61b93f098
# #>>>>>>> c692460e25121cfd7948c0bca12df35a41c89ba6

=======
#<<<<<<< HEAD
#=======
#>>>>>>> af830ed980fdf2674a8ba0d4d7efa0d61b93f098
#>>>>>>> c692460e25121cfd7948c0bca12df35a41c89ba6
# 
>>>>>>> 9ffd48e968d4cf7a30f4275f48387e7c03a10b38
# =======
# =======
# >>>>>>> af830ed980fdf2674a8ba0d4d7efa0d61b93f098
# >>>>>>> c692460e25121cfd7948c0bca12df35a41c89ba6
# >>>>>>> 05cc561354c505ab5c4c5d4066c97bf699c0e797
# >>>>>>> 7e9644afd8ad1a5258086d4b1512c3bf871a9cc9
