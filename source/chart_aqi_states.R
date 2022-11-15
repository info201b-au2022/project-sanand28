# data_access.R must be run first for helper functions if running individually.
# source("data_access.R")

library(plotly)

wildfires <- get_wildfires_df()
aqi <- get_aqi_df()

# Get total acres burned in every state in 2021
wildfires_2021 <- wildfires %>%
  mutate(Year = format(Ig_Date, "%Y")) %>%
  filter(Year == 2021) %>%
  group_by(State) %>%
  summarise(Total_Burned = sum(BurnBndAc), .groups = "drop")

# Get average AQI in every state in 2021
aqi_2021 <- aqi %>%
  mutate(Year = format(as.Date(Date), "%Y")) %>%
  filter(Year == 2021) %>%
  group_by(State) %>%
  summarize(Avg_AQI = mean(AQI))

# Join the datasets by state
data <- wildfires_2021 %>%
  left_join(aqi_2021, by = "State")

# Create the scatter plot
scatter <- plot_ly(data = data,
                   type = "scatter",
                   mode = "markers",
                   x = ~Total_Burned,
                   y = ~Avg_AQI,
                   text = ~State
                   )

# Set title and axes
scatter <- scatter %>%
  layout(title = "Average AQI vs Acres Burned by Wildfires for U.S. States in 2021",
         xaxis = list(title = "Total Burned (Acres)"),
         yaxis = list(title = "Average AQI"))

scatter
