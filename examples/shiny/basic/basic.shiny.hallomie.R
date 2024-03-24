# ----------------------------------------------------------
# Filename: basic.shiny.hallomie.R 
# ---------------------------------------------------------- 
#   Author: David Macro (david@dataim.nl)
#     Date: 2024-03-24
#  Purpose: 
# ----------------------------------------------------------
# 
#  


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