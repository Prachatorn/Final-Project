library(shiny)
library(dplyr)
library(ggplot2)


server <- function(input, output) {

  # Obama Era Stats
  regional_arrivals <- read.csv("Refugees/regional_arrivals.csv", 
                                stringsAsFactors = F)
  regional_arrivals <- regional_arrivals %>% 
    rename("2007" = X2007, "2008" = X2008, "2009" = X2009, "2010" = X2010, 
           "2011" = X2011, "2012" = X2012, "2013" = X2013, "2014" = X2014, 
           "2015" = X2015, "2016" = X2016)  
  
  y <- gsub(",", "", regional_arrivals$`2007`)
  regional_arrivals[,-1] <- as.numeric(gsub(",", "", as.matrix(regional_arrivals[,-1])))
  
  output$region_time <- renderPlot({
    plot1 <- ggplot(regional_arrivals,
                  aes(
                    x = regional_arrivals[2:11],
                    y = input$region,
                    color = "blue")
  ) + geom_line() +
    ggtitle("Change in Total Regional Arrivals From 2008-2016") +
    xlab("Year") +
    ylab("Arrivals")
})

  output$refugee_cap <- renderPlot({
    plot1 <- ggplot(regional_arrivals,
                    aes(
                      x = regional_arrivals[2:11],
                      y = input$region,
                      color = "blue")
    ) + geom_line() +
      ggtitle("Change in Total Regional Arrivals From 2008-2016") +
      xlab("Year") +
      ylab("Arrivals")
  })
  
  
}