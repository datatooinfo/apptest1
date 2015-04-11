# server.R

library("maps", lib.loc="~/R/win-library/3.1")
library("mapproj", lib.loc="~/R/win-library/3.1")
counties <- readRDS("c:/rWork/census-app/data/counties.rds")
source("c:/rWork/census-app/helpers.R")


shinyServer(
    function(input, output) {
        output$map <- renderPlot({
            args <- switch(input$var,
                           "Percent White" = list(counties$white, "darkgreen", "Percent White"),
                           "Percent Black" = list(counties$black, "black", "Percent Black"),
                           "Percent Hispanic" = list(counties$hispanic, "darkorange", "Percent Hispanic"),
                           "Percent Asian" = list(counties$asian, "darkviolet", "Percent Asian"))
            
            args$min <- input$range[1]
            args$max <- input$range[2]
            
            do.call(percent_map, args)
        })
    }
)