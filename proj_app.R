# Final project
library("shiny")

# Executes the respective files
source("proj_ui.R")
source("proj_server.R")

# Creates a new shinyApp using the loaded ui and server variables
shinyApp(ui = ui, server = server)

