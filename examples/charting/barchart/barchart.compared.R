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

# Sample data
dt <- data.table(type   = c('Cat owners', 'Dog owners', 'No pets'),  counts =  c(23, 17, 35)) 
 

code.plotly <- "# Plotly
plot_ly(dt,
    x      = ~type, 
    y      = ~counts, 
    type   = 'bar',
    marker = list(
        color = 'rgba(55, 128, 191, 0.6)',
        line  = list(
            color = 'rgba(55, 128, 191, 1.0)', 
            width = 1.5)
        )
) %>% 
layout(title = list(text = ''),
   xaxis = list(title = 'User type'),
   yaxis = list(title = 'Aantal')
)
"

code.ggplot2 <- "# ggplot2
ggplot(dt, aes(x = type, y = counts)) +
geom_bar(
    stat  = 'identity', 
    fill  = '#377CBF', 
    color = '#377CBF',
    size  = 1.5,
    alpha = 0.6
) +  
 labs(
    x     = 'User type',
    y     = 'Aantal',
    title = ''
) +
theme_minimal()


"

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