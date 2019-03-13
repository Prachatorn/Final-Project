# Arrival Charts

# Libraries used: 

library("dplyr")
library("tidyr")
library("ggplot2")
library("shiny")
library("rsconnect")

########################## CSV Files##############################################
# Read arrival age data
arrival_age_data <- read.csv("Refugees/arrival_age/combined_age.csv",
                             stringsAsFactors = FALSE)
# Read arrival gender data
arrival_gender_data <- read.csv("Refugees/arrival_gender/combined_gender.csv",
                                stringsAsFactors = FALSE)
# Read arrival marital status data
arrival_marital_status <- read.csv("Refugees/arrival_marital_status/combined_marital_status.csv",
                                   stringsAsFactors = FALSE)

#################### Arrival Charts ----ui.R-------#####################################
page_two <- tabPanel(
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
        # selected = ""
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
        # selected = ""
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
      # selected = ""
    )
    ),
  mainPanel(
    plotOutput("martial_status_chart"),
    p("This plot displays the...")
  )
)
)

############################# Server Function###########################

# Arrival Age Chart
output$age_chart <- renderPlot({
  arrival_age <- arrival_age_data %>%
    # filter(rename(character == "Under 1 year", character == "0 to 1 year")) %>% 
    filter(character != "Total") %>% 
    mutate(year_2008 = as.numeric(gsub(",", "", arrival_total_2008)), 
           year_2009 = as.numeric(gsub(",", "", arrival_total_2009)),
           year_2010 = as.numeric(gsub(",", "", arrival_total_2010)),
           year_2011 = as.numeric(gsub(",", "", arrival_total_2011)),
           year_2012 = as.numeric(gsub(",", "", arrival_total_2012)),
           year_2013 = as.numeric(gsub(",", "", arrival_total_2013)),
           year_2014 = as.numeric(gsub(",", "", arrival_total_2014)),
           year_2015 = as.numeric(gsub(",", "", arrival_total_2015)),
           year_2016 = as.numeric(gsub(",", "", arrival_total_2016))) %>% 
    select(character, year_2008, year_2009, year_2010,
           year_2011, year_2012,
           year_2013, year_2014,
           year_2015, year_2016)
  
  chart_two <- ggplot(data = arrival_age) +
    geom_col(
      mapping = aes_string(
        x = input$year_age, 
        y = "character", 
        fill = input$year_age,
        width = 5)
    )  +
    geom_point(
      mapping = aes_string(
        x = input$year_age,
        y = "character",
        color = input$year_age, 
        size = input$year_age)) + 
    labs(
      y = "Age",
      title = "Total Number of Refugees Arrived by Age vs. Given Year",
      color = "Number of Refugee Arrivals") +
    theme(
      axis.text.x = element_text(angle = 60, hjust = 1)) +
    ylim("Under 1 year", "1 to 4 years", "5 to 9 years", "10 to 14 years", "15 to 19 years",
         "20 to 24 years", "25 to 29 years", "30 to 34 years", "35 to 39 years", 
         "40 to 44 years", "45 to 49 years", "50 to 54 years", "55 to 59 years",
         "60 to 64 years", "65 to 74 years", "75 years and over")  
  chart_two
})


# Arrival Gender Chart
output$gender_chart <- renderPlot({
  arrival_f_m <- arrival_gender_data %>% 
    filter(character != "Total") %>% 
    mutate(year_2008 = as.numeric(gsub(",", "", arrival_total_2008)), 
           year_2009 = as.numeric(gsub(",", "", arrival_total_2009)),
           year_2010 = as.numeric(gsub(",", "", arrival_total_2010)),
           year_2011 = as.numeric(gsub(",", "", arrival_total_2011)),
           year_2012 = as.numeric(gsub(",", "", arrival_total_2012)),
           year_2013 = as.numeric(gsub(",", "", arrival_total_2013)),
           year_2014 = as.numeric(gsub(",", "", arrival_total_2014)),
           year_2015 = as.numeric(gsub(",", "", arrival_total_2015)),
           year_2016 = as.numeric(gsub(",", "", arrival_total_2016))) %>% 
    select(character, year_2008, year_2009, year_2010,
           year_2011, year_2012,
           year_2013, year_2014,
           year_2015, year_2016) 
  
  chart_three <- ggplot(data = arrival_f_m) +
    geom_col( 
      mapping = aes_string(
        x = "character",
        y = input$year_gender,
        fill = "character")
    ) + 
    labs(
      x = "Gender", title = "Total Number of Refugees Arrived by Gender vs. Given Year") +
    theme(
      axis.text.x = element_text(angle = 60, hjust = 1),
      legend.title = element_blank(),
      legend.position = "none") + 
    coord_flip()
  
  chart_three 
})


# Arrival Marital Status Chart
output$martial_status_chart <- renderPlot({
  marital_status_data <- arrival_marital_status %>% 
    filter(character != "Total") %>% 
    mutate(year_2008 = as.numeric(gsub(",", "", arrival_total_2008)), 
           year_2009 = as.numeric(gsub(",", "", arrival_total_2009)),
           year_2010 = as.numeric(gsub(",", "", arrival_total_2010)),
           year_2011 = as.numeric(gsub(",", "", arrival_total_2011)),
           year_2012 = as.numeric(gsub(",", "", arrival_total_2012)),
           year_2013 = as.numeric(gsub(",", "", arrival_total_2013)),
           year_2014 = as.numeric(gsub(",", "", arrival_total_2014)),
           year_2015 = as.numeric(gsub(",", "", arrival_total_2015)),
           year_2016 = as.numeric(gsub(",", "", arrival_total_2016))) %>% 
    select(character, year_2008, year_2009, year_2010,
           year_2011, year_2012,
           year_2013, year_2014,
           year_2015, year_2016)
  
  chart_four <- ggplot(data = marital_status_data) +
    geom_col(
      mapping = aes_string(
        x = "character",
        y = input$year_marital_status,
        fill = "character")
    ) + 
    labs(
      x = "Marital Status",
      title = "Total number of Refugees Arrived by Marital Status vs. Given Year") +
    theme(
      axis.text.x = element_text(angle = 60, hjust = 1), legend.position = "none") + 
    coord_flip()
  
  chart_four
})
}