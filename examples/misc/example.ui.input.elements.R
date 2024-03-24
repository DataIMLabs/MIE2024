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


ui <- bslib::page_sidebar( 
    theme =  bslib::bs_theme(version = 5, bootswatch = "darkly"), 
    
    sidebar = bslib::sidebar(    
        
        # Core Shiny input examples
        textInput(inputId = "name", label = "Name", value = "John"),
        numericInput(inputId = "age", label = "Age", min = 18, max = 100, step = 1, value = 18),
        dateInput(  inputId = "date", label = "Date married"),
        
        # shinyWidgets examples
        numericRangeInput(inputId = "happyrange", label = "Happyness", min = 1, max= 100, value = c(1, 100)),
        pickerInput(inputId = "catowner", multiple = T,label = "Cat owner?", choices = list(`Yes` = "yes", `No` = "no")),
        checkboxGroupButtons(inputId = "music", label = "Music", choices = c("jazz", "metal", "classic"))
        
    ),
    card(
        card_header("Summarize input"), 
        card_body(
            uiOutput("summary")
        )   
    )  
) 

server <- function(input, output, session) {
    
    bslib::bs_themer()
    
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
                )
            )
        )
    })
    
} 


shinyApp(ui, server)