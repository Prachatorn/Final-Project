<<<<<<< HEAD
# Load in packages

library(shiny)
library(plotly)
library(ggplot2)
library(dplyr)

<<<<<<< HEAD
#Obama Era Stats
#regional arrivals chart
regional_arrivals <- read.csv("Refugees/regional_arrivals.csv", 
                              stringsAsFactors = F)
regional_arrivals <- regional_arrivals %>% 
  rename("2007" = X2007, "2008" = X2008, "2009" = X2009, "2010" = X2010, 
         "2011" = X2011, "2012" = X2012, "2013" = X2013, "2014" = X2014, 
         "2015" = X2015, "2016" = X2016)  

y <- gsub(",", "", regional_arrivals$`2007`)
regional_arrivals[,-1] <- as.numeric(gsub(",", "", as.matrix(regional_arrivals[,-1])))

# country arrivals
country_arrivals <- country_arrivals %>% 
  rename("2007" = X2007, "2008" = X2008, "2009" = X2009, "2010" = X2010, 
         "2011" = X2011, "2012" = X2012, "2013" = X2013, "2014" = X2014, 
         "2015" = X2015, "2016" = X2016)  

country_arrivals[,-1] <- as.numeric(gsub(",", "", as.matrix(country_arrivals[,-1])))

page_one <- tabPanel(
  "Changes Over the Obama Era",
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a region to see how arrivals from that area changed 
               over the Obama administration"),
      selectInput(
        "region", 
        label = "Region", 
        choices = regional_arrivals$Region.and.country.of.nationality, 
        selected = "Africa"
      )
      )
    ),
    mainPanel(
      plotOutput("region_time"),
      p("This plot displays the change in total arrivals over time of the
        selected region. The time frame is from 2008 to 2016, which marks the 
        election of President Obama and the end of his two terms.")
    )
    )

my_ui <-my_ui <- navbarPage(
  "Refugee Statistics Under the Obama Administration",
  page_one
)
    
=======
shinyUI(
  navbarPage(
    "Immigration to the US",
    tabPanel(
      "Overview",
      fluidPage(
        h1("US Immigration Status From Other Countries"),
        p("This project will explore the dataset of immigrants moving
          into the United States, provided by the ", strong("Homeland Security
          Department"),". More specifically, how did immigration was impacted 
          under the Obama administration from 2008 - 2016."),
        p("Here are a few questions we are trying to answer: "),
        h2()
      )
    )
  )
)
=======
library(shiny)
library(ggplot2)
library(dplyr)
>>>>>>> af830ed980fdf2674a8ba0d4d7efa0d61b93f098
>>>>>>> c692460e25121cfd7948c0bca12df35a41c89ba6
