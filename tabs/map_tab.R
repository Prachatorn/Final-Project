# This tab refers to having the world map and allowing the user to see which
# countries has refugees and asylum seekers from 2008 - 2016.

map_tabs <- 
  tabPanel(
    "World Maps Of Refugees And Asylum Seekers",
    titlePanel("World Map"),
    sidebarLayout(
      sidebarPanel(
        selectInput(
          "asylums",
          label = "Choose A Map",
          choices = list(
            "Arrivals" = "Arrivals", "Affirmative" = "Affirmative",
            "Defensive" = "Defensive"
          )
        ),
        sliderInput(
          "year",
          "Looping Animation:",
          label = "Choose A Year",
          min = 2007,
          max = 2016,
          value = 1,
          step = 1,
          animate = animationOptions(
            interval = 1000,
            loop = TRUE
          )
        )
      ),
      mainPanel(
        plotlyOutput("maps"),
        p(""),
        p("This page provides maps for the different datasets we used in this
       project. Choose from the drop down menu to view either the total
       refugee arrivals, affensive asylum seekers, or the defensive asylum
       seekers by country. The darker the color the more dense the
       population is of immigrants from that country. Some of our insights
       show that China consistenly has the highest population of asylum seekers
       in the US.")
      )
    )
  )
