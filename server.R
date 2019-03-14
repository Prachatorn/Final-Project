#Read in packages
library(dplyr)
library(ggplot2)
library(shiny)
library(tidyr)
library(rsconnect)
source("countries.R")
source("gather_asylums.R")
source("regional_and_caps.R")
source("world_map.R")

# Read arrival age data
arrival_age_data <- read.csv("Refugees/arrival_age/combined_age.csv",
                             stringsAsFactors = FALSE)
# Read arrival gender data
arrival_gender_data <- read.csv("Refugees/arrival_gender/combined_gender.csv",
                                stringsAsFactors = FALSE)
# Read arrival marital status data
arrival_marital_status <- read.csv("Refugees/arrival_marital_status/combined_marital_status.csv",
                                   stringsAsFactors = FALSE)

server <- function(input, output) {
  
  #Julianne
  output$ceilings <- renderPlot({
    ggplot(caps, aes(x = Year)) +
      geom_line(aes(y= Cap, colour= "Cap")) +
      geom_line(aes(y= Admitted, colour= "Admitted")) +
      geom_point(aes (y = Cap)) +
      geom_point(aes (y = Admitted)) +
      scale_y_continuous("Total Numbers of People",
                         breaks= seq(56000, 86000, 2000)) +
      ggtitle("Refugee Admissions Ceiling vs Total Refugee Admissions") +
      scale_color_manual(name = "Total Numbers", values= c("Cap" = "red",
                                                           "Admitted" = "green"),
                         labels = c("Admitted", "Ceiling Cap"))
    
  })
  
  output$region_time <- renderPlotly({
    region_plot <- ggplot(regionals,
                          aes_string(
                            x = "years",
                            y = input$area
                          )
    ) + geom_line(color = "orange") +
      ggtitle("Change in Total Regional Arrivals by Region From 2008-2016") +
      xlab("Year") +
      ylab("Arrivals")
    
    region_plot2 <- ggplotly(region_plot)
    region_plot2
  })
  
  output$country_time <- renderPlotly({
    country_plot <- ggplot(countries,
                           aes_string(
                             x = "year",
                             y = input$country
                           )
    ) + geom_line(color = "purple") +
      ggtitle("Change in Total Arrivals by Country From 2008-2016") +
      xlab("Year") +
      ylab("Arrivals")
    
    country_plot2 <- ggplotly(country_plot)
    country_plot2
  })
  
  #Prachatorn
    output$maps <- renderPlotly ({
      return(world_map(input$asylums,input$year))
    })
    
    #Hekma
    output$age_chart <- renderPlot({
      arrival_age <- arrival_age_data %>%
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
            width = 5
          )
        )+
        geom_point(
          mapping = aes_string(
            x = input$year_age,
            y = "character",
            color = input$year_age,
            size = input$year_age)) + 
        labs(
          y = "Age",
          title = paste0("Total Number of Refugees Arrived by Age vs. ",
                         gsub("year_", "", input$year_age)),
          color = "Number of Refugee Arrivals", size = "Number of Refugee Arrivals") +
        theme(
          axis.text.x = element_text(angle = 60, hjust = 1), 
          axis.title.x = element_blank()) +
        ylim("Under 1 year", "1 to 4 years", "5 to 9 years", "10 to 14 years", "15 to 19 years",
             "20 to 24 years", "25 to 29 years", "30 to 34 years", "35 to 39 years", 
             "40 to 44 years", "45 to 49 years", "50 to 54 years", "55 to 59 years",
             "60 to 64 years", "65 to 74 years", "75 years and over") +
        scale_color_gradient(high = "darkblue", low = "lightblue") 
      
      chart_two
      
    })
    # Arrival Gender Chart
    output$gender_chart <- renderPlotly({
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
      
      arrival_f_m <- arrival_f_m %>%
        mutate(color = c("lightcoral", "cyan3"))
      
      chart_three <- ggplot(data = arrival_f_m) +
        geom_col( 
          mapping = aes_string(
            x = "character",
            y = input$year_gender
            # fill = "character"
          ), fill = arrival_f_m$color
        ) + 
        labs(
          x = "Gender", title = paste0("Total Number of Refugees Arrived by Gender vs. ",
                                       gsub("year_", "", input$year_gender))) +
        theme(
          axis.text.x = element_text(angle = 60, hjust = 1),
          legend.title = element_blank(),
          legend.position = "none") + 
        coord_flip()
      
      chart3 <- ggplotly(chart_three)
    })
    # Arrival Marital Status Chart
    output$martial_status_chart <- renderPlotly({
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
      
      marital_status_data <-marital_status_data%>%
        mutate(color = c("brown2","yellowgreen", "seagreen",
                         "deepskyblue2", "magenta1"
        ))
      
      
      chart_four <- ggplot(data = marital_status_data) +
        geom_col(
          mapping = aes_string(
            x = "character",
            y = input$year_marital_status
          ), fill = marital_status_data$color
        ) + 
        labs(
          x = "Marital Status",
          title = paste0("Total number of Refugees Arrived by Marital Status vs. ", 
                         gsub("year_", "", input$year_marital_status))) +
        theme(
          axis.text.x = element_text(angle = 60, hjust = 1), legend.position = "none") + 
        coord_flip()
      
      chart4 <- ggplotly(chart_four)
      chart4
    })
    
    #Marina
    filtered_Data <- reactive({
      filtered_D <- filter(gather_affirm, gather_affirm$Country == input$select_country)
    })
    
    filtered <- reactive({
      filter <- filter(gather_defens, gather_defens$Country == input$select_country2)
    })
    
    
    #plot of Affrimative Asylum
    output$affirmative <- renderPlot({
      ggplot(filtered_Data(), aes(x = Year,y = Value, fill = Value)) + 
        geom_bar(stat = "identity") +
        ggtitle(paste0("Affirmative Asylum for ", input$select_country)) +
        xlab("Year") +
        ylab("Number of Affirmative Asylum Cases") +
        theme_grey(base_size = 18)
    })
    
    #Plot defensice asylum graph
    output$defensive <- renderPlot({
      ggplot(filtered(), aes(x = Year,y = Value, fill = Value)) + 
        geom_bar(stat = "identity") +
        ggtitle(paste0("Defensive Asylum for ", input$select_country2)) +
        xlab("Year") +
        ylab("Number of Defensive Asylum Cases") +
        theme_grey(base_size = 18)
    })
}

