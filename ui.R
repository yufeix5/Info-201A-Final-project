library("shiny")
library("plotly")

intro_page <- tabPanel(
  "Introduction of Project",
  titlePanel(title=img(src="airbnb.png", width = 500, height = 300)),
  h1(class = "center", "What's Our Goal?"),
  h4(class = "center_text", "Our goal for the New York City Airbnb project was
     to transform the New York City data set and turn it into visuals for future
     Airbnb owners and customers. Through our visualization, we hope to provide
     the customers and prospective Airbnb owners some information of the most
     popular Airbnb in the region, which could also provides some information
     about how the owners should operate their business in terms of selecting
     a specific location or selecting a price range, as well as how should customers
     select a Airbnb when plan their trips."),
  h1(class = "center", "Data set that we use:"),
  h4(class = "center_text", "To answer the question, we mainly use the New York
     City Airbnb data set, and the additional source including crime data in different
     neighborhood from the NYPD complaints data set."),
  h3(class = "center", "This project is created by:"),
  tags$li(class = "center_text", "Yufei Xia"),
  tags$li(class = "center_text", "Klein Wang"),
  tags$li(class = "center_text", "Lei Lei"),
  tags$li(class = "center_text", "Shawn Song")
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

# leaflet_page: an interactive leaflet that can show the location of NYC Airbnbs
# and could be modified with different price
leaflet_page <- tabPanel(
  "Distribution & price range"
)

conclusion_page <- tabPanel(
  "Summary",
  titlePanel("Conclusion of project"),
  h3("The Relationship Between New york City Airbnb Distribution and Room Type
     and How Should Owners Marketing"),
  p("<not finished yet, discription of first bar graph>"),
  
  h3("Using Price Range to See Airbnb Distribution"),
  p("<not finished yet, description of leaflet>"),
  
  h3("3rd graph information"),
  p("<not finished yet>")
)

ui <- tagList(
  navbarPage(
    theme = shinythemes::shinytheme("journal"),
    "New York City Airbnb Analysis",
    intro_page,
    bar_chart_page,
    leaflet_page,
    conclusion_page
  )
)



