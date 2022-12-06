# Creates the three charts
source("data_access.R")

library(dplyr)

# Load the data
if (!exists("wildfires")) {
  wildfires <- get_wildfires_df()
}
if (!exists("aqi")) {
  aqi <- get_aqi_df()
}

server <- function(input, output) {
  # Create chart 1
  output$chart1 <- renderPlotly({
    # Filter acres burned to the selected year
    acres_by_state <- wildfires %>%
      mutate(Year = format(Ig_Date, "%Y")) %>%
      filter(Year == input$chart1_year) %>%
      group_by(State, State_Abbr) %>%
      summarize(Total_Burnage = sum(BurnBndAc, na.rm = T), .groups = "drop")

    # Clean up data (fill in any empty/NA states with 0)
    for (state_name in state.name) {
      if (!(state_name %in% acres_by_state$State)) {
        new_state <- data.frame(
          State_Abbr = state.abb[which(state.name == state_name)],
          State = state_name,
          stringsAsFactors = FALSE)
        acres_by_state <- bind_rows(acres_by_state, new_state)
      }
    }
    acres_by_state[is.na(acres_by_state)] <- 0

    # Create choropleth
    chart <- plot_geo(acres_by_state, locationmode = "USA-states") %>%
    add_trace(z = ~Total_Burnage, text = ~State, locations = ~State_Abbr,
      color = ~Total_Burnage, colors = "Reds") %>%
    colorbar(title = "Burnage (Acres)") %>%
    layout( # Use Albers USA projection
      title = paste("Acres Burned by State in", input$Year),
      geo = list(scope = "usa", projection = list(type = "albers usa"))
    )
    return(chart)
  })

  # Create chart 2
  output$chart2 <- renderPlotly({
    # TODO: create and return chart 2
    return(NA)
  })

  # Create chart 3
  output$chart3 <- renderPlotly({
    # TODO: create and return chart 3
    return(NA)
  })

  # TODO? Create any other variables/charts used in the app
}