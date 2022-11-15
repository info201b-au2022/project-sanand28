# Summary
# A source file that takes in a dataset and returns a list of info about it:

aqi_2021 <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-sanand28/main/data/aqi_2021.csv")
print(aqi_2021)
View(aqi_2021)
sum_info <- list()
sum_info$num_observations <- nrow (aqi_2021)
sum_info$AQI <- aqi_2021 %>%
  filter(AQI == max(AQI, na.rm = T)) %>%
  select(AQI)


sum_info <- list()
sum_info$num_observations <- nrow (aqi_2021)
sum_info$Category <- aqi_2021 %>%
  filter(Category == max(Category, na.rm = T)) %>%
  select(Category)


sum_info <- list()
sum_info$num_observations <- nrow (aqi_2021)
sum_info$State.Name <- aqi_2021 %>%
  filter(State.Name == max(State.Name, na.rm = T)) %>%
  select(State.Name)


sum_info <- list()
sum_info$num_observations <- nrow (aqi_2021)
sum_info$county.Name <- aqi_2021 %>%
  filter(county.Name == max(county.Name, na.rm = T)) %>%
  select(county.Name)


sum_info <- list()
sum_info$num_observations <- nrow (aqi_2021)
sum_info$Date <- aqi_2021 %>%
  filter(Date == max(Date, na.rm = T)) %>%
  select(Date)

