# Refugee Arrival Charts

arrival_attributes <- tabPanel(
  "Refugee Arrivals",
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a year to see the number of arrivals of a certain age in 
               the given year"),
      selectInput(
        "year_age", 
        label = "Year", 
        choices = list("2008" = "year_2008", "2009" = "year_2009",
                       "2010" = "year_2010", "2011"= "year_2011",
                       "2012" = "year_2012", "2013" = "year_2013",
                       "2014" = "year_2014", "2015" = "year_2015", 
                       "2016" = "year_2016")
      )
      ),
    mainPanel(
      plotOutput("age_chart"),
      p("This plot displays the...")
    )
),
sidebarLayout(
  sidebarPanel(
    helpText("Choose a year to see the number of Male and Female arrivals
             in the given year"),
    selectInput(
      "year_gender", 
      label = "Year", 
      choices = list("2008" = "year_2008", "2009" = "year_2009",
                     "2010" = "year_2010", "2011"= "year_2011",
                     "2012" = "year_2012", "2013" = "year_2013",
                     "2014" = "year_2014", "2015" = "year_2015", 
                     "2016" = "year_2016")
    )
    ),
  mainPanel(
    plotOutput("gender_chart"),
    p("This plot displays the...")
  )
),
sidebarLayout(
  sidebarPanel(
    helpText("Choose a year to see the number of arrivals with a certain
             Martial Status in the given year"),
    selectInput(
      "year_marital_status", 
      label = "Year", 
      choices = list("2008" = "year_2008", "2009" = "year_2009",
                     "2010" = "year_2010", "2011"= "year_2011",
                     "2012" = "year_2012", "2013" = "year_2013",
                     "2014" = "year_2014", "2015" = "year_2015", 
                     "2016" = "year_2016")
    )
  ),
  mainPanel(
    plotOutput("martial_status_chart"),
    p("This plot displays the...")
  )
 )
)