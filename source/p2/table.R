# data_access.R must be ran first for helper functions if running individually.
# Or, set session's working directory to source file location and run the line below
# source("../data_access.R")

if (!exists("wildfires")) {
  wildfires <- get_wildfires_df()
}

# Get yearly total acres burned in every state
table <- wildfires %>%
  mutate(Year = format(Ig_Date, "%Y")) %>%
  group_by(State_Abbr, State, Year) %>%
  summarise(Total_Burned = sum(BurnBndAc), .groups = "drop") %>%
  pivot_wider(names_from = "Year", values_from = Total_Burned)

# Add any states that didn't have any wildfires in all years
for (state_name in state.name) {
  if (!(state_name %in% table$State)) {
    new_state <- data.frame(
      State_Abbr = state.abb[which(state.name == state_name)],
      State = state_name,
      stringsAsFactors = FALSE)
    table <- bind_rows(table, new_state)
  }
}

# Set NA to 0
table[is.na(table)] <- 0

# Create total in 5 years
table$Total_Burned <- table[["2017"]] +
  table[["2018"]] +
  table[["2019"]] +
  table[["2020"]] +
  table[["2021"]]

# Order by total acres burned, descending
table <- table %>% arrange(desc(Total_Burned))
