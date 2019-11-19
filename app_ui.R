
library("shiny")
library("lintr")
library("dplyr")
library("ggplot2")

df <- read.csv("AB_NYC_2019.csv", stringsAsFactors = F)

# Data wrangling space #

# For Map
unique_neighborhood <- unique(df$neighbourhood_group)
unique_type <- unique(df$room_type)
bar_data <- data.frame(df$neighbourhood_group, df$room_type) %>%
  
rbind(bar_data)

# Shiny User Interface #
ui <- fluidPage(
  titlePanel("graph1"),
  
  sidebarLayout(
    sidebarPanel(
      
      checkboxGroupInput("checkGroup", label = h3("Checkbox group"), 
                         choices = list("Brooklyn" = 1, "Manhattan" = 2, 
                                        "Bronx" = 3, "Queens" = 4, "Staten_Island" = 5),
                         selected = 1),
      
      
      hr(),
      fluidRow(column(5), verbatimTextOutput("value"))) 
    ),
    mainPanel(
      plotOutput("bar_plot")
    )
  )
)
  