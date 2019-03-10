#<<<<<<< HEAD
shinyServer(function(input, output) {
  
})
#=======
library(shiny)
library(dplyr)
library(ggplot2)


#<<<<<<< HEAD
server <- function(input, output) {

  # Obama Era Stats
  regional_arrivals <- read.csv("Refugees/regional_arrivals.csv", 
                                stringsAsFactors = F)
  regional_arrivals <- regional_arrivals %>% 
    rename("2007" = X2007, "2008" = X2008, "2009" = X2009, "2010" = X2010, 
           "2011" = X2011, "2012" = X2012, "2013" = X2013, "2014" = X2014, 
           "2015" = X2015, "2016" = X2016)  
  
  y <- gsub(",", "", regional_arrivals$`2007`)
  regional_arrivals[,-1] <- suppressWarnings(as.numeric(gsub(",", "", 
                                                      as.matrix(
                                                      regional_arrivals[,-1]))))
  regional_arrivals[is.na(regional_arrivals)] <- 0
  
  country_arrivals <- read.csv("Refugees/country_arrivals.csv", 
                               stringsAsFactors = F)
  
  country_arrivals <- country_arrivals %>% 
    rename("2007" = X2007, "2008" = X2008, "2009" = X2009, "2010" = X2010, 
           "2011" = X2011, "2012" = X2012, "2013" = X2013, "2014" = X2014, 
           "2015" = X2015, "2016" = X2016)  
  
  country_arrivals[,-1] <- suppressWarnings(as.numeric(gsub(",", "", 
                                                      as.matrix(
                                                      country_arrivals[,-1]))))
  country_arrivals[is.na(country_arrivals)] <- 0
  
  #Plots 
  output$region_time <- renderPlot({
    ggplot(regional_arrivals,
                  aes(
                    x = regional_arrivals[2:11],
                    y = input$region,
                    color = "blue")
  ) + geom_line() +
    ggtitle("Change in Total Regional Arrivals From 2008-2016") +
    xlab("Year") +
    ylab("Arrivals")
})

  output$country_time <- renderPlot({
     ggplot(country_arrivals,
                    aes(
                      x = country_arrivals[2:11],
                      y = input$country,
                      color = "pink")
    ) + geom_line() +
      ggtitle("Change in Total Arrivals From 2008-2016") +
      xlab("Year") +
      ylab("Arrivals")
  })
  
  
}
#=======
#>>>>>>> af830ed980fdf2674a8ba0d4d7efa0d61b93f098
#>>>>>>> c692460e25121cfd7948c0bca12df35a41c89ba6
newdaa <- list()
newdaa$years <- c(2007:2016)
