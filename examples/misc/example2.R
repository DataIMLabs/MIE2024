library(shiny)
library(bslib)
library(shinyWidgets)
library(rlang)

# Define UI
ui <-  fluidPage(
    theme =  bs_theme(version = 5, bootswatch = "yeti"),
    bslib::card(style = "width: 500px; margin: 0 auto; margin-top: 10px;",
        bslib::card_body(
            textInput("expression", "", value = ""),
            bslib::layout_column_wrap(width = 1/3, 
                
                actionBttn("btn1", "1", style = "material-flat"),
                actionBttn("btn2", "2", style = "material-flat"),
                actionBttn("btn3", "3", style = "material-flat"),
                
                actionBttn("btn4", "4", style = "material-flat"),
                actionBttn("btn5", "5", style = "material-flat"),
                actionBttn("btn6", "6", style = "material-flat"),
                
                actionBttn("btn7", "7", style = "material-flat"),
                actionBttn("btn8", "8", style = "material-flat"),
                actionBttn("btn9", "9", style = "material-flat"),
            ),
            bslib::layout_column_wrap(width = 2,
                actionBttn(inputId = "add", "+", style = "material-flat"),
                actionBttn(inputId = "sub", "-", style = "material-flat"),
                actionBttn(inputId = "mul", "*", style = "material-flat"),
                actionBttn(inputId = "div", "/", style = "material-flat"),
                
                actionBttn("execute", "EXE", style = "material-flat"),
                actionBttn("clear",   "CLR", style = "material-flat")
            )
        ) 
    )
)


# Define server logic
server <- function(input, output, session) {
    
    observeEvent(input$execute, {
        safeExpression <- tryCatch({ 
            eval(parse(text = input$expression)
        )}, error = function(e){ "Error in expression" })
        
        updateTextInput(session, "expression", value = safeExpression)
    })
    
    buttons <- list(btn1 = 1, btn2 = 2, btn3 = 3, add = "+",
                    btn4 = 4, btn5 = 5, btn6 = 5, sub = "-",
                    btn7 = 7, btn8 = 8, btn9 = 9, mul = "*", div = "/")
    
    lapply(names(buttons), function(btn) {
        observeEvent(input[[btn]], {
            updateTextInput(session, "expression", value = paste0(input$expression, buttons[[btn]]))
        })
    })
    
    observeEvent(input$clear, {
        updateTextInput(session, "expression", value = "")
    })
}

# Run the app
shinyApp(ui = ui, server = server)
