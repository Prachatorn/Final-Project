julianne_general_stats <- tabPanel(
  "Changes Over the Obama Era",
  
  sidebarLayout(
    sidebarPanel(
      helpText("The ceiling cap for refugee admittance has changed drastically in
               the last few years. The graph to the left displays more information 
               about the amount of people given refugee status in the United States
               versus the the amount of possible spots during the Obama Administration.")
      ),
    mainPanel(
      plotOutput("ceilings"),
      p("As seen above, the ceiling has changed over time. It stayed steady for
        the first few years of Obama's presidency, but later dipped by a few thousand. 
        The ceiling was set to its highest over the eight years during the last year of 
        Obama's administration. It seems that at the peak of the Syrian, and
        consequentially the world, refugee crisis in 2015 the administration began
        admitting more people with refugee status.")
      )
      ),
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a country to see how arrivals from that area 
               changed over the Obama administration"),
      selectInput(
        "country", 
        label = "Country", 
        choices = colnames(countries[,-1]), 
        selected = "Afghanistan"
      )
      ),
    mainPanel(
      plotlyOutput("country_time"),
      p("This plot provides information about the total arrivals of a selected
        country during the Obama administration.")
      )
    ),
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a region to see how arrivals from that area changed 
               over the Obama administration"),
        selectInput("area", 
          label = "Region", 
          choices = c("Africa" = "africa", "Asia" = "asia", "Europe" = "europe",
                "North America" = "north_america", "Oceania" =  "oceania", 
                "South America" = "south_america", "Unknown" = "unknown"),
          selected = "Asia"
        )
      ),
    mainPanel(
      plotlyOutput("region_time"),
      p("This plot displays the change in total arrivals over time of the
        selected region. The time frame is from 2008 to 2016, which marks the 
        election of President Obama and the end of his two terms. Based 
        on this plot, we discovered that Africa had an exponential increase
        in the amount of refugees arriving in the United States in the last few
        years of Obama's term.")
      )
    )
)