library(ggplot2)
library(dplyr)
library(tidyr)
library(shiny)
library(rsconnect)
library(data.table)
library(plotly)
#Show the caps & spots filled charts
#Show how immigration has changed over time

# Refugee caps
caps <- data.frame("Year" = c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 
                              2016), "Cap" = c(80000, 80000, 80000, 80000, 76000,
                                               70000, 70000, 70000, 85000), 
                   "Admitted" = c(60107, 74602, 73293, 56384, 58179, 69909, 
                                  69975, 69920, 84989))

   
# Regions 
regional_arrivals <- read.csv("Refugees/regional_arrivals.csv",
                              stringsAsFactors = F)
regional_arrivals <- regional_arrivals %>%
  rename("2007" = X2007, "2008" = X2008, "2009" = X2009, "2010" = X2010,
         "2011" = X2011, "2012" = X2012, "2013" = X2013, "2014" = X2014,
         "2015" = X2015, "2016" = X2016)

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

# Countries
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

countries <- list()
countries$year <- c(2008:2016)
countries$Afghanistan <- c(country_arrivals$`2008`[2],
                           country_arrivals$`2009`[2], country_arrivals$`2010`[2],
                           country_arrivals$`2011`[2], country_arrivals$`2012`[2],
                           country_arrivals$`2013`[2], country_arrivals$`2014`[2],
                           country_arrivals$`2015`[2], country_arrivals$`2016`[2])
countries$Armenia <- c(country_arrivals$`2008`[3],
                       country_arrivals$`2009`[3], country_arrivals$`2010`[3],
                       country_arrivals$`2011`[3], country_arrivals$`2012`[3],
                       country_arrivals$`2013`[3], country_arrivals$`2014`[3],
                       country_arrivals$`2015`[3], country_arrivals$`2016`[3])
countries$Azerbaijan <- c(country_arrivals$`2008`[4],
                          country_arrivals$`2009`[4], country_arrivals$`2010`[4],
                          country_arrivals$`2011`[4], country_arrivals$`2012`[4],
                          country_arrivals$`2013`[4], country_arrivals$`2014`[4],
                          country_arrivals$`2015`[4], country_arrivals$`2016`[4])
countries$Belarus <- c(country_arrivals$`2008`[5],
                       country_arrivals$`2009`[5], country_arrivals$`2010`[5],
                       country_arrivals$`2011`[5], country_arrivals$`2012`[5],
                       country_arrivals$`2013`[5], country_arrivals$`2014`[5],
                       country_arrivals$`2015`[5], country_arrivals$`2016`[5])
countries$Bhutan <- c(country_arrivals$`2008`[6],
                      country_arrivals$`2009`[6], country_arrivals$`2010`[6],
                      country_arrivals$`2011`[6], country_arrivals$`2012`[6],
                      country_arrivals$`2013`[6], country_arrivals$`2014`[6],
                      country_arrivals$`2015`[6], country_arrivals$`2016`[6])
countries$Burma <- c(country_arrivals$`2008`[7],
                     country_arrivals$`2009`[7], country_arrivals$`2010`[7],
                     country_arrivals$`2011`[7], country_arrivals$`2012`[7],
                     country_arrivals$`2013`[7], country_arrivals$`2014`[7],
                     country_arrivals$`2015`[7], country_arrivals$`2016`[7])
countries$Burundi <- c(country_arrivals$`2008`[8],
                       country_arrivals$`2009`[8], country_arrivals$`2010`[8],
                       country_arrivals$`2011`[8], country_arrivals$`2012`[8],
                       country_arrivals$`2013`[8], country_arrivals$`2014`[8],
                       country_arrivals$`2015`[8], country_arrivals$`2016`[8])
countries$Cambodia <- c(country_arrivals$`2008`[9],
                        country_arrivals$`2009`[9], country_arrivals$`2010`[9],
                        country_arrivals$`2011`[9], country_arrivals$`2012`[9],
                        country_arrivals$`2013`[9], country_arrivals$`2014`[9],
                        country_arrivals$`2015`[9], country_arrivals$`2016`[9])
