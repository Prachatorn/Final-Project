library(dplyr)
library(ggplot2)

arrival_relationships <- read.csv("Refugees/arrival_relationships_2009.csv",
                                  stringsAsFactors = F)
asylum_relationships <- read.csv("Refugees/asylum_relationships_2009.csv",
                                 stringsAsFactors = F)

# colnames(data)[colnames(data)=="old_name"] <- "new_name"
colnames(arrival_relationships)[colnames(arrival_relationships) == 
                                  "ï..Characteristic"] <- "character"
colnames(asylum_relationships)[colnames(asylum_relationships) == 
                                 "ï..Characteristic"] <- "character"

write_arrival_files <- function(arrival, year) {
  arrival_gender <- arrival[1:3,]
  write.csv(arrival_gender, paste0("Refugees/arrival_gender/arrival_gender_", year, ".csv"),
            row.names = F)
  arrival_age <- arrival[-2, ]
  arrival_age <- arrival_age[-2, ]
  arrival_age <- arrival_age[-18:-27, ]
  write.csv(arrival_age, paste0("Refugees/arrival_age/arrival_age_", year, ".csv"), 
            row.names = F)
  arrival_broad_age_group <- arrival[-2:-19, ]
  arrival_broad_age_group <- arrival_broad_age_group[-5:-9, ]
  write.csv(arrival_broad_age_group, paste0("Refugees/arrival_broad_age_group/arrival_broad_age_group_", 
                                            year, ".csv"), row.names = F)
  arrival_marital_status <- arrival[-2:-22, ]
  write.csv(arrival_marital_status, paste0("Refugees/arrival_marital_status/arrival_marital_status_", year, ".csv"), row.names = F)
}

write_asylum_files <- function(asylum, year) {
  asylum_gender <- asylum[1:3,]
  write.csv(asylum_gender, paste0("Refugees/asylum_gender/asylum_gender_",
                                  year, ".csv"), row.names = F)
  asylum_age <- asylum[-2, ]
  asylum_age <- asylum_age[-2, ]
  asylum_age <- asylum_age[-18:-27, ]
  write.csv(asylum_age, paste0("Refugees/asylum_age/asylum_age_", year, ".csv"),
            row.names = F)
  asylum_broad_age_group <- asylum[-2:-19, ]
  asylum_broad_age_group <- asylum_broad_age_group[-5:-9, ]
  write.csv(asylum_broad_age_group, paste0("Refugees/asylum_broad_age_group/asylum_broad_age_group_", 
                                           year, ".csv"), row.names = F)
  asylum_marital_status <- asylum[-2:-22, ]
  write.csv(asylum_marital_status, paste0("Refugees/asylum_marital_status/asylum_marital_status_", 
                                          year, ".csv"), row.names = F)
}

write_arrival_files(arrival_relationships, 2009)
write_asylum_files(asylum_relationships, 2009)

# colnames(data)[colnames(data)=="old_name"] <- "new_name"
colnames(arrival_relationships)[colnames(arrival_relationships) == 
                                  "Characteristic"] <- "character"
colnames(asylum_relationships)[colnames(asylum_relationships) == 
                                 "ï..Characteristic"] <- "character"

combined <- arrival_relationships %>%
  left_join(asylum_relationships, by = "character")

write.csv(combined, "Refugees/combined_relationships_2004.csv", 
          row.names = F)

line_plot <- ggplot(combined) +
  geom_line(mapping = aes(arrival_applicants, asylum_applicants))

line_plot
