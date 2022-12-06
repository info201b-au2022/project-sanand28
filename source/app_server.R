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
    # "Wildfire Burnage"
    # "Wildfire Count"
    #
    #
    if (input$chart1_var != "Average AQI") {
      # Filter acres burned and wildfire count to the selected date range
      data <- wildfires %>%
        filter(
          input$chart1_date_range[1] <= Ig_Date,
          Ig_Date <= input$chart1_date_range[2],
          ) %>%
        group_by(State, State_Abbr) %>%
        summarize(
          Total_Burnage = sum(BurnBndAc, na.rm = T),
          Wildfire_Count = n(),
          .groups = "drop"
        )

      # Clean up data (fill in any empty/NA states with 0)
      for (state_name in state.name) {
        if (!(state_name %in% data$State)) {
          new_state <- data.frame(
            State_Abbr = state.abb[which(state.name == state_name)],
            State = state_name,
            stringsAsFactors = FALSE)
          data <- bind_rows(data, new_state)
        }
      }
      data[is.na(data)] <- 0

      # Create choropleth
      chart <- plot_geo(data, locationmode = "USA-states")
      if (input$chart1_var == "Wildfire Burnage") {
        chart <- chart %>%
          add_trace(
            z = ~Total_Burnage, text = ~State, locations = ~State_Abbr,
            color = ~Total_Burnage, colors = "Reds"
          ) %>%
        colorbar(title = "Burnage (Acres)") %>%
        layout( # Use Albers USA projection
          title = paste(
            "Acres Burned by State from",
            input$chart1_date_range[1], "to", input$chart1_date_range[2]
          ),
          geo = list(scope = "usa", projection = list(type = "albers usa"))
        )
      } else {
        chart <- chart %>%
          add_trace(
            z = ~Wildfire_Count, text = ~State, locations = ~State_Abbr,
            color = ~Wildfire_Count, colors = "Reds"
          ) %>%
        colorbar(title = "Wildfire Count") %>%
        layout( # Use Albers USA projection
          title = paste(
            "Number of Wildfires Ignited by State from",
            input$chart1_date_range[1], "to", input$chart1_date_range[2]
          ),
          geo = list(scope = "usa", projection = list(type = "albers usa"))
        )
      }
    } else {
      # Filter aqi data to the selected date range
      data <- aqi %>%
        filter(
          input$chart1_date_range[1] <= Date,
          Date <= input$chart1_date_range[2],
          ) %>%
        group_by(State) %>%
        summarize(
          Average_AQI = mean(AQI, na.rm = T),
          Max_AQI = max(Max_AQI, na.rm = T),
          Min_AQI = min(Min_AQI, na.rm = T)
        )
      data$State_Abbr <- state.abb[match(data$State, state.name)]
      # Create choropleth
      chart <- plot_geo(data, locationmode = "USA-states") %>%
        add_trace(z = ~Average_AQI, text = ~State, locations = ~State_Abbr,
          color = ~Average_AQI, colors = "Reds") %>%
      colorbar(title = "AQI") %>%
      layout( # Use Albers USA projection
        title = paste(
          "Average AQI by State from",
          input$chart1_date_range[1], "to", input$chart1_date_range[2]
        ),
        geo = list(scope = "usa", projection = list(type = "albers usa"))
      )
    }
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