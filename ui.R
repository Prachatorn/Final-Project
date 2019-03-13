# Load in packages

library(shiny)
library(plotly)
library(ggplot2)
library(dplyr)
library(tidyr)
source("map_tabs.R")

shinyUI(
  navbarPage(
    "Immigrants",
    map_tabs
  )
)


    

