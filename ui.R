# Load in packages

library(shiny)
library(plotly)
library(ggplot2)
library(dplyr)
library(tidyr)
library(shinythemes)
source("tabs/map_tabs.R")
source("tabs/julianne_general_stats.R")
source("tabs/overview.R")

shinyUI(
  
  navbarPage(
    theme = shinytheme("united"),
    "Refugee Statistics during the Obama Administration",
    overview,
    julianne_general_stats,
    map_tabs

  )
)


    