countries$Cameroon <- c(country_arrivals$`2008`[10],
                        country_arrivals$`2009`[10], country_arrivals$`2010`[10],
                        country_arrivals$`2011`[10], country_arrivals$`2012`[10],
                        country_arrivals$`2013`[10], country_arrivals$`2014`[10],
                        country_arrivals$`2015`[10], country_arrivals$`2016`[10])
countries$Central_African_Republic <- c(country_arrivals$`2008`[11],
                                        country_arrivals$`2009`[11], country_arrivals$`2010`[11],
                                        country_arrivals$`2011`[11], country_arrivals$`2012`[11],
                                        country_arrivals$`2013`[11], country_arrivals$`2014`[11],
                                        country_arrivals$`2015`[11], country_arrivals$`2016`[11])
countries$Chad <- c(country_arrivals$`2008`[12],
                    country_arrivals$`2009`[12], country_arrivals$`2010`[12],
                    country_arrivals$`2011`[12], country_arrivals$`2012`[12],
                    country_arrivals$`2013`[12], country_arrivals$`2014`[12],
                    country_arrivals$`2015`[12], country_arrivals$`2016`[12])
countries$China <- c(country_arrivals$`2008`[13],
                     country_arrivals$`2009`[13], country_arrivals$`2010`[13],
                     country_arrivals$`2011`[13], country_arrivals$`2012`[13],
                     country_arrivals$`2013`[13], country_arrivals$`2014`[13],
                     country_arrivals$`2015`[13], country_arrivals$`2016`[13]) 
countries$Colombia <- c(country_arrivals$`2008`[14],
                        country_arrivals$`2009`[14], country_arrivals$`2010`[14],
                        country_arrivals$`2011`[14], country_arrivals$`2012`[14],
                        country_arrivals$`2013`[14], country_arrivals$`2014`[14],
                        country_arrivals$`2015`[14], country_arrivals$`2016`[14])
countries$Democratic_Republic_of_Congo <- c(country_arrivals$`2008`[15],
                                            country_arrivals$`2009`[15], country_arrivals$`2010`[15],
                                            country_arrivals$`2011`[15], country_arrivals$`2012`[15],
                                            country_arrivals$`2013`[15], country_arrivals$`2014`[15],
                                            country_arrivals$`2015`[15], country_arrivals$`2016`[15])
countries$Republic_of_Congo <- c(country_arrivals$`2008`[16],
                                 country_arrivals$`2009`[16], country_arrivals$`2010`[16],
                                 country_arrivals$`2011`[16], country_arrivals$`2012`[16],
                                 country_arrivals$`2013`[16], country_arrivals$`2014`[16],
                                 country_arrivals$`2015`[16], country_arrivals$`2016`[16]) 
countries$Cote_d_Ivoire <- c(country_arrivals$`2008`[17],
                             country_arrivals$`2009`[17], country_arrivals$`2010`[17],
                             country_arrivals$`2011`[17], country_arrivals$`2012`[17],
                             country_arrivals$`2013`[17], country_arrivals$`2014`[17],
                             country_arrivals$`2015`[17], country_arrivals$`2016`[17]) 
countries$Cuba <- c(country_arrivals$`2008`[18],
                    country_arrivals$`2009`[18], country_arrivals$`2010`[18],
                    country_arrivals$`2011`[18], country_arrivals$`2012`[18],
                    country_arrivals$`2013`[18], country_arrivals$`2014`[18],
                    country_arrivals$`2015`[18], country_arrivals$`2016`[18]) 
countries$Egypt <- c(country_arrivals$`2008`[19],
                     country_arrivals$`2009`[19], country_arrivals$`2010`[19],
                     country_arrivals$`2011`[19], country_arrivals$`2012`[19],
                     country_arrivals$`2013`[19], country_arrivals$`2014`[19],
                     country_arrivals$`2015`[19], country_arrivals$`2016`[19])
