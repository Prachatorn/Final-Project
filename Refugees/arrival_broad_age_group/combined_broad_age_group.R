# Load in packgenders

library(dplyr)

# Read in the arrival_gender_datasets from 2004 - 2016.
arrival_gender_2004 <- read.csv("arrival_gender_2004.csv", stringsAsFactors = F)
arrival_gender_2005 <- read.csv("arrival_gender_2005.csv", stringsAsFactors = F)
arrival_gender_2006 <- read.csv("arrival_gender_2006.csv", stringsAsFactors = F)
arrival_gender_2007 <- read.csv("arrival_gender_2007.csv", stringsAsFactors = F)
arrival_gender_2008 <- read.csv("arrival_gender_2008.csv", stringsAsFactors = F)
arrival_gender_2009 <- read.csv("arrival_gender_2009.csv", stringsAsFactors = F)
arrival_gender_2010 <- read.csv("arrival_gender_2010.csv", stringsAsFactors = F)
arrival_gender_2011 <- read.csv("arrival_gender_2011.csv", stringsAsFactors = F)
arrival_gender_2012 <- read.csv("arrival_gender_2012.csv", stringsAsFactors = F)
arrival_gender_2013 <- read.csv("arrival_gender_2013.csv", stringsAsFactors = F)
arrival_gender_2014 <- read.csv("arrival_gender_2014.csv", stringsAsFactors = F)
arrival_gender_2015 <- read.csv("arrival_gender_2015.csv", stringsAsFactors = F)
arrival_gender_2016 <- read.csv("arrival_gender_2016.csv", stringsAsFactors = F)


colnames(arrival_gender_2004)[colnames(arrival_gender_2004) == 
                                  "Characteristic"] <- "character"

# Combining the datasets into one datasets.

combined_gender <- arrival_gender_2004 %>%
  left_join(arrival_gender_2005, by = "character") %>%
  left_join(arrival_gender_2006, by = "character") %>%
  left_join(arrival_gender_2007, by = "character") %>%
  left_join(arrival_gender_2008, by = "character") %>%
  left_join(arrival_gender_2009, by = "character") %>%
  left_join(arrival_gender_2010, by = "character") %>%
  left_join(arrival_gender_2011, by = "character") %>%
  left_join(arrival_gender_2012, by = "character") %>%
  left_join(arrival_gender_2013, by = "character") %>%
  left_join(arrival_gender_2014, by = "character") %>%
  left_join(arrival_gender_2015, by = "character") %>%
  left_join(arrival_gender_2016, by = "character")

write.csv(combined_gender, "combined_gender.csv", row.names = F)
