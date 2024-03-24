# ----------------------------------------------------------
# Filename: barchart.compared.R 
# ---------------------------------------------------------- 
#   Author: David Macro (david@dataim.nl)
#     Date: 2024-03-24
#  Purpose: 
# ----------------------------------------------------------
# 
#  
rm(list=ls())

library(data.table)
library(ggplot2)
library(plotly)
library(magrittr)
library(shiny)
library(bslib)

devtools::load_all()

# Sample data
dt <- data.table(type   = c('Cat owners', 'Dog owners', 'No pets'),  counts =  c(23, 17, 35)) 

code.plotly <- 'plot_ly(dt,
    labels  = ~type, 
    values = ~counts, 
    type   = "pie"
)   

'

code.ggplot2 <- 'ggplot(dt, aes(x = "", y = counts, fill=type)) +
    geom_bar(stat = "identity") +
    coord_polar("y", start = 0) +
    labs(x = "User type", y = "Aantal", title = "") +
    theme_void()
'

ui <- bslib::page_fixed( 
    theme =   bslib::bs_theme(version = 5, preset = "lumen", font_scale = NULL, spacer = "0.8rem" ),
    br(),
    bslib::layout_column_wrap(width = 1/2, heights_equal = "row",
        bslib::card(
            bslib::card_header(
                bslib::card_title("Interactive Plotly chart")
            ),
            bslib::card_body(
                plotlyOutput("plot.plotly") 
            )
        ),
        bslib::card(
            bslib::card_header(
                bslib::card_title("ggplot2 chart")
            ),
            bslib::card_body(
                shiny::plotOutput("plot.ggplot2")  
            )
        ),
        codeOutput("code.plotly" ),
        codeOutput("code.ggplot2")
    )
)

server <- function(input, output, session) {

    output$code.plotly <- renderCode({  code.plotly  }, delay = 500)
    output$code.ggplot2 <- renderCode({  code.ggplot2  }, delay = 500)
    
    output$plot.plotly <- plotly::renderPlotly({ 
       eval(parse(text = code.plotly))
    })
    
    output$plot.ggplot2 <- shiny::renderPlot({
        eval(parse(text = code.ggplot2))
    })    
}


shinyApp(ui, server)