countries$El_Salvador <- c(country_arrivals$`2008`[20],
                           country_arrivals$`2009`[20], country_arrivals$`2010`[20],
                           country_arrivals$`2011`[20], country_arrivals$`2012`[20],
                           country_arrivals$`2013`[20], country_arrivals$`2014`[20],
                           country_arrivals$`2015`[20], country_arrivals$`2016`[20]) 
countries$Equatorial_Guinea <- c(country_arrivals$`2008`[21],
                                 country_arrivals$`2009`[21], country_arrivals$`2010`[21],
                                 country_arrivals$`2011`[21], country_arrivals$`2012`[21],
                                 country_arrivals$`2013`[21], country_arrivals$`2014`[21],
                                 country_arrivals$`2015`[21], country_arrivals$`2016`[21]) 
countries$Eritrea <- c(country_arrivals$`2008`[22],
                       country_arrivals$`2009`[22], country_arrivals$`2010`[22],
                       country_arrivals$`2011`[22], country_arrivals$`2012`[22],
                       country_arrivals$`2013`[22], country_arrivals$`2014`[22],
                       country_arrivals$`2015`[22], country_arrivals$`2016`[22]) 
countries$Ethiopea <- c(country_arrivals$`2008`[23],
                        country_arrivals$`2009`[23], country_arrivals$`2010`[23],
                        country_arrivals$`2011`[23], country_arrivals$`2012`[23],
                        country_arrivals$`2013`[23], country_arrivals$`2014`[23],
                        country_arrivals$`2015`[23], country_arrivals$`2016`[23]) 
countries$Gambia <- c(country_arrivals$`2008`[24],
                      country_arrivals$`2009`[24], country_arrivals$`2010`[24],
                      country_arrivals$`2011`[24], country_arrivals$`2012`[24],
                      country_arrivals$`2013`[24], country_arrivals$`2014`[24],
                      country_arrivals$`2015`[24], country_arrivals$`2016`[24]) 
countries$Georgia <- c(country_arrivals$`2008`[25],
                       country_arrivals$`2009`[25], country_arrivals$`2010`[25],
                       country_arrivals$`2011`[25], country_arrivals$`2012`[25],
                       country_arrivals$`2013`[25], country_arrivals$`2014`[25],
                       country_arrivals$`2015`[25], country_arrivals$`2016`[25]) 
countries$Haiti <- c(country_arrivals$`2008`[26],
                     country_arrivals$`2009`[26], country_arrivals$`2010`[26],
                     country_arrivals$`2011`[26], country_arrivals$`2012`[26],
                     country_arrivals$`2013`[26], country_arrivals$`2014`[26],
                     country_arrivals$`2015`[26], country_arrivals$`2016`[26]) 
countries$Honduras <- c(country_arrivals$`2008`[27],
                        country_arrivals$`2009`[27], country_arrivals$`2010`[27],
                        country_arrivals$`2011`[27], country_arrivals$`2012`[27],
                        country_arrivals$`2013`[27], country_arrivals$`2014`[27],
                        country_arrivals$`2015`[27], country_arrivals$`2016`[27]) 
countries$Iran <- c(country_arrivals$`2008`[28],
                    country_arrivals$`2009`[28], country_arrivals$`2010`[28],
                    country_arrivals$`2011`[28], country_arrivals$`2012`[28],
                    country_arrivals$`2013`[28], country_arrivals$`2014`[28],
                    country_arrivals$`2015`[28], country_arrivals$`2016`[28]) 
countries$Iraq <- c(country_arrivals$`2008`[29],
                    country_arrivals$`2009`[29], country_arrivals$`2010`[29],
                    country_arrivals$`2011`[29], country_arrivals$`2012`[29],
                    country_arrivals$`2013`[29], country_arrivals$`2014`[29],
                    country_arrivals$`2015`[29], country_arrivals$`2016`[29]) 
countries$Jordan <- c(country_arrivals$`2008`[30],
                      country_arrivals$`2009`[30], country_arrivals$`2010`[30],
                      country_arrivals$`2011`[30], country_arrivals$`2012`[30],
                      country_arrivals$`2013`[30], country_arrivals$`2014`[30],
                      country_arrivals$`2015`[30], country_arrivals$`2016`[30])  
