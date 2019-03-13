# Load in packages and other files.
library(shiny)
library(shinythemes)
source("tabs/map_tab.R")
source("tabs/general_stats_tab.R")
source("tabs/overview_tab.R")
source("tabs/arrivals_tab.R")

shinyUI(
  navbarPage(
    theme = shinytheme("united"),
    "Refugee Statistics during the Obama Administration",
    overview,
    general_stats,
    page_two,
    map_tabs
  )
)


    

