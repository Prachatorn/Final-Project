#<<<<<<< HEAD
# Load in packages

library(shiny)
library(plotly)
library(ggplot2)
library(dplyr)
library(tidyr)
<<<<<<< HEAD
library(rsconnect)
=======
>>>>>>> 9ffd48e968d4cf7a30f4275f48387e7c03a10b38

#<<<<<<< HEAD
#Obama Era Stats
#regional arrivals chart
# regional_arrivals <- read.csv("Refugees/regional_arrivals.csv", 
#                               stringsAsFactors = F)
# regional_arrivals <- regional_arrivals %>% 
#   rename("2007" = X2007, "2008" = X2008, "2009" = X2009, "2010" = X2010, 
#          "2011" = X2011, "2012" = X2012, "2013" = X2013, "2014" = X2014, 
#          "2015" = X2015, "2016" = X2016)  
# 
# regional_arrivals[,-1] <- suppressWarnings(as.numeric(gsub(",", "", 
#                                                            as.matrix(
#                                                              regional_arrivals[,-1]))))
# regional_arrivals[is.na(regional_arrivals)] <- 0
# 
# # country arrivals
# country_arrivals <- read.csv("Refugees/country_arrivals.csv", 
#                              stringsAsFactors = F)
# 
# country_arrivals <- country_arrivals %>% 
#   rename("2007" = X2007, "2008" = X2008, "2009" = X2009, "2010" = X2010, 
#          "2011" = X2011, "2012" = X2012, "2013" = X2013, "2014" = X2014, 
#          "2015" = X2015, "2016" = X2016)  
# 
# country_arrivals[,-1] <- suppressWarnings(as.numeric(gsub(",", "", 
#                                                          as.matrix(
#                                                       country_arrivals[,-1]))))
# country_arrivals[is.na(country_arrivals)] <- 0
# 
# page_one <- tabPanel(
#   "Changes Over the Obama Era",
#   sidebarLayout(
#     sidebarPanel(
#       helpText("Choose a region to see how arrivals from that area changed 
#                over the Obama administration"),
#       selectInput(
#         "region", 
#         label = "Region", 
#         choices = regional_arrivals$Region.and.country.of.nationality, 
#         selected = "Africa"
#       )
#       ),
#     mainPanel(
#       plotOutput("region_time"),
#       p("This plot displays the change in total arrivals over time of the
#         selected region. The time frame is from 2008 to 2016, which marks the 
#         election of President Obama and the end of his two terms.")
#      
#     )
#     ),
# sidebarLayout(
#   sidebarPanel(
#   helpText("Choose a country (or two) to see how arrivals from that area 
#   changed over the Obama administration"),
#   selectInput(
#     "country", 
#    label = "country", 
#    choices = country_arrivals$Country, 
#    selected = "Afghanistan"
#    )
#    ),
#     mainPanel(
#       plotOutput("country_time"),
#       p("This plot provides information about the total arrivals of a selected
#     country during the Obama administration. You may select one or two 
#     countries to compare their numbers.")
#     )
#   )
# )

<<<<<<< HEAD
page_two <- tabPanel(
  "Refugee Arrivals",
=======
regional_arrivals[,-1] <- suppressWarnings(as.numeric(gsub(",", "", 
                                                           as.matrix(
                                                             regional_arrivals[,-1]))))
regional_arrivals[is.na(regional_arrivals)] <- 0
regionals <- regional_arrivals %>%
  select(Region.and.country.of.nationality, `2008`, `2009`, `2010`, `2011`, `2012`,
         `2013`, `2014`, `2015`, `2016`) %>%
  gather(key = year, value = totals, `2008`:`2016`, -Region.and.country.of.nationality)

# country arrivals
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

page_one <- tabPanel(
  "Changes Over the Obama Era",
>>>>>>> 9ffd48e968d4cf7a30f4275f48387e7c03a10b38
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a year to see the number of arrivals of a certain age in 
               the given year"),
      selectInput(
<<<<<<< HEAD
        "year_age", 
        label = "Year", 
        choices = list("2008" = "year_2008", "2009" = "year_2009",
                        "2010" = "year_2010", "2011"= "year_2011",
                       "2012" = "year_2012", "2013" = "year_2013",
                       "2014" = "year_2014", "2015" = "year_2015", 
                       "2016" = "year_2016")
        # selected = ""
=======
        "area", 
        label = "Region", 
        choices = c("africa" = "africa", "asia" = "asia", "europe" = "europe",
                    "north_america" = "north_america", "oceania" =  "oceania", 
                    "south_america" = "south_amerca", "unknown" = "unknown"),
        selected = "Asia"
>>>>>>> 9ffd48e968d4cf7a30f4275f48387e7c03a10b38
      )
      ),
    mainPanel(
      plotOutput("age_chart"),
      p("This plot displays the...")
    )
      ),
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a year to see the number of Male and Female arrivals
                in the given year"),
      selectInput(
        "year_gender", 
        label = "Year", 
        choices = list("2008" = "year_2008", "2009" = "year_2009",
                       "2010" = "year_2010", "2011"= "year_2011",
                       "2012" = "year_2012", "2013" = "year_2013",
                       "2014" = "year_2014", "2015" = "year_2015", 
                       "2016" = "year_2016")
        # selected = ""
      )
    ),
    mainPanel(
      plotOutput("gender_chart"),
      p("This plot displays the...")
    )
  ),
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a year to see the number of arrivals with a certain
               Martial Status in the given year"),
      selectInput(
        "year_marital_status", 
        label = "Year", 
        choices = list("2008" = "year_2008", "2009" = "year_2009",
                       "2010" = "year_2010", "2011"= "year_2011",
                       "2012" = "year_2012", "2013" = "year_2013",
                       "2014" = "year_2014", "2015" = "year_2015", 
                       "2016" = "year_2016")
        # selected = ""
      )
    ),
    mainPanel(
      plotOutput("martial_status_chart"),
      p("This plot displays the...")
    )
  )
)

my_ui <- navbarPage(
  "Refugee Statistics Under the Obama Administration",
  # page_one,
  page_two
)
    
#=======
#shinyUI(
 # navbarPage(
  #  "Immigration to the US",
  #  tabPanel(
   #   "Overview",
    #  fluidPage(
    #    h1("US Immigration Status From Other Countries"),
     #   p("This project will explore the dataset of immigrants moving
         # into the United States, provided by the ", strong("Homeland Security
         # Department"),". More specifically, how did immigration was impacted 
         # under the Obama administration from 2008 - 2016."),
     #   p("Here are a few questions we are trying to answer: "),
      #  h2()
     # )
   # )
 # )
#)
#=======

#>>>>>>> af830ed980fdf2674a8ba0d4d7efa0d61b93f098
#>>>>>>> c692460e25121cfd7948c0bca12df35a41c89ba6

