library(ggplot2)
library(tidyverse)
# Read data (originally converted from .dbf (shapefile) to .csv using Excel)
fires <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-sanand28/main/data/fires.csv")

# Extract all wildfires from 2017 to 2021 with their states
wildfires <- fires %>%
  mutate(Ig_Date = as.Date(Ig_Date, format = "%m/%d/%Y")) %>% # Convert to date
  filter(format(Ig_Date, "%Y") >= 2017) %>% # Filter to 2017 and on
  filter(Incid_Type == "Wildfire") %>% # Filter to only wildfires
  relocate(BurnBndLon) %>% # Move lon to front
  relocate(BurnBndLat, .after = BurnBndLon) %>% # Move lat to right after lon
  arrange(Ig_Date) # Order by date, earliest to latest

# Add Alaska and Hawaii to us_states.
full_us <- rbind(spData::us_states,
                 st_transform(spData::alaska, st_crs(spData::us_states)),
                 st_transform(spData::hawaii,st_crs(spData::us_states)))

# Get state from lat/lon
wildfires$State <- lonlat_to_state(wildfires, states = full_us)
wildfires$State_Abbr <- state.abb[match(wildfires$State, state.name)]

# Drop NA states (wildfires in Puerto Rico, or those that started in
# Mexico/Canada but spread into the US). There are 8 total of these.
wildfires <- wildfires %>% drop_na(State)

View(wildfires)

acres_by_state <- wildfires %>%
  mutate(Year = format(Ig_Date, "%Y")) %>%
  group_by(State_Abbr, State, Year) %>%
  summarise(Total_Burned = sum(BurnBndAc))
View(acres_by_state)

#jjj