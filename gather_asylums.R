# Load in packages

library(tidyr)

# This manipulates the asylums dataframe to make it easier to use for our
# graphs.

# Read in Country Affirmative Asylum Data

affirmative <- read.csv(
  "Refugees/country_affirmative_asylum.csv",
  stringsAsFactors = FALSE
)

# Make data frame from 2008 - 2016

affirmative <- affirmative %>%
  select(
    Country,
    X2008,
    X2009,
    X2010,
    X2011,
    X2012,
    X2013,
    X2014,
    X2015,
    X2016
  )

# Read in Country Defensive Asylum Data

defensive <- read.csv(
  "Refugees/country_defensive_asylum.csv",
  stringsAsFactors = FALSE
)

# Make data frame of 2008-2016

defensive <- defensive %>%
  select(
    Country,
    X2008,
    X2009,
    X2010,
    X2011,
    X2012,
    X2013,
    X2014,
    X2015,
    X2016
  )

# Replace non numeric values with NA, then

affirmative[affirmative == "-"] <- 0
affirmative[affirmative == "D"] <- 0

defensive[defensive == "-"] <- 0
defensive[defensive == "D"] <- 0

# Create data frame of total and country
total <- affirmative %>%
  filter(
    Country == "Total"
  ) %>%
  select(
    Country,
    X2008,
    X2009,
    X2010,
    X2011,
    X2012,
    X2013,
    X2014,
    X2015,
    X2016
  )

# Put years in a column for affirmative

gather_affirm <-
  gather(
    affirmative,
    key = Year,
    value = Value,
    X2008:X2016
  ) %>%
  mutate(
    Year = stringr::str_replace(Year, "X", "") %>%
      as.numeric()
  )

gather_affirm$Year <- as.character(gather_affirm$Year)

# Years into columns for defensive

gather_defens <-
  gather(
    defensive,
    key = Year,
    value = Value,
    X2008:X2016
  ) %>%
  mutate(
    Year = stringr::str_replace(Year, "X", "") %>% 
    as.numeric()
  )

gather_defens$Year <- as.character(gather_defens$Year)