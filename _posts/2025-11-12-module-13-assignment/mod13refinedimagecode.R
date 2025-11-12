# Load libraries
library(ggplot2)
library(dplyr)

# Define "good cars" as those with mpg > 20 and wt < 3.0
mtcars$good_car <- ifelse(mtcars$mpg > 20 & mtcars$wt < 3.0, "Good Car", "Other")

# Create the visualization
ggplot(mtcars, aes(x = wt, y = mpg, color = good_car, size = hp)) +
  geom_point(alpha = 0.9, stroke = 1.2) +
  scale_color_manual(
    values = c("Good Car" = "#1B9E77", "Other" = "#7570B3")
  ) +
  scale_size_continuous(range = c(3, 8)) +
  labs(
    title = "Fuel Efficiency and Weight of Cars",
    subtitle = "'Good Cars' have MPG > 20 and Weight < 3.0",
    x = "Car Weight (1000 lbs)",
    y = "Fueal Efficiency (Miles per Gallon)",
    color = "",
    size = "Horsepower"
  ) +
  theme_minimal(base_size = 15) +
  theme(
    plot.title = element_text(face = "bold", size = 18, color = "#333333", hjust = 0.5),
    plot.subtitle = element_text(size = 13, color = "#555555", hjust = 0.5),
    axis.title = element_text(face = "bold", color = "#333333"),
    axis.text = element_text(color = "#444444"),
    legend.position = "right",
    panel.grid.major = element_line(color = "gray85"),
    panel.grid.minor = element_blank(),
    plot.margin = margin(15, 15, 15, 15)
  )