countries$Kazakhstan <- c(country_arrivals$`2008`[31],
                          country_arrivals$`2009`[31], country_arrivals$`2010`[31],
                          country_arrivals$`2011`[31], country_arrivals$`2012`[31],
                          country_arrivals$`2013`[31], country_arrivals$`2014`[31],
                          country_arrivals$`2015`[31], country_arrivals$`2016`[31])  
countries$Kenya <- c(country_arrivals$`2008`[32],
                     country_arrivals$`2009`[32], country_arrivals$`2010`[32],
                     country_arrivals$`2011`[32], country_arrivals$`2012`[32],
                     country_arrivals$`2013`[32], country_arrivals$`2014`[32],
                     country_arrivals$`2015`[32], country_arrivals$`2016`[32])  
countries$North_Korea <- c(country_arrivals$`2008`[33],
                           country_arrivals$`2009`[33], country_arrivals$`2010`[33],
                           country_arrivals$`2011`[33], country_arrivals$`2012`[33],
                           country_arrivals$`2013`[33], country_arrivals$`2014`[33],
                           country_arrivals$`2015`[33], country_arrivals$`2016`[33])  
countries$Kuwait <- c(country_arrivals$`2008`[34],
                      country_arrivals$`2009`[34], country_arrivals$`2010`[34],
                      country_arrivals$`2011`[34], country_arrivals$`2012`[34],
                      country_arrivals$`2013`[34], country_arrivals$`2014`[34],
                      country_arrivals$`2015`[34], country_arrivals$`2016`[34])  
countries$Kyrgyzstan <- c(country_arrivals$`2008`[35],
                          country_arrivals$`2009`[35], country_arrivals$`2010`[35],
                          country_arrivals$`2011`[35], country_arrivals$`2012`[35],
                          country_arrivals$`2013`[35], country_arrivals$`2014`[35],
                          country_arrivals$`2015`[35], country_arrivals$`2016`[35])  
countries$Laos <- c(country_arrivals$`2008`[36],
                    country_arrivals$`2009`[36], country_arrivals$`2010`[36],
                    country_arrivals$`2011`[36], country_arrivals$`2012`[36],
                    country_arrivals$`2013`[36], country_arrivals$`2014`[36],
                    country_arrivals$`2015`[36], country_arrivals$`2016`[36])  
countries$Latvia <- c(country_arrivals$`2008`[37],
                      country_arrivals$`2009`[37], country_arrivals$`2010`[37],
                      country_arrivals$`2011`[37], country_arrivals$`2012`[37],
                      country_arrivals$`2013`[37], country_arrivals$`2014`[37],
                      country_arrivals$`2015`[37], country_arrivals$`2016`[37])  
countries$Liberia <- c(country_arrivals$`2008`[38],
                       country_arrivals$`2009`[38], country_arrivals$`2010`[38],
                       country_arrivals$`2011`[38], country_arrivals$`2012`[38],
                       country_arrivals$`2013`[38], country_arrivals$`2014`[38],
                       country_arrivals$`2015`[38], country_arrivals$`2016`[38])  
countries$Mauritania <- c(country_arrivals$`2008`[39],
                          country_arrivals$`2009`[39], country_arrivals$`2010`[39],
                          country_arrivals$`2011`[39], country_arrivals$`2012`[39],
                          country_arrivals$`2013`[39], country_arrivals$`2014`[39],
                          country_arrivals$`2015`[39], country_arrivals$`2016`[39])  
countries$Moldova <- c(country_arrivals$`2008`[40],
                       country_arrivals$`2009`[40], country_arrivals$`2010`[40],
                       country_arrivals$`2011`[40], country_arrivals$`2012`[40],
                       country_arrivals$`2013`[40], country_arrivals$`2014`[40],
                       country_arrivals$`2015`[40], country_arrivals$`2016`[40])  
