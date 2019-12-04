library("dplyr")
library("plotly")
library("shiny")
library("leaflet")
library("tidyr")
library("ggplot2")
library("viridis")
source("ui.R")

df <- read.csv("AB_NYC_2019.csv", stringsAsFactors = F)

# The price ranges for Brooklyn
brooklyn <- df %>%
  filter(neighbourhood_group == "Brooklyn") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_brooklyn <- na.omit(brooklyn)



manhattan <- df %>%
  filter(neighbourhood_group == "Manhattan") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_manhattan <- na.omit(manhattan)



queens <- df %>%
  filter(neighbourhood_group == "Queens") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_queens <- na.omit(queens)



bronx <- df %>%
  filter(neighbourhood_group == "Bronx") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_bronx <- na.omit(bronx)

staten_island <- df %>%
  filter(neighbourhood_group == "Staten Island") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_staten_island <- na.omit(staten_island)


# The associated data frames of the room type

type_entire <- data.frame(c(
  filtered_brooklyn$num_each_type[1],
  filtered_queens$num_each_type[1],
  filtered_manhattan$num_each_type[1],
  filtered_bronx$num_each_type[1],
  filtered_staten_island$num_each_type[1]
))

type_private <- data.frame(c(
  filtered_brooklyn$num_each_type[2],
  filtered_queens$num_each_type[2],
  filtered_manhattan$num_each_type[2],
  filtered_bronx$num_each_type[2],
  filtered_staten_island$num_each_type[2]
))

type_shared <- data.frame(c(
  filtered_brooklyn$num_each_type[3],
  filtered_queens$num_each_type[3],
  filtered_manhattan$num_each_type[3],
  filtered_bronx$num_each_type[3],
  filtered_staten_island$num_each_type[3]
))

# The neighborhood and associated room type together in a data frame

neighborhoods <- data.frame(unique(df$neighbourhood_group))
neighborhood_df <- data.frame(neighborhoods,
                              type_entire, type_private, type_shared)
colnames(neighborhood_df) <- c(
  "neighborhood", "Entire house/apt", "Private room", "Shared room"
)

# dataframe for pie chart
neighborhood_df$total <- rowSums(neighborhood_df[,
                                                 c("Entire house/apt", "Private room", "Shared room")], na.rm = T)

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
  
  #Second chart in page one
  output$pie_chart <- renderPlot({
    p <- ggplot(neighborhood_df, aes(x = "", y = total, fill = neighborhood),
                position = position_stack(vjust = 0.3)) +
      geom_bar(stat = "identity", color = "black")
    p <- p + coord_polar(theta = "y") + theme(axis.ticks = element_blank(),
                                              axis.text.y = element_blank(),
                                              axis.text.x = element_text(
                                                colour = "black"),
                                              axis.title = element_blank())
    p <- p + scale_y_continuous(breaks = cumsum(neighborhood_df$total)
                                - neighborhood_df$total / 2,
                                labels = neighborhood_df$neighborhood)
    return(p)
  })
  
  
  # leaflet
  
  output$map <- renderLeaflet({
    df_price <- df %>%
      filter(reviews_per_month >= 2, minimum_nights <= 7) %>%
      select(latitude, longitude, price, name, room_type, minimum_nights)
    
    if (!("Below $100" %in% input$price_range)) {
      df_price <- df_price %>%
        filter(price > 100)
    }
    
    if (!("$100 ~ $150" %in% input$price_range)) {
      df_price <- df_price %>%
        filter(price > 150 | price <= 100)
    }
    
    if (!("$150 ~ $200" %in% input$price_range)) {
      df_price <- df_price %>%
        filter(price > 200 | price <= 150)
    }
    
    if (!("$200 ~ $250" %in% input$price_range)) {
      df_price <- df_price %>%
        filter(price > 250 | price <= 200)
    }
    
    if (!("$250 ~ $300" %in% input$price_range)) {
      df_price <- df_price %>%
        filter(price > 300 | price <= 250)
    }
    
    if (!("Above $300" %in% input$price_range)) {
      df_price <- df_price %>%
        filter(price <= 300)
    }
    
    wardpal <- colorFactor(viridis(6), input$price_range)
    map_of_vegas <- leaflet(data = df_price) %>%
      addProviderTiles("CartoDB.Positron") %>%
      setView(lng = -73.935242, lat = 40.730610, zoom = 10.5) %>%
      addCircleMarkers(lng = ~longitude, 
                       lat = ~latitude, 
                       radius = 2, 
                       fillColor = ~wardpal(input$price_range),
                       stroke=FALSE,
                       fillOpacity = 0.8,
                       popup = paste("Name:", df_price$name, "<br>",
                                     "Type:", df_price$room_type, "<br>",
                                     "Minimum nights:", df_price$minimum_nights) 
                       )%>%
      addLegend(
        position = "bottomright",
        title = "Airbnbs in New York City",
        pal = wardpal,
        values = ~input$price_range,
        opacity = 1
      )
    map_of_vegas
    
  })
  
}
