
# Libraries
library(ggplot2)
library(tidyverse)
library(dplyr)

# create data
wa <- aqi_2021 %>%
  filter(State.Name == "Washington") 
View(wa)

# Plot
chart <- wa %>%
  ggplot(aes(x= Date, y= AQI)) +
  geom_bar(stat = "identity") 
chart
  