countries$Nepal < c(country_arrivals$`2008`[41],
                    country_arrivals$`2009`[41], country_arrivals$`2010`[41],
                    country_arrivals$`2011`[41], country_arrivals$`2012`[41],
                    country_arrivals$`2013`[41], country_arrivals$`2014`[41],
                    country_arrivals$`2015`[41], country_arrivals$`2016`[41])  
countries$Nigeria <- c(country_arrivals$`2008`[42],
                       country_arrivals$`2009`[42], country_arrivals$`2010`[42],
                       country_arrivals$`2011`[42], country_arrivals$`2012`[42],
                       country_arrivals$`2013`[42], country_arrivals$`2014`[42],
                       country_arrivals$`2015`[42], country_arrivals$`2016`[42])  
countries$Pakistan <- c(country_arrivals$`2008`[43],
                        country_arrivals$`2009`[43], country_arrivals$`2010`[43],
                        country_arrivals$`2011`[43], country_arrivals$`2012`[43],
                        country_arrivals$`2013`[43], country_arrivals$`2014`[43],
                        country_arrivals$`2015`[43], country_arrivals$`2016`[43])  
countries$Russia <- c(country_arrivals$`2008`[44],
                      country_arrivals$`2009`[44], country_arrivals$`2010`[44],
                      country_arrivals$`2011`[44], country_arrivals$`2012`[44],
                      country_arrivals$`2013`[44], country_arrivals$`2014`[44],
                      country_arrivals$`2015`[44], country_arrivals$`2016`[44])  
countries$Rwanda <- c(country_arrivals$`2008`[45],
                      country_arrivals$`2009`[45], country_arrivals$`2010`[45],
                      country_arrivals$`2011`[45], country_arrivals$`2012`[45],
                      country_arrivals$`2013`[45], country_arrivals$`2014`[45],
                      country_arrivals$`2015`[45], country_arrivals$`2016`[45])  
countries$Senegal <- c(country_arrivals$`2008`[46],
                       country_arrivals$`2009`[46], country_arrivals$`2010`[46],
                       country_arrivals$`2011`[46], country_arrivals$`2012`[46],
                       country_arrivals$`2013`[46], country_arrivals$`2014`[46],
                       country_arrivals$`2015`[46], country_arrivals$`2016`[46])  
countries$Sierra_Leone <- c(country_arrivals$`2008`[47],
                            country_arrivals$`2009`[47], country_arrivals$`2010`[47],
                            country_arrivals$`2011`[47], country_arrivals$`2012`[47],
                            country_arrivals$`2013`[47], country_arrivals$`2014`[47],
                            country_arrivals$`2015`[47], country_arrivals$`2016`[47])  
countries$Somalia <- c(country_arrivals$`2008`[48],
                       country_arrivals$`2009`[48], country_arrivals$`2010`[48],
                       country_arrivals$`2011`[48], country_arrivals$`2012`[48],
                       country_arrivals$`2013`[48], country_arrivals$`2014`[48],
                       country_arrivals$`2015`[48], country_arrivals$`2016`[48])  
countries$South_Sudan <- c(country_arrivals$`2008`[49],
                           country_arrivals$`2009`[49], country_arrivals$`2010`[49],
                           country_arrivals$`2011`[49], country_arrivals$`2012`[49],
                           country_arrivals$`2013`[49], country_arrivals$`2014`[49],
                           country_arrivals$`2015`[49], country_arrivals$`2016`[49])  
countries$Sri_Lanka <- c(country_arrivals$`2008`[50],
                         country_arrivals$`2009`[50], country_arrivals$`2010`[50],
                         country_arrivals$`2011`[50], country_arrivals$`2012`[50],
                         country_arrivals$`2013`[50], country_arrivals$`2014`[50],
                         country_arrivals$`2015`[50], country_arrivals$`2016`[50])  
countries$Sudan <- c(country_arrivals$`2008`[51],
                     country_arrivals$`2009`[51], country_arrivals$`2010`[51],
                     country_arrivals$`2011`[51], country_arrivals$`2012`[51],
                     country_arrivals$`2013`[51], country_arrivals$`2014`[51],
                     country_arrivals$`2015`[51], country_arrivals$`2016`[51])  
