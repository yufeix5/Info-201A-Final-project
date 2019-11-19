library(ggplot2)
library(dplyr)
library(shiny)




df <- read.csv("AB_NYC_2019.csv", stringsAsFactors = F)
graph_one <- select(df, neighbourhood_group, room_type)
data <-table(graph_one$neighbourhood_group, graph_one$room_type)
barplot(data, beside=TRUE)

p <- ggplot(data = graph_one, aes(x=neighbourhood_group,
                                  y=room_type,
                                  fill = room_type))
p + geom_bar(stat = "identity")


Brooklyn <- graph_one %>%
  filter(neighbourhood_group == "Brooklyn") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_Brooklyn <- na.omit(Brooklyn)

Manhattan <- graph_one %>%
  filter(neighbourhood_group == "Manhattan") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_Brooklyn <- na.omit(Manhattan)

Queens <- graph_one %>%
  filter(neighbourhood_group == "Queens") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_Brooklyn <- na.omit(Queens)

Bronx <- graph_one %>%
  filter(neighbourhood_group == "Bronx") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_Brooklyn <- na.omit(Bronx)

Staten_Island	 <- graph_one %>%
  filter(neighbourhood_group == "Staten Island") %>%
  group_by(room_type) %>%
  summarize(num_each_type = n())
filtered_Brooklyn <- na.omit(Staten_Island)










