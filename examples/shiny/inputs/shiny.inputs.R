# ----------------------------------------------------------
# Filename: shiny.inputs.R 
# ---------------------------------------------------------- 
#   Author: David Macro (david@dataim.nl)
#     Date: 2024-03-24
#  Purpose: Example of Different Shiny Inputs and some
#           simple server logic
# ----------------------------------------------------------
# 
#  
rm(list = ls())

options(shiny.port = 17004)

library(shiny)
library(bslib)
library(plotly)
library(shinyWidgets)

table <- htmltools::tags$table
thead <- htmltools::tags$thead
tbody <- htmltools::tags$tbody
tr <- htmltools::tags$tr
td <- htmltools::tags$td
th <- htmltools::tags$th


ui <- bslib::page_sidebar( fillable = T,
    title =  "Shiny inputs",
    theme =  bslib::bs_theme(version = 5,  preset = "yeti"), 
    
    sidebar = bslib::sidebar(    
        
        # Core Shiny input examples
        textInput(inputId = "name", label = "Name", value = "John"),
        numericInput(inputId = "age", label = "Age", min = 18, max = 100, step = 1, value = 18),
        dateInput(  inputId = "date", label = "Date married"),
        
        # shinyWidgets examples
        shinyWidgets::numericRangeInput(inputId = "temperature", label = "Desired temperature (\u00B0C)", min = -40, max= 50,step = 1, value = c(15, 20)),
        shinyWidgets::pickerInput(inputId = "catowner", multiple = T,label = "Cat owner?", choices = list(`Yes` = "yes", `No` = "no")),
        shinyWidgets::checkboxGroupButtons(inputId = "music", label = "Music", choices = c("jazz", "metal", "classic"))
        
    ),
    card(fill = T, class = "m-0 p-0",
        card_header("Summarize input"), 
        card_body(
            uiOutput("summary")
        )   
    )  
) 

server <- function(input, output, session) {
    
    output$summary <- renderUI({
        
        table(class="table",
            thead(
                tr(
                    th(style="width: 200px; ", "Input"), 
                    th("Value")
                )
            ), 
            tbody(
                tr(
                    td("Name:"),
                    td(input$name)
                ), 
                tr(
                    td("Older than 30?"),
                    td(`if`(input$age > 30, "yes", "no"))
                ),
                tr(
                    td("Music styles"), 
                    td(paste0(input$music, collapse=", "))
                ), 
                tr(
                    td("Desired temperature"), 
                    td(paste0(input$temperature[[1]], "\u00B0C - ", input$temperature[[2]]), "\u00B0C"), 
                )
            )
        )
    })
     
} 


shinyApp(ui, server)