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
    # TODO: create and return chart 1
    return(NA)
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