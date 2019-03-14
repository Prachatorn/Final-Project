# This tab refers to the demographic of refugees arriving into the United
# States, making subgroups for age, gender, and marital status.

arrival_characteristics <-
  tabPanel(
    "Arrival Demographics",
    titlePanel("Demographics: Age, Gender, and Marital Status"),
  tabsetPanel(
    tabPanel(
      "Age",
      sidebarLayout(
        sidebarPanel(
          helpText("Choose a year to see the number of arrivals of a certain 
                    age during a given year"),
          selectInput(
            "year_age",
            label = "Year",
            choices = list(
              "2008" = "year_2008", "2009" = "year_2009",
              "2010" = "year_2010", "2011" = "year_2011",
              "2012" = "year_2012", "2013" = "year_2013",
              "2014" = "year_2014", "2015" = "year_2015",
              "2016" = "year_2016"
            )
          )
        ),
        mainPanel(
          plotOutput("age_chart"),
          p(""),
          p("This graph displays the ages of the refugees during 2008 - 2016.
            In years 2008 to 2013 most refugees were ages 20 to 29. In 2015
            and 2016, there was a tremendous amount of children under the age
            of 10 years old.")
        )
      )
    ),
    tabPanel(
      "Gender",
      sidebarLayout(
        sidebarPanel(
          helpText("Choose a year to see the number of male and female arrivals
             during a given year"),
          selectInput(
            "year_gender",
            label = "Year",
            choices = list(
              "2008" = "year_2008", "2009" = "year_2009",
              "2010" = "year_2010", "2011" = "year_2011",
              "2012" = "year_2012", "2013" = "year_2013",
              "2014" = "year_2014", "2015" = "year_2015",
              "2016" = "year_2016"
            )
          )
        ),
        mainPanel(
          plotlyOutput("gender_chart"),
          p(""),
          p("This graph displays the number of male and female refugees
            during 2008 - 2016. Only in 2015, there were more female than
            male refugees that came to the United States.")
        )
      )
    ),
    tabPanel(
      "Marital Status",
      sidebarLayout(
        sidebarPanel(
          helpText("Choose a year to see the number of arrivals with a certain
                    martial status during a given year"),
          selectInput(
            "year_marital_status",
            label = "Year",
            choices = list(
              "2008" = "year_2008", "2009" = "year_2009",
              "2010" = "year_2010", "2011" = "year_2011",
              "2012" = "year_2012", "2013" = "year_2013",
              "2014" = "year_2014", "2015" = "year_2015",
              "2016" = "year_2016"
            )
          )
        ),
        mainPanel(
          plotlyOutput("martial_status_chart"),
          p(""),
          p("This graph displays the marital status of the refugees that
            came to the United States during 2008 - 2016. In 2009 and 2016,
            majority of the refugees were single. Then in 2015 majority of
            the refugees were married.")
        )
      )
    )
  )
)
