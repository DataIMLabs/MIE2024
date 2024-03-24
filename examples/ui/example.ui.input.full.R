library(shiny)
library(bslib)
library(plotly)

table <- htmltools::tags$table
thead <- htmltools::tags$thead
tbody <- htmltools::tags$tbody
tr <- htmltools::tags$tr
td <- htmltools::tags$td
th <- htmltools::tags$th

vals.happy <- list(`Happyness` = "happy", `Money` = "money")


ui <- bslib::page_sidebar( 
    theme =  bslib::bs_theme(version = 5, bootswatch = "yeti"), 
    
    sidebar = bslib::sidebar(    
        shinyWidgets::pickerInput(inputId = "variable", 
            label = "Variable", 
            choices = vals.happy
        ),
        shinyWidgets::pickerInput(inputId = "catowner", multiple = T,
            label = "Cat owner?", 
            choices = list(`Yes` = "yes", `No` = "no")
        ),
        shinyWidgets::numericRangeInput(inputId = "happyrange", 
            label = "Happyness", min = 1, max= 100, value = c(1, 100)
        )   
    ),
    card(
        card_header(
            textOutput("header")
        ), 
        card_body(plotlyOutput("plot"))   
    )  
)
 


server <- function(input, output, session) {
    
    n <- 1000
     
    output$header <- renderText({
        
        title <- setNames(nm = names(vals.happy)) %>% setNames(vals.happy)
             
        paste0("Grafiek van ", title[[input$variable]], collapse = "");
        
    })
     
    # Generate some random data on the fly
    data <- data.table::data.table( 
        HASCAT  = factor(sample(x = c("yes", "no"), size=  n, replace = T), levels = c("yes", "no"))
    )[, `:=`(  
        money = runif(n, 20, 100) - 10 * (HASCAT == "yes"), 
        happy = rnorm(n, 40, 30)  + 10 * (HASCAT == "yes")
    )]
    
    data.filtered <- reactive({
        
     
        if(!is.null(input$catowner)){
            data[HASCAT %in% input$catowner, ]    
        } else {
            data
        }
        
        
    })
    
    output$plot <- renderPlotly({ 
          
        # Quick summary table using data.table
        summaries <- data.filtered()[, list( M = mean(get(input$variable))), by = list(HASCAT)]
        
        # Generate plot
        plot_ly(summaries,  
            x      = ~HASCAT,  
            y      = ~M, 
            type   = "bar", 
            marker = list(color = 'lightblue')
        ) %>% layout( 
                xaxis = list(title = "Values"),
                yaxis = list(title = "Frequency")
        ) 
    })  
} 


shinyApp(ui, server)