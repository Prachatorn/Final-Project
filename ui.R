# Load in packages and other files.
library(shiny)
library(shinythemes)
source("tabs/map_tabs.R")
source("tabs/general_stats.R")
source("tabs/overview.R")
source("tabs/arrivals_tab.R")

shinyUI(
  navbarPage(
    theme = shinytheme("united"),
    "Refugee Statistics during the Obama Administration",
    overview,
    julianne_general_stats,
    page_two,
    map_tabs
  )
)


    

