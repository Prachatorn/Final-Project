library(ggplot2)
library(dplyr)
library(tidyr)
library(shiny)
library(rsconnect)
library(data.table)
library(plotly)
source("countries.R")
#Show the caps & spots filled charts
#Show how immigration has changed over time

# Refugee caps
caps <- data.frame("Year" = c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015,
                              2016), "Cap" = c(80000, 80000, 80000, 80000, 76000,
                                               70000, 70000, 70000, 85000),
                   "Admitted" = c(60107, 74602, 73293, 56384, 58179, 69909,
                                  69975, 69920, 84989))


# Regions
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

#Countries

#Plots
server <- function(input, output) {
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
}

#UI

  julianne_general_stats <- tabPanel(
    "Changes Over the Obama Era",
    
    sidebarLayout(
        sidebarPanel(
          helpText("The ceiling cap for refugee admittance has changed drastically in
               the last few years. The graph to the left displays more information 
               about the amount of people given refugee status in the United States
               versus the the amount of possible spots during the Obama Administration.")
        ),
        mainPanel(
          plotOutput("ceilings"),
          p("As seen above, the ceiling has changed over time. It stayed steady for
            the first few years of Obama's presidency, but later dipped by a few thousand. 
            The ceiling was set to its highest over the eight years during the last year of 
            Obama's administration. It seems that at the peak of the Syrian, and
            consequentially the world, refugee crisis in 2015 the administration began
            admitting more people with refugee status.")
        )
    ),
    sidebarLayout(
      sidebarPanel(
        helpText("Choose a country to see how arrivals from that area 
                 changed over the Obama administration"),
        selectInput(
          "country", 
          label = "Country", 
          choices = colnames(countries[,-1]), 
          selected = "Afghanistan"
        )
        ),
        mainPanel(
          plotlyOutput("country_time"),
          p("This plot provides information about the total arrivals of a selected
              country during the Obama administration.")
        )
    ),
    sidebarLayout(
      sidebarPanel(
        helpText("Choose a region to see how arrivals from that area changed 
                 over the Obama administration"),
        selectInput("area", 
          label = "Region", 
          choices = c("Africa" = "africa", "Asia" = "asia", "Europe" = "europe",
                "North America" = "north_america", "Oceania" =  "oceania", 
                "South America" = "south_america", "Unknown" = "unknown"),
          selected = "Asia"
        )
      ),
    mainPanel(
      plotlyOutput("region_time"),
      p("This plot displays the change in total arrivals over time of the
         selected region. The time frame is from 2008 to 2016, which marks the 
                 election of President Obama and the end of his two terms. Based 
        on this plot, we discovered that Africa had an exponential increase
        in the amount of refugees arriving in the United States in the last few
        years of Obama's term.")
      )
    )
)