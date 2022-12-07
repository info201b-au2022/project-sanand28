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
    if (input$chart1_var != "Average AQI") {
      # Filter acres burned and wildfire count to the selected date range
      data <- wildfires %>%
        filter(
          input$chart1_date_range[1] <= Ig_Date,
          Ig_Date <= input$chart1_date_range[2],
          ) %>%
        group_by(State, State_Abbr) %>%
        summarize(
          Total_Burned = sum(BurnBndAc, na.rm = T),
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
            z = ~Total_Burned, text = ~State, locations = ~State_Abbr,
            color = ~Total_Burned, colors = "Reds"
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
          Avg_AQI = mean(AQI, na.rm = T),
          Max_AQI = max(Max_AQI, na.rm = T),
          Min_AQI = min(Min_AQI, na.rm = T)
        )
      data$State_Abbr <- state.abb[match(data$State, state.name)]
      # Create choropleth
      chart <- plot_geo(data, locationmode = "USA-states") %>%
        add_trace(z = ~Avg_AQI, text = ~State, locations = ~State_Abbr,
          color = ~Avg_AQI, colors = "Reds") %>%
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

    # Filter acres burned to the selected date range
    wildfire_data <- wildfires %>%
      filter(
        input$chart2_date_range[1] <= Ig_Date,
        Ig_Date <= input$chart2_date_range[2],
        ) %>%
      group_by(State) %>%
      summarize(Total_Burned = sum(BurnBndAc, na.rm = T))

    # Filter average aqi to the selected date range
    aqi_data <- aqi %>%
      filter(
        input$chart1_date_range[1] <= Date,
        Date <= input$chart1_date_range[2],
        ) %>%
      group_by(State) %>%
      summarize(Avg_AQI = mean(AQI, na.rm = T))

    # Join the datasets by state and filter to the selected states
    data <- aqi_data %>%
      left_join(wildfire_data, by = "State") %>%
      filter(State %in% input$chart2_states)

    # Create the scatter plot
    chart <- plot_ly(
      data = data,
      type = "scatter",
      mode = "markers",
      x = ~Total_Burned,
      y = ~Avg_AQI,
      text = ~State
    ) %>%
      layout(
        title = paste(
          "Average AQI vs Acres Burned by Wildfires<br>from",
          input$chart2_date_range[1], "to", input$chart2_date_range[2]
        ),
        xaxis = list(title = "Total Burned (Acres)"),
        yaxis = list(title = "Average AQI")
      )
    return(chart)
  })

  # Create chart 3
  output$chart3 <- renderPlotly({
    # TODO: create and return chart 3
    aqi_data <- aqi %>%
      mutate(Date = as.Date(Date)) %>%
      filter(input$chart3_year == format(Date, "%Y")) %>%
      filter(State == input$chart3_state)

    wildfire_data <- wildfires %>%
      filter(input$chart3_year == format(Ig_Date, "%Y")) %>%
      filter(State == input$chart3_state) %>%
      group_by(Ig_Date) %>%
      summarize(
        Total_Burned = sum(BurnBndAc, na.rm = T),
        Count = n()
      )

    chart <- plot_ly() %>%
      add_trace(
        x = wildfire_data$Ig_Date,
        y = wildfire_data$Total_Burned,
        name = "Acres Burned",
        type = "bar"
      )

    chart <- chart %>% add_trace(
        x = aqi_data$Date,
        y = aqi_data$AQI,
        name = "AQI",
        mode = "lines+markers",
        type = "scatter",
        yaxis = "y2"
      ) %>%
      layout(
        title = paste(
          "AQI and Acres Burned by Wildfires in",
          input$chart3_state, "in", input$chart3_year),
        xaxis = list(title = "Date"),
        yaxis = list(
          title = "Total Burned by Wildfire (Acres)",
          rangemode = "tozero"
        ),
        yaxis2 = list(
          overlaying = "y",
          side = "right",
          title = "AQI",
          tickfont = list(color = "red"),
          rangemode = "tozero"
        )
      )
    return(chart)
  })

  # TODO? Create any other variables/charts used in the app
}