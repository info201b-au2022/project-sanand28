install.packages('spDataLarge',
                 repos='https://nowosad.github.io/drat/', type='source')
source("data_access.R")
library(plotly)

data <- get_aqi_df()
wildfire_data <- get_wildfires_df()

#Get acres burned 
acres_burned <- wildfire_data %>%
  pull(BurnBndAc)

#State 
state <- wildfire_data %>% 
  select(State)

#Get AQI data
AQI <- data %>% 
  pull(AQI)

scatterplot <- plot(
  x = state,
  y = acres_burned,
  xlim = 1,000,000,
  ylim = 1,000,000, 
  main = "Acres Burned vs. AQI",
  xlab = "State",
  ylab = "Acres Burned"
)
