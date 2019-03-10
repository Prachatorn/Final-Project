# Arrival Charts

# Libraries used: 

library("dplyr")
library("tidyr")
library("ggplot2")
library("shiny")
library("rsconnect")

# Read the arrival csv file 
arrival_total_data <- read.csv("Refugees/total_arrival.csv", stringsAsFactors = FALSE)
arrival_age_data <- read.csv("Refugees/arrival_age/combined_age.csv",
                             stringsAsFactors = FALSE)
arrival_gender_data <- read.csv("Refugees/arrival_gender/combined_gender.csv",
                                stringsAsFactors = FALSE)
arrival_marital_status <- read.csv("Refugees/arrival_marital_status/combined_marital_status.csv",
                                   stringsAsFactors = FALSE)
# y_range <- range(arrival_total_data$Number)
# 
# ty <- arrival_age_data %>% 
#   mutate(ages = character) %>% 
#   select(ages) %>% 
#   filter(Total)
# 
# y <- ty$ages
# 
# ye <- mutate(yu = as.numeric(ty$ages))

################################ CHART ONE TOTAL ARRIVALS FROM 1980 TO 2016######################
total_data <- arrival_total_data %>%
  # arrange(desc(Year)) %>%
  # mutate(year_of_arrivals = as.numeric(Year)) %>%
  # select(Year, Number) %>%
  mutate(num_totals = as.numeric(gsub(",", "", Number))) %>%
  select(Year, num_totals)

chart_one <- ggplot(data = total_data) +
   geom_col(
     mapping = aes(x = Year, y = num_totals, fill = "Year"
     )
   ) +
   scale_color_brewer(palette = "Set1") +
   labs(y = "Number of Refugee Arrivals in the United States",
        title = "Total Number of Refugee Arrivals in the United States per Year") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1))

 chart_one #
 
############################################# CHART TWO ARRIVAL AGES CHART#######################
 creates_dataframe <- function(name_of_dataset){
 
   changed_data <- name_of_dataset %>%
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
 }
   chart_two <- ggplot(data = changed_data) +
   geom_col(
     mapping = aes(y = character, x = year_2008, fill = year_2008)
   ) +
     theme(axis.text.x = element_text(angle = 60, hjust = 1)) + 
     geom_point(
       mapping = aes(y = character, x = year_2008, color = year_2008))
   
   chart_two
####Need to rearrange the order of the y-axis!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


   # arrival_age_two <- arrival_age_data %>%
   #   select(number_totals, character, arrival_total_2008, arrival_total_2009, arrival_total_2009,
   #          arrival_applicants_2010, arrival_total_2011,
   #          arrival_total_2012, arrival_total_2013,
   #          arrival_total_2014, arrival_total_2015, arrival_total_2016) %>%
   #   gather(key = year, value = value, arrival_total_2008:arrival_total_2016) 
     
############################################# CHART THREE ARRIVAL GENDER CHART#######################
   
   # new <- arrival_age_two %>% 
   #   mutate(total_num = as.numeric(gsub(",", "", value)))
   # y_axis <- as.numeric(gsub(",", "",as.matrix(arrival_age_two$value)))


   # arrival_age_t <- arrival_age_two %>% 
   #   # filter(Total == Total) %>% 
   #   select(arrival_total_2008)
   # # chart_three <- ggplot(data = arrival_age_two) +
   # #   geom_col(
   # #     mapping = aes(x = character, y = arrival_total_2008)
   # #   ) + coord_flip()


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

   chart_three <- ggplot(data = arrival_f_m) +
     geom_col( 
       mapping = aes(x = character , y = arrival_total_2009, fill = character)
     ) +
     theme(axis.text.x = element_text(angle = 60, hjust = 1)) + coord_flip()
   
   chart_three
############################################# CHART FOUR ARRIVAL Arrival Marital CHART#######################
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
   
   chart_four <- ggplot(data = marital_status_data) +
     geom_col(
     mapping = aes(x = character , y = year_2008, fill = character)
   ) +
     theme(axis.text.x = element_text(angle = 60, hjust = 1)) + coord_flip()
   