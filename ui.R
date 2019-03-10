library(shiny)
library(ggplot2)
library(dplyr)

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
    