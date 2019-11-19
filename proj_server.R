library("dplyr")
library("plotly")
library("shiny")
source("proj_ui.R")
library("tidyr")

df <- read.csv("AB_NYC_2019.csv", stringsAsFactors = F)

# The price ranges for Brooklyn
Brooklyn <- df %>%
  filter(neighbourhood_group == "Brooklyn") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_Brooklyn <- na.omit(Brooklyn)



Manhattan <- df %>%
  filter(neighbourhood_group == "Manhattan") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_Manhattan <- na.omit(Manhattan)



Queens <- df %>%
  filter(neighbourhood_group == "Queens") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_Queens <- na.omit(Queens)



Bronx <- df %>%
  filter(neighbourhood_group == "Bronx") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n()) 
filtered_Bronx <- na.omit(Bronx)

Staten_Island <- df %>%
  filter(neighbourhood_group == "Staten Island") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n()) 
filtered_Staten_Island <- na.omit(Staten_Island)

# The associated data frames of the room type

type_entire <- data.frame(c(
  filtered_Brooklyn$num_each_type[1],
  filtered_Queens$num_each_type[1],
  filtered_Manhattan$num_each_type[1],
  filtered_Bronx$num_each_type[1],
  filtered_Staten_Island$num_each_type[1]
))

type_private <- data.frame(c(
  filtered_Brooklyn$num_each_type[2],
  filtered_Queens$num_each_type[2],
  filtered_Manhattan$num_each_type[2],
  filtered_Bronx$num_each_type[2],
  filtered_Staten_Island$num_each_type[2]
))

type_shared <- data.frame(c(
  filtered_Brooklyn$num_each_type[3],
  filtered_Queens$num_each_type[3],
  filtered_Manhattan$num_each_type[3],
  filtered_Bronx$num_each_type[3],
  filtered_Staten_Island$num_each_type[3]
))

# The neighborhood and associated room type together in a data frame

neighborhoods <- data.frame(unique(df$neighbourhood_group))
neighborhood_df <- data.frame(neighborhoods, 
                              type_entire, type_private, type_shared)
colnames(neighborhood_df) <- c(
  "neighborhood", "Entire house/apt", "Private room", "Shared room"
)

# Server

server <- function(input, output) {
  output$bar_plot <- renderPlotly({
    # Filters down to a specific neighborhood
    one_neighborhood <- neighborhood_df %>%
      filter(neighborhood == input$neighborhood_choose)
    # not needed as part of the data frame
    no_neighborhood <- one_neighborhood %>%
      select(-neighborhood)
    # Organizes the data frame such that it is race vs pop
    type_count <- gather(
      no_neighborhood,
      key = types,
      value = count
    )
    # chart
    one_neighborhood_chart <- plot_ly(
      type_count,
      x = ~types, y = ~count,
      hoverinfo = "text",
      text = ~ paste(paste("Room types:", types),
        paste("Number of Airbnbs:", count),
        sep = "<br />"
        )
    ) %>%
      layout(
        title = "Number of Airbnbs of each room types",
        xaxis = list(title = "Room Type"),
        yaxis = list(title = "Number of Airbnb"),
        showlegend = FALSE
      )
    return(one_neighborhood_chart)
  })
}