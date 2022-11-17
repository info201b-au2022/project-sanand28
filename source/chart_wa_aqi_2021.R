# data_access.R must be run first for helper functions if running individually.
# source("data_access.R")

# Libraries
library(ggplot2)
library(tidyverse)
library(dplyr)

if (!exists("aqi")) {
  aqi <- get_aqi_df()
}

# create data
wa <- aqi %>%
  mutate(Date = as.Date(Date)) %>%
  mutate(Year = format(Date, "%Y")) %>%
  filter(Year == 2021) %>%
  filter(State == "Washington")
# View(wa)

# Plot
chart <- wa %>%
  ggplot(aes(x = Date, y = AQI)) +
  geom_line(stat = "identity") +
  ggtitle("AQI in Washington in 2021")
chart
