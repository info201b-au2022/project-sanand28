# Create the UI for the application. There are 5 tabs that are defined.

library(shiny)
library(plotly)
library(markdown)

# Introduction panel
intro_page <- tabPanel(
  titlePanel("Intro"),
  tags$div(class = "text-page",
    h1("Do Wildfires Significantly Affect Air Quality?"),

    h2("Overview"),
    p("Over the last half decade, wildfires across America have increased drastically, increasing
  the AQI around. We want to find out if the increase in numbers has a correlation with the wild fires
  happening around the country."),

    img("", src = "https://cdn.theatlantic.com/media/img/photo/2022/07/photos-wildfires-rage-across-southw/a01_1241970129-1/original.jpg", width="100%"),
    p("Image from", em("The Atlantic")),

    h2("Major Questions"),
    p("Here's what we wanted to find out:"),
    tags$ul(
      tags$li("How does average air quality differ betweem states?"),
      tags$li("Is there a trend in the change of air quality in Washington and other states in recent years?"),
      tags$li("Is there a relationship between air quality and the acres burned from wildfires? If so, how are they related?"),
      tags$li("What locations tend to have sudden spikes in air quality?")
    ),

    h2("Datasets"),
    p("The datasets we used were multiple files spanning from the years 2017 to 2021. In each file,
  they contain every day of the year which allows us to track and analyze the trends of air quality
  and compare it to when there were fires. This data was taken from United States Environmental Protection
  Agency's Air Quality System. We also use Fire Occurrence Dataset that provides us with data about the fires
  spanning from the years 1984 to 2021. With this data, we can make conclusions about the connection wildfires
  have with the quality of the air."),

  h2("Key Findings"),
  p("While analyzing our datasets we understood the significance of wildfires in relation to air quality and how there is a correlation between AQI (Air Quality Index) and total acres burned.
    We were able to conclude in most cases that if a state has a lower AQI, they will most likely have less acres burned as compared to states with a higher AQI.")
  )
)

# Chart 1

# sidebar panel
chart1_sidebar_content <- sidebarPanel(
  # Data selection
  selectInput(
    inputId = "chart1_var",
    label = "Variable",
    choices = list(
      "Wildfire Burnage",
      "Wildfire Count",
      "Average AQI"
    )
  ),
  # Date range selection
  dateRangeInput(
    inputId = "chart1_date_range",
    label = "Date Range",
    start = "2017-01-01", end = "2021-12-31",
    min   = "2017-01-01", max = "2021-12-31",
    startview = "year", format = "mm/dd/yyyy"
  )
)

# main page
chart1_main_content <- mainPanel(
  plotlyOutput("chart1"), # Chart 1
  p(
    paste(
      "This chart shows the wildfire and AQI trends for a specified time for",
      "all U.S. states. Acres burned and the number of wildfires, when compared",
      "with the chart of average AQI, can assist in finding trends in location."
    )
  )
)

chart1_page <- tabPanel(
  titlePanel("Chart 1"),
  sidebarLayout(
    chart1_sidebar_content,
    chart1_main_content
  )
)

# Chart 2

# sidebar panel
chart2_sidebar_content <- sidebarPanel(
  # State selection
  checkboxGroupInput(
    inputId = "chart2_states",
    label = "Filter States",
    choices = state.name,
    selected = state.name
  ),
  # Date range selection
  dateRangeInput(
    inputId = "chart2_date_range",
    label = "Date Range",
    start = "2017-01-01", end = "2021-12-31",
    min   = "2017-01-01", max = "2021-12-31",
    startview = "year", format = "mm/dd/yyyy"
  )
)

# main page
chart2_main_content <- mainPanel(
  plotlyOutput("chart2"), # Chart 2
  p(
    paste(
      "This chart shows a scatterplot of acres burned by wildfire and average AQI",
      "for a specified time for specified U.S. states. Plotting these variables",
      "can help spot out trendlines and correlations."
    )
  )
)

chart2_page <- tabPanel(
  titlePanel("Chart 2"),
  sidebarLayout(
    chart2_sidebar_content,
    chart2_main_content
  )
)

# Chart 3

# sidebar panel
chart3_sidebar_content <- sidebarPanel(
  # State selection
  selectInput(
    inputId = "chart3_state",
    label = "Select State",
    choices = state.name,
    selected = "Washington"
  ),

  # Year selection
  sliderInput(
    inputId = "chart3_year",
    label = "Select Year",
    min = 2017, max = 2021,
    value = 2021,
    step = 1,
    sep = "",
    animate = animationOptions(interval = 1000)
  )
)

# main page
chart3_main_content <- mainPanel(
  plotlyOutput("chart3"), # Chart 3
  p(
    paste(
      "This chart shows a line graph of the AQI for a specified state and year,",
      "along with a bar graph underneath with the acres burned by wildfires",
      "on those days. This makes it easier to check how wildfires can impact",
      "AQI."
    )
  )
)

chart3_page <- tabPanel(
  titlePanel("Chart 3"),
  sidebarLayout(
    chart3_sidebar_content,
    chart3_main_content
  )
)

# Summary page
summary_page <- tabPanel(
  titlePanel("Summary"),
  tags$div(class = "text-page",
    h1("Summary Takeaways"),

    h2("Takeaway 1: Air quality and wildfires don’t have a strong correlation"),
    p("In order to see if there is a relationship between wildfires and AQI, we decided
to make a scatter plot that graphs total burned acres with average AQI in 2021 for
all states. A scatterplot was used since trends between two variables can be
spotted. If there is a correlation, there should be some sort of line with a relatively steep slope that shows
up. As shown, while there are strong cases like California with the worst AQI and most acres
burned, most of the remaining states are fairly inconclusive."),

    h2("Takeaway 2: AQI trend over time is similar among regions in the US."),
    p("By changing the Date range for our Chart 1 to show a different Average AQI map for each year,
we can see from the color-encoded maps that most states show similar trend throughout the years.
Hovering over a point will show the state's name and AQI."),

    h2("Takeaway 3: Northwest states tend to have the most extreme sudden spikes in the country, while
     eastern states with high population density tend to have the highest number of sudden spikes"),
    p("By selecting different states for Chart 3, you can see that while the other states’ sudden spikes
  usually never surpassed 200, the sudden spike in 2020 in the northwest states was more than 400 for Oregon,
  300 for Washington and 200 for Idaho respectively. As shown in the graphs below, there are also many
    more sudden spikes for Maryland compared to Washington"),

   img("", src = "https://iili.io/HnutaSV.md.png"),

   img("", src = "https://iili.io/HnAH0ru.md.png")
  )
)



# Report page
report_page <- tabPanel(
  titlePanel("Report"),
  tags$div(class = "text-page",
    # Must be linked via url for it to work on shinyapps,
    # since only the source folder is being deployed
    includeMarkdown("https://raw.githubusercontent.com/info201b-au2022/project-sanand28/main/docs/p01-proposal.md")
  )
)

# UI with all the tabs
ui <- navbarPage(
  title = "SABA AQI",
  header = tags$head(includeCSS("styles.css")),
  intro_page,
  chart1_page,
  chart2_page,
  chart3_page,
  summary_page,
  report_page
)
