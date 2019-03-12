#Read in packages
library(dplyr)
library(ggplot2)
library(shiny)
library(tidyr)
library(rsconnect)
source("regionals.R")
source("countries.R")
source("world_map.R")

# Read arrival age data
arrival_age_data <- read.csv("Refugees/arrival_age/combined_age.csv",
                             stringsAsFactors = FALSE)
# Read arrival gender data
arrival_gender_data <- read.csv("Refugees/arrival_gender/combined_gender.csv",
                                stringsAsFactors = FALSE)
# Read arrival marital status data
arrival_marital_status <- read.csv("Refugees/arrival_marital_status/combined_marital_status.csv",
                                   stringsAsFactors = FALSE)

server <- function(input, output) {
  
  # Arrival Age Chart
  output$age_chart <- renderPlot({
    arrival_age <- arrival_age_data %>%
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
    
    # Obama Era Stats
    caps <- data.frame("Year" = c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 
                                  2016), "Cap" = c(80000, 80000, 80000, 80000, 76000,
                                                   70000, 70000, 70000, 85000), 
                       "Admitted" = c(60107, 74602, 73293, 56384, 58179, 69909, 
                                      69975, 69920, 84989))
  
  #Plots 
  output$region_time <- renderPlot({
    ggplot(regionals,
           aes_string(
             x = "years",
             y = input$area
           )
    ) + geom_line() +
      ggtitle("Change in Total Regional Arrivals by Region From 2008-2016") +
      xlab("Year") +
      ylab("Arrivals")
  })
  
  output$country_time <- renderPlot({
    ggplot(countries,
           aes_string(
             x = "year",
             y = input$country
           )
    ) + geom_line() +
      ggtitle("Change in Total Arrivals by Country From 2008-2016") +
      xlab("Year") +
      ylab("Arrivals")
  })
  
  output$ceilings <- renderPlot({
    ggplot(caps, aes(x = Year)) +
      geom_line(aes(y= Cap, colour= "Cap")) +
      geom_line(aes(y= Admitted, colour= "Admitted")) +
      geom_point(aes (y = Cap)) +
      geom_point(aes (y = Admitted)) +
      scale_y_continuous("Total Numbers of People",
                         breaks= seq(56000, 86000, 2000)) +
      ggtitle("Refugee Admissions Ceiling vs Total Refugee Admissions") +
      scale_color_manual(name = "Total Numbers", values= c("Cap" = "red",
                                                           "Admitted" = "green"),
                         labels = c("Admitted", "Ceiling Cap"))
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