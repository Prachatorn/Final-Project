# Load in packmarital_statuss

library(dplyr)

# Read in the arrival_marital_status_datasets from 2004 - 2016.
arrival_marital_status_2004 <- read.csv("arrival_marital_status_2004.csv", stringsAsFactors = F)
arrival_marital_status_2005 <- read.csv("arrival_marital_status_2005.csv", stringsAsFactors = F)
arrival_marital_status_2006 <- read.csv("arrival_marital_status_2006.csv", stringsAsFactors = F)
arrival_marital_status_2007 <- read.csv("arrival_marital_status_2007.csv", stringsAsFactors = F)
arrival_marital_status_2008 <- read.csv("arrival_marital_status_2008.csv", stringsAsFactors = F)
arrival_marital_status_2009 <- read.csv("arrival_marital_status_2009.csv", stringsAsFactors = F)
arrival_marital_status_2010 <- read.csv("arrival_marital_status_2010.csv", stringsAsFactors = F)
arrival_marital_status_2011 <- read.csv("arrival_marital_status_2011.csv", stringsAsFactors = F)
arrival_marital_status_2012 <- read.csv("arrival_marital_status_2012.csv", stringsAsFactors = F)
arrival_marital_status_2013 <- read.csv("arrival_marital_status_2013.csv", stringsAsFactors = F)
arrival_marital_status_2014 <- read.csv("arrival_marital_status_2014.csv", stringsAsFactors = F)
arrival_marital_status_2015 <- read.csv("arrival_marital_status_2015.csv", stringsAsFactors = F)
arrival_marital_status_2016 <- read.csv("arrival_marital_status_2016.csv", stringsAsFactors = F)


colnames(arrival_marital_status_2004)[colnames(arrival_marital_status_2004) == 
                                  "Characteristic"] <- "character"

# Combining the datasets into one datasets.

combined_marital_status <- arrival_marital_status_2004 %>%
  left_join(arrival_marital_status_2005, by = "character") %>%
  left_join(arrival_marital_status_2006, by = "character") %>%
  left_join(arrival_marital_status_2007, by = "character") %>%
  left_join(arrival_marital_status_2008, by = "character") %>%
  left_join(arrival_marital_status_2009, by = "character") %>%
  left_join(arrival_marital_status_2010, by = "character") %>%
  left_join(arrival_marital_status_2011, by = "character") %>%
  left_join(arrival_marital_status_2012, by = "character") %>%
  left_join(arrival_marital_status_2013, by = "character") %>%
  left_join(arrival_marital_status_2014, by = "character") %>%
  left_join(arrival_marital_status_2015, by = "character") %>%
  left_join(arrival_marital_status_2016, by = "character")

write.csv(combined_marital_status, "combined_marital_status.csv", row.names = F)

vars <- list()
vars$years <- c(2004, 2005)
vars$total <- c(combined_age$arrival_total_2014[1], combined_age$arrival_total_2015[1])