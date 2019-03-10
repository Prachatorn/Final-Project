# Load in packages

library(shiny)
library(plotly)
library(ggplot2)
library(dplyr)

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