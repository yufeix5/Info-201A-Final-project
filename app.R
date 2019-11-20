# Final project
library("shiny")

# Executes the respective files
source("ui.R")
source("server.R")

# Creates a new shinyApp using the loaded ui and server variables
shinyApp(ui = ui, server = server)

