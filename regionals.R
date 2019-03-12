library(dplyr)
library(data.table)


regional_arrivals <- read.csv("Refugees/regional_arrivals.csv", 
                              stringsAsFactors = F)
setnames(regional_arrivals, old=c("X2007","X2008", "X2009", "X2010", "X2011", 
                                  "X2012", "X2013", "X2014", "X2015", "X2016"),
         new=c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014",
               "2015", "2016"))
regional_arrivals[,-1] <- suppressWarnings(as.numeric(gsub(",", "", 
                                                           as.matrix(
                                                             regional_arrivals[,-1]))))
regional_arrivals[is.na(regional_arrivals)] <- 0

newdata <- list()
newdata$years <- c(2008:2016)
newdata$africa <- c(regional_arrivals$`2008`[2],
                    regional_arrivals$`2009`[2],regional_arrivals$`2010`[2], 
                    regional_arrivals$`2011`[2], regional_arrivals$`2012`[2],
                    regional_arrivals$`2013`[2], regional_arrivals$`2014`[2],
                    regional_arrivals$`2015`[2], regional_arrivals$`2016`[2])
newdata$asia <- c(regional_arrivals$`2008`[3],
                  regional_arrivals$`2009`[3],regional_arrivals$`2010`[3], 
                  regional_arrivals$`2011`[3], regional_arrivals$`2012`[3],
                  regional_arrivals$`2013`[3], regional_arrivals$`2014`[3],
                  regional_arrivals$`2015`[3], regional_arrivals$`2016`[3])

newdata$europe <- c(regional_arrivals$`2008`[4],
                    regional_arrivals$`2009`[4],regional_arrivals$`2010`[4], 
                    regional_arrivals$`2011`[4], regional_arrivals$`2012`[4],
                    regional_arrivals$`2013`[4], regional_arrivals$`2014`[4],
                    regional_arrivals$`2015`[4], regional_arrivals$`2016`[4])

newdata$north_america <- c(regional_arrivals$`2008`[5],
                           regional_arrivals$`2009`[5],regional_arrivals$`2010`[5], 
                           regional_arrivals$`2011`[5], regional_arrivals$`2012`[5],
                           regional_arrivals$`2013`[5], regional_arrivals$`2014`[5],
                           regional_arrivals$`2015`[5], regional_arrivals$`2016`[5])

newdata$oceania <- c(regional_arrivals$`2008`[6],
                     regional_arrivals$`2009`[6],regional_arrivals$`2010`[6], 
                     regional_arrivals$`2011`[6], regional_arrivals$`2012`[6],
                     regional_arrivals$`2013`[6], regional_arrivals$`2014`[6],
                     regional_arrivals$`2015`[6], regional_arrivals$`2016`[6])

newdata$south_america <- c(regional_arrivals$`2008`[7],
                           regional_arrivals$`2009`[7],regional_arrivals$`2010`[7], 
                           regional_arrivals$`2011`[7], regional_arrivals$`2012`[7],
                           regional_arrivals$`2013`[7], regional_arrivals$`2014`[7],
                           regional_arrivals$`2015`[7], regional_arrivals$`2016`[7])

newdata$unknown <- c(regional_arrivals$`2008`[8],
                     regional_arrivals$`2009`[8],regional_arrivals$`2010`[8], 
                     regional_arrivals$`2011`[8], regional_arrivals$`2012`[8],
                     regional_arrivals$`2013`[8], regional_arrivals$`2014`[8],
                     regional_arrivals$`2015`[8], regional_arrivals$`2016`[8])

regionals <- data.frame(newdata)
