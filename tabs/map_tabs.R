map_tabs <- 
  tabPanel(
    "World Maps",
    sidebarLayout(
      sidebarPanel(
        selectInput(
          "asylums",
          label = "Choose A Map",
          choices = list("Arrivals" = "Arrivals", "Affirmative" = "Affirmative",
                         "Defensive" = "Defensive")
        ),
        selectInput(
          "year",
          label = "Choose A Year",
          choices = list("2007" = "2007", "2008" = "2008", "2009" = "2009",
                         "2010" = "2010", "2011" = "2011", "2012" = "2012",
                         "2013" = "2013", "2014" = "2014", "2015" = "2015",
                         "2016" = "2016")
        )
      ),
      mainPanel(
        plotlyOutput("maps")
      )
    )
  )
