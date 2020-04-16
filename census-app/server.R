# server.R
# Elias Brady Lab8
library(shiny) #just in case
# This is the most efficient location to put the code because 
# it is only run once
source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      data <- switch(input$var, 
                     "Percent White" = counties$white,
                     "Percent Black" = counties$black,
                     "Percent Hispanic" = counties$hispanic,
                     "Percent Asian" = counties$asian
      )
      
      #changes color when input is changed
      color <- switch(input$var, 
                      "Percent White" = "darkgreen",
                      "Percent Black" = "darkblue",
                      "Percent Hispanic" = "darkred",
                      "Percent Asian" = "darkturquoise"
      )
      
      #title for legend box
      legend <- switch(input$var, 
                       "Percent White" = "Percent White",
                       "Percent Black" = "Percent Black",
                       "Percent Hispanic" = "Percent Hispanic",
                       "Percent Asian" = "Percent Asian"
      )
      
      percent_map(data, color, legend, input$range[1], input$range[2])
      
    })
      
  }
)
    