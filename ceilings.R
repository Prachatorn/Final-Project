library(dplyr)
library(ggplot2)
source("regional_and_caps.R")

ceilings <- function(Year, Admitted) {
  ceilings <- ggplot(caps, aes(x = Year)) +
    geom_line(aes(y = Cap, colour = "Cap")) +
    geom_line(aes(y = Admitted, colour = "Admitted")) +
    geom_point(aes (y = Cap)) +
    geom_point(aes (y = Admitted)) +
    scale_x_continuous(
      breaks = seq(2008, 2016, 1)
    ) +
    scale_y_continuous(
      "Total Numbers of People",
      breaks= seq(56000, 86000, 2000)
    ) +
    ggtitle("Refugee Admissions Ceiling vs Total Refugee Admissions") +
    scale_color_manual(
      name = "Total Numbers",
      values= c(
        "Cap" = "red",
        "Admitted" = "green"
      ),
      labels = c(
        "Admitted",
        "Ceiling Cap"
      )
    )
  return(ceilings)
}