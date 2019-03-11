# <<<<<<< HEAD
# #<<<<<<< HEAD
# =======
# <<<<<<< HEAD
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

# Read arrival age data
arrival_age_data <- read.csv("Refugees/arrival_age/combined_age.csv",
                             stringsAsFactors = FALSE)
# Read arrival gender data
arrival_gender_data <- read.csv("Refugees/arrival_gender/combined_gender.csv",
                                stringsAsFactors = FALSE)
# Read arrival marital status data
arrival_marital_status <- read.csv("Refugees/arrival_marital_status/combined_marital_status.csv",
                                   stringsAsFactors = FALSE)

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
# =======
# <<<<<<< HEAD
# >>>>>>> 7e9644afd8ad1a5258086d4b1512c3bf871a9cc9
# shinyServer(function(input, output) {
#   
# })
#=======
# library(shiny)
# library(dplyr)
# library(ggplot2)


#<<<<<<< HEAD
server <- function(input, output) {
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
# <<<<<<< HEAD
# #=======
# #>>>>>>> af830ed980fdf2674a8ba0d4d7efa0d61b93f098
# #>>>>>>> c692460e25121cfd7948c0bca12df35a41c89ba6

# =======
# =======
# >>>>>>> af830ed980fdf2674a8ba0d4d7efa0d61b93f098
# >>>>>>> c692460e25121cfd7948c0bca12df35a41c89ba6
# >>>>>>> 05cc561354c505ab5c4c5d4066c97bf699c0e797
# >>>>>>> 7e9644afd8ad1a5258086d4b1512c3bf871a9cc9
