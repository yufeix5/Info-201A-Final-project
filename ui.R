library("shiny")
library("plotly")
library("leaflet")

intro_page <- tabPanel(
  "Introduction of Project",
  titlePanel(title = img(src = "airbnb.png", width = 500, height = 300)),
  h1(class = "center", "What's Our Goal?"),
  h4(class = "center_text", "Our goal for the New York City Airbnb project was
     to transform the New York City data set and turn it into visuals for future
     Airbnb owners and customers. Through our visualization, we hope to provide
     the customers and prospective Airbnb owners some information of the most
     popular Airbnb in the region, which could also provides some information
     about how the owners should operate their business in terms of selecting
     a specific location or selecting a price range, as well as how should
     customers select a Airbnb when plan their trips."),
  h1(class = "center", "Data set that we use:"),
  h4(class = "center_text", "To answer the question, we mainly use the
    New York City Airbnb data set, and the additional source including
    crime data in different neighborhood from the NYPD complaints data set."),
  h3(class = "center", "This project is created by:"),
  tags$li(class = "center_text", "Yufei Xia"),
  tags$li(class = "center_text", "Klein Wang"),
  tags$li(class = "center_text", "Lei Lei"),
  tags$li(class = "center_text", "Shawn Song"),
  h3("For more information about the project"),
  tags$div(class = "submit",
           tags$a(href = "https://github.com/yufeix5/Info-201A-Final-project/wiki",
                  "Project Wiki",
                  target = "_blank")
  )
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
      p("This bar graph shows different room types in a specific neighborhood,
        including entire house/apt, private room, and shared room. This graph
        can be used to compare the amount of each type of rooms in one neighborhood.
        It can not be used to compare the amount of rooms among all neighborhoods.
        To eliminate the problem, we created the next pie chart to show the total
        amount of Airbnb rooms in each neighborhood."),
      plotOutput("pie_chart"),
      br(),
      p("This pie chart is displaying the proportion of total number of different
        type of rooms in each neighborhood. The graph shows Airbnb in Brooklyn and
        Queens combined made up at least 85% of rooms among all neighborhoods.
        Also, Airbnb in Staten Island and Bronx combined formed only 5% of rooms in
        all neighborhoods, and about 10% of rooms is contributed by Manhattan neighborhood.")
    )
  )
)

# leaflet_page: an interactive leaflet that can show the location of NYC Airbnbs
# and could be modified with different price
map_page <- tabPanel(
  "Map of Airbnbs",
  titlePanel("Geographic Distribution of Airbnb"),
  
  sidebarLayout(
    sidebarPanel(
      id = "sidebar_map",
      checkboxGroupInput(
        "price_range",
        label = h3("price_range"),
        choices = list("Below $100", "$100 ~ $150", "$150 ~ $200",
                       "$200 ~ $250", "$250 ~ $300", "Above $300"),
        selected = list("Below $100", "$100 ~ $150", "$150 ~ $200",
                        "$200 ~ $250", "$250 ~ $300", "Above $300")
      )
    ),
    mainPanel(
      id = "main_map",
      br(),
      leafletOutput("map"),
      br(),
      p("This interactive map allows us to view the geographic distribution of
        Airbnbs in the New York area. The color-coded legend and the
        widget on the left allow us to sort the points on the map by price range
        for a visual representation of the what areas tend to have more Airbnbs
        in different price range.")
    )
  )
)

heat_map_page <- tabPanel(
  "Heat Map",
  titlePanel("Heat maps for New York City Airbnb average price and review count"),
  sidebarLayout(
    sidebarPanel(
      id = "heat_map",
      selectInput(
        inputId = "heat",
        label = "Heat Map",
        choices = c("Price", "Review")
      )
    ),
    
    mainPanel(
      id = "heatmap",
      plotOutput("heatmap"),
      p("These two heat maps show us a graphical representation of prices and the number
        of reviews in New York. As the price or number of reviews increases, the colors
        are designed to become warmer. The selection on the left allows users to choose
        the map they want to see, and it is also convenient to compare the differences
        between the two charts. As we can see on the map, there are several red clusters in
        Manhattan, suggesting that Airbnb in Manhattan tends to be more expensive and has
        more reviews.")
    )
  )
)

conclusion_page <- tabPanel(
  "Summary",
  titlePanel("What we found:"),
  br(),
  p("Based on the data and visualization in the bar chart, we can find that the number
  of shared rooms in all neighbourhoods is significantly lower than the number of rooms
     in other types, which apparently make sense that travelers tend to have their private
     spaces after a whole day of traveling and don’t expect to be disturbed by other people.
     It is too few to be analyzed so we won’t talk about it here. According to the pie chart,
     there are only few rooms in Staten Island, Bronx and a few rooms in Manhattan.
     Also, there is quite a big gap between the number of apartments and private room
     in these neighbourhood shown in the bar chart. These neighbourhoods are absolutely
     not as popular as Brooklyn and Queens so book a private room instead of a big apartment
     if you are going to stay there for a couple of days. Brooklyn is a good neighbourhood
     for traveling since it has a big portion of rooms. There are about equal numbers of apartments
     and private room so it is your choice to book whatever room type you want depending on your
     own situation. However, in Queens, the number of apartments is about 2 times as many as the
     number of private rooms, which forms a sharp contrast with the fact that there are generally
     more private rooms than apartments in other neighbourhoods. The reason is probably that
     Queens has a high price level that are attracting the riches. Another possibility is
     that Queens is located in the center of other neighbourhoods so visitors tend to only
     book rooms here while visiting other neighbourhoods as well. When you want to book a
     room in Queens, book an apartment if you have a long travel plan, otherwise a private
     room is also a good alternative.")
)

about_page <- tabPanel(
  "About",
  titlePanel("More information"),
  br(),
  h3(class = "center", "About tech:"),
  p("Our group used shiny to build this website. We also used plotly, leaflet,
    and ggplot2 to build all kinds of graphs. We created bar chart, pie chart,
    heat map, and a type of graph that could only created by using the ggplot2 package.
    For our server and ui code, we also used dplyr and tidyr package to construct our shiny app."),
  br(),
  h3(class = "center", "About us:"),
  tags$li(class = "center", "Yufei Xia"),
  p("Yufei Xia AKA Lexi is currently a freshmen at UW. Coming from China, she is enthusiastic about new
  technologies. As the main coder and coordinator in the team, she learned a lot doing this this project,
    and she wants to pursue informatics major in the future."),
  tags$li(class = "center", "Klein Wang"),
  p("Renhao Wang is a freshman now at UW. He came from Beijing, China.
    His intended major is statistics. He is learning R language in this class because he thinks
    it would be useful in the future if he study in the field of statistics."),
  tags$li(class = "center", "Lei Lei"),
  p("Lei Lei is currently an international student from China, and she is currently a
    freshman at UW. She always enjoys participating in group projects and solving problems
    with friends. She intends to study ACMS and is passionate about studying applied mathematics.
    Some fun fact about her: She loves spice food and hot pot!!!"),
  tags$li(class = "center", "Shawn Song"),
  p("Shaobo Song is a boundless freshman from China. His intended major is ACMS.
    Fun facts about him:  I love playing Tennis and I can't live without my headphones.")
)

ui <- tagList(
  navbarPage(
    theme = shinythemes::shinytheme("journal"),
    "New York City Airbnb Analysis",
    intro_page,
    bar_chart_page,
    map_page,
    heat_map_page,
    conclusion_page,
    about_page
  )
)



