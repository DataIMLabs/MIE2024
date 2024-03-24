library(shiny)
library(bslib)
library(plotly)

table <- htmltools::tags$table
thead <- htmltools::tags$thead
tbody <- htmltools::tags$tbody
tr <- htmltools::tags$tr
td <- htmltools::tags$td
th <- htmltools::tags$th


ui <- bslib::page_fillable(
    
    theme =  bslib::bs_theme(version = 5, bootswatch = "darkly"),
    
    bslib::layout_column_wrap(width=1/2, 
        
        card(
            card_header("Plotly Chart"), 
            card_body(
                plotlyOutput("plot")
            )   
        ), 
        card(
            card_header("Table"), 
            card_body( 
                tableOutput("table")    
            )   
        ), 
        card(
            card_header("Text"), 
            card_body(  
                textOutput("text")    
            )   
        ), 
        card(
            card_header("HTML"), 
            card_body( 
                shiny::uiOutput("html")    
            )   
        ) 
    )
)


server <- function(input, output, session) {
    
    #bslib::bs_themer()
  
    data <- data.table::data.table( 
        HASCAT  = factor(sample(x = c("yes", "no"), size=  100, replace = T), levels = c("yes", "no"))
    )[, `:=`( 
        money = runif(100, 20, 100) - 10 * (HASCAT == "yes"),
        happy = runif(100, 1, 100)  + 10 * (HASCAT == "yes")
    )]
    
    output$plot <- renderPlotly({ 
        plot_ly(data, 
                    x    = ~money, 
                    type = "histogram", 
                    marker = list(color = 'lightblue')
        ) %>% 
        layout( 
            xaxis = list(title = "Values"),
            yaxis = list(title = "Frequency")
        ) 
    })
    
    output$table <- renderTable({ 
        data[, list(
            `Mean wealth`     = mean(money, na.rm = T),  
            `Mean happyness`  = mean(happy, na.rm = T)   
        ), by = list(`Cat owner` = HASCAT)]
    })
    
    output$text <- renderText({  
        date <- format(Sys.Date(), "%d %b %Y") 
        text <- glue::glue("Today is {date}") 
        text 
    })
    
    output$html <- renderUI({ 
        tagList(
            bslib::accordion(multiple = T, 
                bslib::accordion_panel(title = "Element 1", 
                    bslib::card(
                        "Content"
                    )
                ),
                bslib::accordion_panel(title = "Element 2", 
                    bslib::card(
                        "Content"    
                    )
                )
            )
        ) 
    })
    
}

shinyApp(ui, server)