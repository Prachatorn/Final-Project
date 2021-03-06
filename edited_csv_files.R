# Load in packages

library(dplyr)

# This allows to separate the arrival relationship .csv files into their own
# separate folders depending on either they are arrivaling and seeking asylum
# and the refugees demographic.

arrival_relationships <- read.csv(
  "Refugees/arrival_relationships/arrival_relationships_2016.csv",
  stringsAsFactors = F
)

asylum_relationships <- read.csv(
  "Refugees/asylum_relationships/asylum_relationships_2016.csv",
  stringsAsFactors = F
)

write_arrival_files <- function(arrival, year) {
  arrival_gender <- arrival[1:3, ]
  
  write.csv(
    arrival_gender,
    paste0(
      "Refugees/arrival_gender/arrival_gender_",
      year,
      ".csv"
    ),
    row.names = F
  )
  
  arrival_age <- arrival[-2, ]
  arrival_age <- arrival_age[-2, ]
  arrival_age <- arrival_age[-18:-27, ]
  
  write.csv(
    arrival_age,
    paste0(
      "Refugees/arrival_age/arrival_age_",
      year,
      ".csv"
    ),
    row.names = F
  )
  
  arrival_broad_age_group <- arrival[-2:-19, ]
  arrival_broad_age_group <- arrival_broad_age_group[-5:-9, ]
  
  write.csv(
    arrival_broad_age_group,
    paste0(
      "Refugees/arrival_broad_age_group/arrival_broad_age_group_",
      year,
      ".csv"
    ),
    row.names = F
  )
  
  arrival_marital_status <- arrival[-2:-22, ]
  
  write.csv(
    arrival_marital_status,
    paste0(
      "Refugees/arrival_marital_status/arrival_marital_status_",
      year,
      ".csv"
    ),
    row.names = F
  )
}

write_asylum_files <- function(asylum, year) {
  asylum_gender <- asylum[1:3, ]
  
  write.csv(
    asylum_gender,
    paste0(
      "Refugees/asylum_gender/asylum_gender_",
      year,
      ".csv"
    ),
    row.names = F
  )
  
  asylum_age <- asylum[-2, ]
  asylum_age <- asylum_age[-2, ]
  asylum_age <- asylum_age[-18:-27, ]
  
  write.csv(
    asylum_age,
    paste0(
      "Refugees/asylum_age/asylum_age_",
      year,
      ".csv"
    ),
    row.names = F
  )
  
  asylum_broad_age_group <- asylum[-2:-19, ]
  asylum_broad_age_group <- asylum_broad_age_group[-5:-9, ]
  
  write.csv(
    asylum_broad_age_group,
    paste0(
      "Refugees/asylum_broad_age_group/asylum_broad_age_group_",
      year,
      ".csv"
    ),
    row.names = F
  )
  
  asylum_marital_status <- asylum[-2:-22, ]
  
  write.csv(
    asylum_marital_status,
    paste0(
      "Refugees/asylum_marital_status/asylum_marital_status_",
      year,
      ".csv"
    ), 
    row.names = F
  )
}