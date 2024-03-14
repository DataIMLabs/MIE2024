library(shiny)
library(bslib)
library(plotly)

ui <- bslib::page_fillable(
    
    theme =  bslib::bs_theme(version = 5, bootswatch = "darkly"),
    
    bslib::layout_column_wrap(width=1/2, 
        
        card(
            card_header("Card 1"), 
            card_body(  
                
            )   
        ),
        card(
            card_header("Card 2"), 
            card_body(  
                
            )   
        ),
        card(
            card_header("Card 3"), 
            card_body( 
                
            )   
        ),
        card(
            card_header("Card 4"), 
            card_body(
            
            )   
        ) 
    )
)


server <- function(input, output, session) {
    
   # bslib::bs_themer()
    
    output$test1 <- renderUI({
        
        htmltools::tags$table(
            htmltools::tags$thead(
                th(td("test"))
            )
        )
        
        
    })
    
}

shinyApp(ui, server)