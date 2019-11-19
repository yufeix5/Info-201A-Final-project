library("shiny")
library("plotly")

intro_page <- tabPanel(
  "Introduction of Project"
)

bar_chart_page <- tabPanel(
  "Airbnb Room Type",
  titlePanel("Room types of Airbnb in New York City"),
  sidebarLayout(
    sidebarPanel(
      id = "sidebar_bar",
      selectInput(
        inputId = "neighborhood_choose",
        label = "Neighborhood",
        choice = c("Brooklyn", "Bronx", "Manhattan", "Queens", "Staten Island")
      )
    ),
    
    mainPanel(
      id = "main_bar",
      br(),
      plotlyOutput("bar_plot"),
      br(),
      p("This is an interactive bar chart. To be continued.")
    )
  )
)

conclusion_page <- tabPanel(
  "Summary",
  
)

ui <- navbarPage(
  "New York City Airbnb Analysis",
  intro_page,
  bar_chart_page,
  conclusion_page
)


