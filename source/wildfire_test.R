# This file is a test file that extracts wildfire data from MTBS's fire dataset.
# It filters the data to only 2017-2021 and adds a State column

library(tidyverse)
library(sf)
library(spData)

# Lat/lon to state conversion function modified from Josh O'Brien's post
# https://stackoverflow.com/a/8751965
## pointsDF: A data.frame whose first column contains longitudes and
##           whose second column contains latitudes.
##
## states:   An sf MULTIPOLYGON object with 50 states plus DC.
##
## name_col: Name of a column in `states` that supplies the states'
##           names.
lonlat_to_state <- function(pointsDF,
                            states = spData::us_states,
                            name_col = "NAME") {
  ## Convert points data.frame to an sf POINTS object
  pts <- st_as_sf(pointsDF, coords = 1:2, crs = 4326)

  ## Transform spatial data to some planar coordinate system
  ## (e.g. Web Mercator) as required for geometric operations
  states <- st_transform(states, crs = 3857)
  pts <- st_transform(pts, crs = 3857)

  ## Find names of state (if any) intersected by each point
  state_names <- states[[name_col]]
  ii <- as.integer(st_intersects(pts, states))
  return(state_names[ii])
}

# Read data (originally converted from .dbf (shapefile) to .csv using Excel)
fires <- read.csv("https://raw.githubusercontent.com/project-sanand28/data/fires.csv")

# Extract all wildfires from 2017 to 2021 with their states
wildfires <- fires %>%
  mutate(Ig_Date = as.Date(Ig_Date, format = "%m/%d/%Y")) %>% # Convert to date
  filter(format(Ig_Date, "%Y") >= 2017) %>% # Filter to 2017 and on
  filter(Incid_Type == "Wildfire") %>% # Filter to only wildfires
  relocate(BurnBndLon) %>% # Move lon to front
  relocate(BurnBndLat, .after = BurnBndLon) %>% # Move lat to right after lon
  arrange(Ig_Date) # Order by date, earliest to latest

# Add Alaska and Hawaii to us_states
full_us <- rbind(spData::us_states,
                 st_transform(spData::alaska, st_crs(spData::us_states)),
                 st_transform(spData::hawaii,st_crs(spData::us_states)))

# Get state from lat/lon
wildfires$State <- lonlat_to_state(wildfires, states = full_us)

# Extract only the useful columns (id, acres burned, date, and state)
wildfires <- wildfires %>% select(Event_ID, BurnBndAc, Ig_Date, State)

# Example aggregation (total acres in every state every year)
acres_by_state_year <- wildfires %>%
  mutate(Year = format(Ig_Date, "%Y")) %>%
  group_by(State, Year) %>%
  summarise(total_burned = sum(BurnBndAc))
# The NA state data seem to be wildfires that started in Mexico but spread into the US
