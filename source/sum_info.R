# Summary
# A source file that takes in a dataset and returns a list of info about it:

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
install.packages("sf")
install.packages("spData")
source("data_access.R")
get_AQI_df

sum_info$worst_AQI <- aqi %>%
  filter(AQI == max(AQI)) %>%
  group_by(Year) %>%
  pull(State.Name)

    

# Info 5: states with the best AQI every year from 2017 to 2021
library("sf")
library("spData")
source("data_access.R")
get_AQI_df

sum_info$best_AQI <- aqi %>%
  filter(AQI == min(AQI)) %>%
  group_by(Year) %>%
  pull(State.Name)



