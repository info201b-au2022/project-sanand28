# Summary
# A source file that takes in a dataset and returns a list of info about it:
# data_access.R must be run first for helper functions if running individually.
# source("data_access.R")

library(tidyverse)


if (!exists("wildfires")) {
  wildfires <- get_wildfires_df()
}
if (!exists("aqi")) {
  aqi <- get_aqi_df()
}

sum_info <- list()

# Info 1: number of wildfires
sum_info$num_wildfires <- prettyNum(nrow(wildfires), big.mark = ",", scientific = FALSE)

# Info 2: number of AQI observations
sum_info$num_observations_aqi <- prettyNum(nrow(aqi), big.mark = ",", scientific = FALSE)

# Info 3: average AQI in the U.S. every year from 2017 to 2021
sum_info$average_AQI <- aqi %>%
  mutate(Year = format(as.Date(Date), "%Y")) %>%
  group_by(Year) %>%
  summarize(average_aqi = mean(AQI)) %>%
  mutate_if(is.numeric, round, digits = 2) %>%
  pull(average_aqi) # round to 2 decimal places

# Info 4: states with the worst AQI every year from 2017 to 2021
sum_info$worst_AQI <- aqi %>%
  mutate(Year = format(as.Date(Date), "%Y")) %>%
  group_by(Year) %>%
  filter(AQI == max(AQI)) %>%
  pull(State)

# Info 5: Date Washington had its largest wildfire (in acres burned) in 2021
sum_info$wa_largest_wildfire_2021 <- wildfires %>%
  mutate(Ig_Date = as.Date(Ig_Date)) %>%
  filter(
    State == "Washington",
    format(Ig_Date, "%Y") == 2021
  ) %>%
  filter(BurnBndAc == max(BurnBndAc)) %>%
  pull(Ig_Date)

# Info 6: Date Washington had the highest AQI in 2021
sum_info$wa_max_aqi_2021 <- aqi %>%
  mutate(Date = as.Date(Date)) %>%
  filter(
    State == "Washington",
    format(Date, "%Y") == 2021
  ) %>%
  filter(Max_AQI == max(Max_AQI)) %>%
  pull(Date)
