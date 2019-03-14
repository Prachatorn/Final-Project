# Load in packages and other files.
library(shiny)
library(shinythemes)
library(plotly)
source("tabs/map_tab.R")
source("tabs/general_stats_tab.R")
source("tabs/overview_tab.R")
source("tabs/arrivals_tab.R")
source("tabs/asylum_tab.R")

shinyUI(
  navbarPage(
    "Refugee Statistics during the Obama Administration",
    theme = shinytheme("united"),
    overview,
    general_stats,
    arrival_characteristics,
    asylum_tab,
    map_tabs
  )
)


    

