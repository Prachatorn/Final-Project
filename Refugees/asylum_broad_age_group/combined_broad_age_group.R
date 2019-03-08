# Load in packbroad_age_groups

library(dplyr)

# Read in the asylum_broad_age_group_datasets from 2004 - 2016.
asylum_broad_age_group_2004 <- read.csv("asylum_broad_age_group_2004.csv", stringsAsFactors = F)
asylum_broad_age_group_2005 <- read.csv("asylum_broad_age_group_2005.csv", stringsAsFactors = F)
asylum_broad_age_group_2006 <- read.csv("asylum_broad_age_group_2006.csv", stringsAsFactors = F)
asylum_broad_age_group_2007 <- read.csv("asylum_broad_age_group_2007.csv", stringsAsFactors = F)
asylum_broad_age_group_2008 <- read.csv("asylum_broad_age_group_2008.csv", stringsAsFactors = F)
asylum_broad_age_group_2009 <- read.csv("asylum_broad_age_group_2009.csv", stringsAsFactors = F)
asylum_broad_age_group_2010 <- read.csv("asylum_broad_age_group_2010.csv", stringsAsFactors = F)
asylum_broad_age_group_2011 <- read.csv("asylum_broad_age_group_2011.csv", stringsAsFactors = F)
asylum_broad_age_group_2012 <- read.csv("asylum_broad_age_group_2012.csv", stringsAsFactors = F)
asylum_broad_age_group_2013 <- read.csv("asylum_broad_age_group_2013.csv", stringsAsFactors = F)
asylum_broad_age_group_2014 <- read.csv("asylum_broad_age_group_2014.csv", stringsAsFactors = F)
asylum_broad_age_group_2015 <- read.csv("asylum_broad_age_group_2015.csv", stringsAsFactors = F)
asylum_broad_age_group_2016 <- read.csv("asylum_broad_age_group_2016.csv", stringsAsFactors = F)


colnames(asylum_broad_age_group_2004)[colnames(asylum_broad_age_group_2004) == 
                                  "Characteristic"] <- "character"

# Combining the datasets into one datasets.

combined_broad_age_group <- asylum_broad_age_group_2004 %>%
  left_join(asylum_broad_age_group_2005, by = "character") %>%
  left_join(asylum_broad_age_group_2006, by = "character") %>%
  left_join(asylum_broad_age_group_2007, by = "character") %>%
  left_join(asylum_broad_age_group_2008, by = "character") %>%
  left_join(asylum_broad_age_group_2009, by = "character") %>%
  left_join(asylum_broad_age_group_2010, by = "character") %>%
  left_join(asylum_broad_age_group_2011, by = "character") %>%
  left_join(asylum_broad_age_group_2012, by = "character") %>%
  left_join(asylum_broad_age_group_2013, by = "character") %>%
  left_join(asylum_broad_age_group_2014, by = "character") %>%
  left_join(asylum_broad_age_group_2015, by = "character") %>%
  left_join(asylum_broad_age_group_2016, by = "character")

write.csv(combined_broad_age_group, "combined_broad_age_group.csv", row.names = F)