countries$Syria <- c(country_arrivals$`2008`[52],
                     country_arrivals$`2009`[52], country_arrivals$`2010`[52],
                     country_arrivals$`2011`[52], country_arrivals$`2012`[52],
                     country_arrivals$`2013`[52], country_arrivals$`2014`[52],
                     country_arrivals$`2015`[52], country_arrivals$`2016`[52])  
countries$Tajikistan <- c(country_arrivals$`2008`[53],
                          country_arrivals$`2009`[53], country_arrivals$`2010`[53],
                          country_arrivals$`2011`[53], country_arrivals$`2012`[53],
                          country_arrivals$`2013`[53], country_arrivals$`2014`[53],
                          country_arrivals$`2015`[53], country_arrivals$`2016`[53])  
countries$Togo <- c(country_arrivals$`2008`[54],
                    country_arrivals$`2009`[54], country_arrivals$`2010`[54],
                    country_arrivals$`2011`[54], country_arrivals$`2012`[54],
                    country_arrivals$`2013`[54], country_arrivals$`2014`[54],
                    country_arrivals$`2015`[54], country_arrivals$`2016`[54])  
countries$Uganda <- c(country_arrivals$`2008`[55],
                      country_arrivals$`2009`[55], country_arrivals$`2010`[55],
                      country_arrivals$`2011`[55], country_arrivals$`2012`[55],
                      country_arrivals$`2013`[55], country_arrivals$`2014`[55],
                      country_arrivals$`2015`[55], country_arrivals$`2016`[55])  
countries$Ukraine <- c(country_arrivals$`2008`[56],
                       country_arrivals$`2009`[56], country_arrivals$`2010`[56],
                       country_arrivals$`2011`[56], country_arrivals$`2012`[56],
                       country_arrivals$`2013`[56], country_arrivals$`2014`[56],
                       country_arrivals$`2015`[56], country_arrivals$`2016`[56])  
countries$Uzbekistan <- c(country_arrivals$`2008`[57],
                          country_arrivals$`2009`[57], country_arrivals$`2010`[57],
                          country_arrivals$`2011`[57], country_arrivals$`2012`[57],
                          country_arrivals$`2013`[57], country_arrivals$`2014`[57],
                          country_arrivals$`2015`[57], country_arrivals$`2016`[57])  
countries$Vietnam <- c(country_arrivals$`2008`[58],
                       country_arrivals$`2009`[58], country_arrivals$`2010`[58],
                       country_arrivals$`2011`[58], country_arrivals$`2012`[58],
                       country_arrivals$`2013`[58], country_arrivals$`2014`[58],
                       country_arrivals$`2015`[58], country_arrivals$`2016`[58])  
countries$Yemen <- c(country_arrivals$`2008`[59],
                     country_arrivals$`2009`[59], country_arrivals$`2010`[59],
                     country_arrivals$`2011`[59], country_arrivals$`2012`[59],
                     country_arrivals$`2013`[59], country_arrivals$`2014`[59],
                     country_arrivals$`2015`[59], country_arrivals$`2016`[59])  
countries$Zimbabwe <- c(country_arrivals$`2008`[60],
                        country_arrivals$`2009`[60], country_arrivals$`2010`[60],
                        country_arrivals$`2011`[60], country_arrivals$`2012`[60],
                        country_arrivals$`2013`[60], country_arrivals$`2014`[60],
                        country_arrivals$`2015`[60], country_arrivals$`2016`[60])  
countries$All_Others <- c(country_arrivals$`2008`[61],
                          country_arrivals$`2009`[61], country_arrivals$`2010`[61],
                          country_arrivals$`2011`[61], country_arrivals$`2012`[61],
                          country_arrivals$`2013`[61], country_arrivals$`2014`[61],
                          country_arrivals$`2015`[61], country_arrivals$`2016`[61])  
