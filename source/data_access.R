# Project Data Access Functions
#----------------------------------------------------------------------------#
# These functions are used to access, modify, and filter data sources for use
# in other files.
#----------------------------------------------------------------------------#
library(tidyverse)
library(sf)
library(spData)

# Extract wildfire data from MTBS's fire dataset. Specifically, it filters
# the fires data to wildfires from 2017 to 2021 and adds the state abbreviation
# and state name columns.
get_wildfires_df <- function() {

  # Lat/lon -> state conversion function from Josh O'Brien's post
  # https://stackoverflow.com/a/8751965.
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

  return(wildfires)
}

# Extract AQI data from EPA's datasets. It aggregates county-level AQI data into
# state-level daily mean, max, and min AQI from 2017 to 2021.
get_aqi_df <- function() {

  # Extract and format AQI data for a specified file.
  ## file:  name of the data file (e.g. "aqi_2017")
  format_data <- function(file) {

    # Load the data
    link <- paste0("https://raw.githubusercontent.com/info201b-au2022/project-sanand28/main/data/", file)
    data <- read.csv(link)

    # Calculate daily mean, max, and min for every state
    data <- data %>%
      rename(State = State.Name) %>%
      group_by(State, Date) %>%
      summarize(AQI = mean(AQI),
                Max_AQI = max(AQI),
                Min_AQI = min(AQI),
                .groups = "drop")

    return(data)
  }

  aqi_2017 <- format_data("aqi_2017.csv")
  aqi_2018 <- format_data("aqi_2018.csv")
  aqi_2019 <- format_data("aqi_2019.csv")
  aqi_2020 <- format_data("aqi_2020.csv")
  aqi_2021 <- format_data("aqi_2021.csv")

  # Combine data from all years into a single dataframe
  aqi <- rbind(aqi_2017, aqi_2018, aqi_2019, aqi_2020, aqi_2021)

  return(aqi)
}
