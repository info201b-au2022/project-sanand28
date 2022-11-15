# data_access.R must be run first for helper functions if running individually.
# source("data_access.R")

wildfires <- get_wildfires_df()

# Get yearly total acres burned in every state
acres_by_state <- wildfires %>%
  mutate(Year = format(Ig_Date, "%Y")) %>%
  group_by(State_Abbr, State, Year) %>%
  summarise(Total_Burned = sum(BurnBndAc), .groups = "drop") %>%
  pivot_wider(names_from = "Year", values_from = Total_Burned)

# Add any states that didn't have any wildfires in all years
for (state_name in state.name) {
  if (!(state_name %in% acres_by_state$State)) {
    new_state <- data.frame(
      State_Abbr = state.abb[which(state.name == state_name)],
      State = state_name,
      stringsAsFactors = FALSE)
    acres_by_state <- bind_rows(acres_by_state, new_state)
  }
}

# Set NA to 0
acres_by_state[is.na(acres_by_state)] <- 0

# Create total in 5 years
acres_by_state$Total_Burned <- acres_by_state[["2017"]] +
  acres_by_state[["2018"]] +
  acres_by_state[["2019"]] +
  acres_by_state[["2020"]] +
  acres_by_state[["2021"]]

# Order by total acres burned, descending
acres_by_state <- acres_by_state %>% arrange(desc(Total_Burned))
