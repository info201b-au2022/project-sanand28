# Runs the shiny application

library("shiny")
library("markdown")
source("app_ui.R")
source("app_server.R")

shinyApp(ui = ui, server = server)
