# Loading in packages and sourcing in files

library(shiny)
library(shinythemes)
source("countries.R")

# This tab refers to the general stats for refugees during the Obama
# administrations.

general_stats <- tabPanel(
  "Changes Over the Obama Era",
  titlePanel("General Changes"),
  p(
    "This page gives a general overview of refugee statistics during the 
    Obama administration by presenting information about the refugee 
    ceiling and total arrivals. We've found that during Obama's first term 
    the ceiling was higher, but not all spots were filled. During his second 
    term, the ceiling was lower, but almost all of the spots were filled. 
    However, after 2015 the ceiling increased by 15,000 spots. This is", 
    em("most likely"), "due to the increase in Syrian refugees that fled 
    Syria because of its civil war. Additionally, although Asia consistently 
    had the highest amounts of refugees fleeing, Africa saw the largest and 
    most dramatic increase in people accepted as refugees."
  ),
  sidebarLayout(
    sidebarPanel("The refugee ceiling is the max number of 
    refugees allowed in the country set by the president."),
    mainPanel(
      plotOutput("ceilings"),
      p(""),
      p("As seen above, the ceiling has changed over time. It stayed steady for
        the first few years of Obama's presidency, but later dipped by a few thousand. 
        The ceiling was set to its highest over the eight years during the last year of 
        Obama's administration. It seems that at the peak of the Syrian, and
        consequentially the world, refugee crisis in 2015 the administration began
        admitting more people with refugee status."),
      p(""),
      p("")
    )
  ),
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a country to see how arrivals from that area 
               changed over the Obama administration"),
      selectInput(
        "country",
        label = "Country",
        choices = colnames(countries[, -1]),
        selected = "Afghanistan"
      )
    ),
    mainPanel(
      plotlyOutput("country_time"),
      p("This plot provides information about the total arrivals of a 
        selected country during the Obama administration. Specific 
        countries of interest include the Democratic Republic of the 
        Congo that experienced an increase from 727 in 2008 to 16370 
        accepted refugees in 2016. This increase may be attributed to 
        the reelection of President Kabila and their ongoing conflict 
        between rebel groups and the government. Syria also experienced 
        a", strong("large"), "increase from less than 50 people accepted 
        per year until 2014 to upwards of 10,000 by 2016."),
      p(""),
      p("")
    )
  ),
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a region to see how arrivals from that area changed 
               over the Obama administration"),
      selectInput("area",
        label = "Region",
        choices = c(
          "Africa" = "Africa",
          "Asia" = "Asia",
          "Europe" = "Europe",
          "North America" = "North_America",
          "Oceania" = "Oceania",
          "South America" = "South_America",
          "Unknown" = "Unknown"
        ),
        selected = "Asia"
      )
    ),
    mainPanel(
      plotlyOutput("region_time"),
      p(""),
      p(""),
      p("This plot displays the change in total arrivals over time of 
        the selected region. Based on this plot, we discovered that 
        Africa had an exponential increase in the amount of refugees 
        arriving in the United States in the last few years of Obama's 
        term.")
    )
  )
)

