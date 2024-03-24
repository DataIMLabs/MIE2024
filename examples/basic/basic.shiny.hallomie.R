library(shiny)

ui <- fluidPage(
    textOutput(outputId = "text")
)

server <- function(input, output, session) {
    
    output$text <- renderText({
        "Hallo MIE2024"
    })
}

shinyApp(ui, server) 