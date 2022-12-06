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
  # TODO: add sidebar widgets
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
  # TODO: add sidebar widgets
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
  # TODO: add sidebar widgets
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