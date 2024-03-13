# ----------------------------------------------------------
# Filename: example1.R
# ----------------------------------------------------------
#   Author: David Macro (david@dataim.nl)
#     Date: 2024-03-08
#  Purpose: MIE Example 1 - úi vs Server
# ----------------------------------------------------------
#
#
rm(list = ls())

library(shiny)

# Define UI
ui <- fluidPage(
    titlePanel("Simple Shiny App"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("number", "Choose a number:", min = 1, max = 100, value = 50)
        ),
        mainPanel(   textOutput("result") )
    )
)

# Define server logic
server <- function(input, output) {
    output$result <- renderText({
        paste("You chose the number", input$number)
    })
}

# Run the app
shinyApp(ui = ui, server = server)
