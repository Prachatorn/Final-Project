#Read in packages
library(dplyr)
library(ggplot2)
library(shiny)
library(tidyr)
library(rsconnect)
source("regionals.R")
source("countries.R")
source("world_map.R")
source("julianne.R")

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
  
  #Julianne
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
  
  output$region_time <- renderPlotly({
    region_plot <- ggplot(regionals,
                          aes_string(
                            x = "years",
                            y = input$area
                          )
    ) + geom_line(color = "orange") +
      ggtitle("Change in Total Regional Arrivals by Region From 2008-2016") +
      xlab("Year") +
      ylab("Arrivals")
    
    region_plot2 <- ggplotly(region_plot)
    region_plot2
  })
  
  output$country_time <- renderPlotly({
    country_plot <- ggplot(countries,
                           aes_string(
                             x = "year",
                             y = input$country
                           )
    ) + geom_line(color = "purple") +
      ggtitle("Change in Total Arrivals by Country From 2008-2016") +
      xlab("Year") +
      ylab("Arrivals")
    
    country_plot2 <- ggplotly(country_plot)
    country_plot2
  })
  
  #Prachatorn
    output$maps <- renderPlotly ({
      return(world_map(input$asylums,input$year))
    })
}

