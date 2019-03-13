#Read in packages
library(dplyr)
library(ggplot2)
library(shiny)
library(lintr)
library(tidyr)


#Read in Country Affirmative Asylum Data
affirmative <- read.csv("country_affirmative_asylum copy.csv", stringsAsFactors = FALSE)

#Make data frame from 2008 - 2016
affirmative <- affirmative %>%
  select(Country, X2008, X2009, X2010, X2011, X2012, X2013, X2014, X2015, X2016)

#Read in Country Defensive Asylum Data
defensive <- read.csv("country_defensive_asylum.csv", stringsAsFactors = FALSE)

#Make data frame of 2008-2016
defensive <- defensive %>%
  select(Country, X2008, X2009, X2010, X2011, X2012, X2013, X2014, X2015, X2016)

#replace non numeric values with NA, then
affirmative[,-1] <- as.numeric(gsub(",", "", as.matrix(affirmative[,-1])))
affirmative[is.na(affirmative)] <- 0
defensive[,-1] <- as.numeric(gsub(",", "", as.matrix(defensive[,-1])))
defensive[is.na(defensive)] <- 0

#Create data frame of total and country
total <- affirmative %>%
  filter(Country == "Total") %>%
  select(Country, X2008, X2009, X2010, X2011, X2012, X2013, X2014, X2015, X2016)

#put years in a column for affirmative
gather_affirm <- 
  gather(affirmative,
    key = Year,
    value = Value,
    X2008:X2016
  ) %>% 
  mutate(Year = stringr::str_replace(Year, "X", "") %>% as.numeric())
  gather_affirm$Year <- as.character(gather_affirm$Year)

#Years into columns for defensive
gather_defens <- 
  gather(defensive,
         key = Year,
         value = Value,
         X2008:X2016
  ) %>% 
  mutate(Year = stringr::str_replace(Year, "X", "") %>% as.numeric()) 
  gather_defens$Year <- as.character(gather_defens$Year)

#Define shiny server
shinyServer <- function(input, output){
 filtered_Data <- reactive({
   filtered_D <- filter(gather_affirm, gather_affirm$Country == input$country)
   })
  
filtered <- reactive({
  filter <- filter(gather_defens, gather_defens$Country == input$select_country)
  })


#plot of Affrimative Asylum
output$plot <- renderPlot({
  ggplot(filtered_Data(), aes(x=Year,y = Value, fill = Value)) + geom_bar(stat = "identity") +
    ggtitle("Affirmative Asylum") +
    xlab("Year") +
    ylab("Number of Affirmative Asylum Cases") +
    theme_grey(base_size = 18)
})
#Plot defensice asylum graph
output$defensive <- renderPlot({
  ggplot(filtered(), aes(x=Year,y = Value, fill = Value)) + geom_bar(stat = "identity") +
    ggtitle("Defensive Asylum") +
    xlab("Year") +
    ylab("Number of Defensive Asylum Cases") +
    theme_grey(base_size = 18)
})
}

