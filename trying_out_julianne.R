library(ggplot2)
library(dplyr)
library(tidyr)

#Show the caps & spots filled charts
#Show how immigration has changed over time

arrivals_obama <- read.csv("Refugees/total_arrival.csv", stringsAsFactors = F)
regional_arrivals <- read.csv("Refugees/regional_arrivals.csv", 
                              stringsAsFactors = F)
country_arrivals <- read.csv("Refugees/country_arrivals.csv", 
                             stringsAsFactors = F)

caps <- data.frame("Year" = c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 
                              2016), "Cap" = c(80000, 80000, 80000, 80000, 76000,
                                               70000, 70000, 70000, 85000), 
                   "Admitted" = c(60107, 74602, 73293, 56384, 58179, 69909, 
                                  69975, 69920, 84989))

# Refugee caps
#refugee_ceiling_plot <- 

ggplot(caps, aes(x = Year)) +                    # basic graphical object
         geom_line(aes(y= Cap, colour= "Cap")) +  # first layer
         geom_line(aes(y= Admitted, colour= "Admitted")) +
        geom_point(aes (y = Cap)) +
  geom_point(aes (y = Admitted)) + 
  scale_y_continuous("Total Numbers of People", 
                   breaks= seq(56000, 86000, 2000)) +
  ggtitle("Refugee Admissions Ceiling vs Total Refugee Admissions") + 
scale_color_manual(name = "Total Numbers", values= c("Cap" = "red",
                                                        "Admitted" = "green"),
                       labels = c("Admitted", "Ceiling Cap")) 


# Regional Arrivals graphs
regional_arrivals <- regional_arrivals %>% 
  rename("2007" = X2007, "2008" = X2008, "2009" = X2009, "2010" = X2010, 
         "2011" = X2011, "2012" = X2012, "2013" = X2013, "2014" = X2014, 
         "2015" = X2015, "2016" = X2016)  

regional_arrivals[,-1] <- suppressWarnings(as.numeric(gsub(",", "", 
                                                           as.matrix(
                                                             regional_arrivals[,-1]))))
regional_arrivals[is.na(regional_arrivals)] <- 0
regional_arrivals$year <- list("")

regionals <- regional_arrivals %>%
  select(Region.and.country.of.nationality, `2008`, `2009`, `2010`, `2011`, `2012`,
         `2013`, `2014`, `2015`, `2016`) %>%
  gather(key = year, value = totals, `2008`:`2016`) # all columns except `state`
regionals <- regionals %>% 
  mutate(year = as.numeric(year))

ggplot(regionals,
       aes(
         x = year
          
         #color = "blue"
         #regionals$Region.and.country.of.nationality == "Africa"
         )
) + geom_line(aes(y = regionals$Region.and.country.of.nationality)) +
  geom_line(aes(y = regionals$totals))
  ggtitle("Change in Total Regional Arrivals From 2008-2016") +
  xlab("Year") +
  ylab("Arrivals")

