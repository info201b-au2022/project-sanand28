source("data_access.R")
library(plotly)

wildfires <- get_wildfires_df()

# Get yearly total acres burned in every state
acres_by_state <- wildfires %>%
  mutate(Year = format(Ig_Date, "%Y")) %>%
  group_by(State_Abbr, State, Year) %>%
  summarise(Total_Burned = sum(BurnBndAc), .groups = "drop") %>%
  pivot_wider(names_from = "Year", values_from = Total_Burned)

# Set NA to 0
acres_by_state[is.na(acres_by_state)] <- 0

# Create total in 5 years
acres_by_state$Total_Burned <- acres_by_state[["2017"]] +
                               acres_by_state[["2018"]] +
                               acres_by_state[["2019"]] +
                               acres_by_state[["2020"]] +
                               acres_by_state[["2021"]]

acres_by_state$hover <- with(acres_by_state, paste(State, "<br>",
                                                   "2017", acres_by_state[["2017"]], "<br>",
                                                   "2018", acres_by_state[["2018"]], "<br>",
                                                   "2019", acres_by_state[["2019"]], "<br>",
                                                   "2020", acres_by_state[["2020"]], "<br>",
                                                   "2021", acres_by_state[["2021"]], "<br>"))


fig <- plot_geo(acres_by_state, locationmode = "USA-states")

# Create choropleth of total acres burned from 2017-2021 
fig <- fig %>% add_trace(
  z = ~Total_Burned, text = ~hover, locations = ~State_Abbr,
  color = ~Total_Burned, colors = "Reds"
)

# Create legend
fig <- fig %>% colorbar(title = "Burnage (Acres)")

# Use Albers USA projection to easily see Alaska and Hawaii
fig <- fig %>% layout(
  title = "2017-2021 Acres Burned by State<br>(Hover for breakdown)",
  geo = list(scope = "usa", projection = list(type = "albers usa"))
)

fig
