library("dplyr")
library("plotly")
library("shiny")
source("app_ui.R")

df <- read.csv("AB_NYC_2019.csv", stringsAsFactors = F)
graph_one <- select(df, neighbourhood_group, room_type)
data <-table(graph_one$neighbourhood_group,graph_one$room_type)


Brooklyn <- graph_one %>%
  filter(neighbourhood_group == "Brooklyn") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_Brooklyn <- na.omit(Brooklyn)
Brooklyn <-  mutate(Brooklyn, neightborhood_group = "Brooklyn")


Manhattan <- graph_one %>%
  filter(neighbourhood_group == "Manhattan") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_Brooklyn <- na.omit(Manhattan)
Manhattan <-  mutate(Manhattan, neightborhood_group = "Manhatten")


Queens <- graph_one %>%
  filter(neighbourhood_group == "Queens") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_Brooklyn <- na.omit(Queens)
Queens <-  mutate(Queens, neightborhood_group = "Queens")


Bronx <- graph_one %>%
  filter(neighbourhood_group == "Bronx") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n()) 

Bronx <-  mutate(Bronx, neightborhood_group = "Bronx")

filtered_Brooklyn <- na.omit(Bronx)

final <- bind_rows(Bronx, Queens, Manhattan, Brooklyn, Staten_Island)

Staten_Island	 <- graph_one %>%
  filter(neighbourhood_group == "Staten Island") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_Brooklyn <- na.omit(Staten_Island)
Staten_Island <-  mutate(Staten_Island, neightborhood_group = "Staten Island")


num_room <- graph_one %>%
  filter(neighbourhood_group == "Brooklyn") %>%
  nrow()



proj_server <- function(input, output) {
  
  output$bar_plot <- renderPlot({
    ggplot(data = final, aes(x=input$checkGroup,
                             y=num_each_type,
                             fill = room_type)) + 
      labs(x = "neightborhood group",
           y = "counts",
           fill = "room type") + geom_bar(stat = "identity", position = "dodge")
    
  })
}

