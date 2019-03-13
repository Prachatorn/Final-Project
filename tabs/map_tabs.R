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
        sliderInput(
          "year",
          label = "Choose A Year",
          min = 2007,
          max = 2016,
          value = "2007"
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