countries$Unknown <- c(country_arrivals$`2008`[62],
                       country_arrivals$`2009`[62], country_arrivals$`2010`[62],
                       country_arrivals$`2011`[62], country_arrivals$`2012`[62],
                       country_arrivals$`2013`[62], country_arrivals$`2014`[62],
                       country_arrivals$`2015`[62], country_arrivals$`2016`[62])  
countries <- data.frame(countries)

#Plots
server <- function(input, output) {
  output$region_time <- renderPlotly({
    region_plot <- ggplot(regionals,
                          aes_string(
                            x = "years",
                            y = input$area
                          )
    ) + geom_line(color = "orange") +
      ggtitle("Change in Total Regional Arrivals by Region From 2008-2016") +
      xlab("Year") +
      ylab("Arrivals")
    
    region_plot2 <- ggplotly(region_plot)
    region_plot2
  })
  
  output$country_time <- renderPlotly({
    country_plot <- ggplot(countries,
                           aes_string(
                             x = "year",
                             y = input$country
                           )
    ) + geom_line(color = "purple") +
      ggtitle("Change in Total Arrivals by Country From 2008-2016") +
      xlab("Year") +
      ylab("Arrivals")
    
    country_plot2 <- ggplotly(country_plot)
    country_plot2
  })
  
  output$ceilings <- renderPlot({
    ggplot(caps, aes(x = Year)) +
      geom_line(aes(y= Cap, colour= "Cap")) +
      geom_line(aes(y= Admitted, colour= "Admitted")) +
      geom_point(aes (y = Cap)) +
      geom_point(aes (y = Admitted)) +
      scale_y_continuous("Total Numbers of People",
                         breaks= seq(56000, 86000, 2000)) +
      ggtitle("Refugee Admissions Ceiling vs Total Refugee Admissions") +
      scale_color_manual(name = "Total Numbers", values= c("Cap" = "red",
                                                           "Admitted" = "green"),
                         labels = c("Admitted", "Ceiling Cap"))
    
  })

#UI

  julianne_general_stats <- tabPanel(
    "Changes Over the Obama Era",
    
  sidebarLayout(
      sidebarPanel(
        helpText("The ceiling cap for refugee admittance has changed drastically in
               the last few years. The graph to the left displays more information 
               about the amount of people given refugee status in the United States
               versus the the amount of possible spots during the Obama Administration.")
      ),
      mainPanel(
        plotOutput("ceilings"),
        p("As seen above, the ceiling has changed over time. It stayed steady for
the first few years of Obama's presidency, but later dipped by a few thousand. 
The ceiling was set to its highest over the eight years during the last year of 
        Obama's administration. It seems that at the peak of the Syrian, and
        consequentially the world, refugee crisis in 2015 the administration began
        admitting more people with refugee status.")
      )
  ),
    sidebarLayout(
      sidebarPanel(
        helpText("Choose a country to see how arrivals from that area 
                 changed over the Obama administration"),
        selectInput(
          "country", 
          label = "Country", 
          choices = colnames(countries[,-1]), 
          selected = "Afghanistan"
        )
        ),
        mainPanel(
          plotlyOutput("country_time"),
          p("This plot provides information about the total arrivals of a selected
     country during the Obama administration.")
        )
        
    ),
    sidebarLayout(
      sidebarPanel(
        helpText("Choose a region to see how arrivals from that area changed 
                 over the Obama administration"),
        selectInput("area", 
          label = "Region", 
          choices = c("Africa" = "africa", "Asia" = "asia", "Europe" = "europe",
                "North America" = "north_america", "Oceania" =  "oceania", 
                "South America" = "south_america", "Unknown" = "unknown"),
          selected = "Asia"
        )
      ),
    mainPanel(
      plotlyOutput("region_time"),
      p("This plot displays the change in total arrivals over time of the
         selected region. The time frame is from 2008 to 2016, which marks the 
                 election of President Obama and the end of his two terms. Based 
        on this plot, we discovered that Africa had an exponential increase
        in the amount of refugees arriving in the United States in the last few
        years of Obama's term.")
      )
    
  )
)
