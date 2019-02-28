library(dplyr)
library(ggplot2)

arrival_relationships <- read.csv("Refugees/arrival_relationships.csv",
                                  stringsAsFactors = F)
asylum_relationships <- read.csv("Refugees/asylum_relationships.csv",
                                 stringsAsFactors = F)

# colnames(data)[colnames(data)=="old_name"] <- "new_name"
colnames(arrival_relationships)[colnames(arrival_relationships) == 
                                  "ï..Characteristic"] <- "character"
colnames(asylum_relationships)[colnames(asylum_relationships) == 
                                 "ï..Characteristic"] <- "character"

combined <- arrival_relationships %>%
  left_join(asylum_relationships, by = "character")

write.csv(combined, "Dataset/Refugees/combined_relationships.csv", 
          row.names = F)

line_plot <- ggplot(combined) +
  geom_line(mapping = aes(arrival_applicants, asylum_applicants))

line_plot
