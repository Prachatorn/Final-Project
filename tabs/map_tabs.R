map_tabs <- 
  tabPanel(
    "World Maps Of Immigration And Asylum Seekers",
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
        plotlyOutput("maps"),
        p("Arrival - This takes in a count of immigrants from
          around the world arriving to the US."),
        p("Affirmative Asylum - This takes in the count of immigrants
          being allowed asylum by the United States government. 
          Affirmative asylums refers to immigrants living in the United 
          States, and are rarely detained by U.S. Immigrantion and Customs 
          Enforcement (U.S. Citizenship And Immigration Services).")
      )
    )
  )
