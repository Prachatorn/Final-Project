# Load in packages

library(shiny)
library(plotly)
library(ggplot2)
library(dplyr)
library(tidyr)
library(shinythemes)
source("map_tabs.R")
source("julianne.R")

shinyUI(
  
  navbarPage(
    theme = shinytheme("united"),
    "Refugee Statistics during the Obama Administration",
    tabPanel(
          h2("Interested in Learning the Real Facts About Refugee Statistics Under the
            Obama Administration?"),
          p("Welcome to our final project homepage. We wanted to study immigration in 
        the United States in order to bring awareness to real data during a time 
        in our country where harmful rhetoric is often tossed around without 
        prior fact checking. Our hope is that this site sheds light on how 
        immigration, in the form of refugee arrivals, changed over time during 
        the Obama administration."),
          p("We gathered our data from the Department of Homeland Security and 
            the Refugee Processing Center websites. These sites collected raw 
            data from Worldwide Refugee Admissions Processing System (WRAPS) of 
            the Bureau of Population, Refugees, and Migration of the U.S. 
            Department of State."),
          p("Some of the questions we hope to answer include:"),
          p("    - Given two presidential terms with Obama, have refugee arrivals 
              changed or stayed the same in that time?"),
            p("    - What was the refugee cap for a given year? Were all of the spots 
            filled?"),
            p("    - From which countries were people granted asylum?"),
            p("    - How many people were granted affirmative vs defensive asylum?"),
            p("    - How many people from a given country arrived each year? "),
            p("    Which regions did they arrive from? How has that changed over time?"),
            p("    - What were average age, sex, marital status for a given year?")
          ),
    julianne_general_stats,
    map_tabs

  )
)


    

