# Create the UI for the application. There are 5 tabs that are defined.

library(shiny)
library(plotly)

# Introduction panel
intro_page <- tabPanel(
  titlePanel("Intro"),
  h1("Do Wildfires Significantly Affect Air Quality?"),

  h2("Overview"),
  p("TODO: write overview"),

  h2("Major Questions"),
  p("TODO: write major questions to answer"),

  h2("Datasets"),
  p("TODO: talk about datasets")
)

# Chart 1

# sidebar panel
chart1_sidebar_content <- sidebarPanel(
  # Make date picker show up above tabs
  tags$style(HTML(".datepicker {z-index:99999 !important;}")),

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
  plotlyOutput("chart1") # Chart 1
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
  # Make date picker show up above tabs
  tags$style(HTML(".datepicker {z-index:99999 !important;}")),

  # State selection
  selectInput(
    inputId = "chart2_states",
    label = "Filter States",
    choices = state.name,
    selected = state.name,
    multiple = TRUE
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
  plotlyOutput("chart2") # Chart 2
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
  plotlyOutput("chart3") # Chart 3
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
  h1("Summary Takeaways"),

  h2("Takeaway 1: _"),
  p("TODO: write takeaway"),

  h2("Takeaway 2: _"),
  p("TODO: write takeaway"),

  h2("Takeaway 3: _"),
  p("TODO: write takeaway"),
)

# Report page
report_page <- tabPanel(
  titlePanel("Report"),
  # TODO: add final report
)

# UI with all the tabs
ui <- navbarPage(
  title = "SABA AQI",
  intro_page,
  chart1_page,
  chart2_page,
  chart3_page,
  summary_page,
  report_page
)