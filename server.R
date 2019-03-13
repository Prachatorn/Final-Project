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
    
    output$maps <- renderPlotly ({
      return(world_map(input$asylums,input$year))
    })
}

