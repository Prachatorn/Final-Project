# Load in packages and sourcing in files

library(dplyr)
library(ggplot2)
library(shiny)
library(tidyr)
library(rsconnect)
source("affirmative.R")
source("age_chart.R")
source("ceilings.R")
source("country_time.R")
source("defensive.R")
source("gather_asylums.R")
source("gender_chart.R")
source("marital_status_chart.R")
source("region_time.R")
source("world_map.R")

server <- function(input, output) {
  
  # Julianne - Made graphs refering to the cap limit and how many refugees
  # arrived from both regional and countries.
  output$ceilings <- renderPlot({
    return(ceilings(input$Year, input$Admitted))
  })

  output$country_time <- renderPlotly({
    return(country_plot(input$country))
  })
  
  output$region_time <- renderPlotly({
    return(region_plot(input$area))
  })

  # Prachatorn - Made the world map of refugees and asylum seekers to the
  # United States
  output$maps <- renderPlotly ({
    return(world_map(input$asylums,input$year))
  })

  # Hekma - Made the graphs for the different demographics(age, gender,
  # marital status) of refugees arriving to the United States.
  output$age_chart <- renderPlot({
    return(age_chart(input$year_age))
  })
    
  # Arrival Gender Chart
  output$gender_chart <- renderPlotly({
    return(gender_chart(input$year_gender))
  })
    
  # Arrival Marital Status Chart
  output$martial_status_chart <- renderPlotly({
    return(marital_status_chart(input$year_marital_status))
  })
    
  # Marina - Made graphs to show the number of asylum seekers in both 
  # affirmative and defensive from different countries.
    
  # Plot of Affrimative Asylum
  output$affirmative <- renderPlot({
    return(affirmative_plot(input$select_country))  
  })
    
  # Plot defensive asylum graph
  output$defensive <- renderPlot({
    return(defensive_plot(input$select_country))
  })
}

