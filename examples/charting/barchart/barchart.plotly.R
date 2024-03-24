# ----------------------------------------------------------
# Filename: plotly.barchart.R 
# ---------------------------------------------------------- 
#   Author: David Macro (david@dataim.nl)
#     Date: 2024-03-24
#  Purpose: Example code to generata plotly barchart
# ----------------------------------------------------------
# 
#  

rm(list=ls())
library(data.table)
library(plotly)
library(magrittr)

set.seed(1234)

# Sample data
dt <- data.table(type   = c('Cat owners', 'Dog owners', 'No pets'), 
                 counts =  c(23, 17, 35)) 
 
# Make sample plotly plot
p.plotly <- plot_ly(dt,
    x      = ~type, 
    y      = ~counts, 
    type   = 'bar',
    marker = list(
        color = 'rgba(55, 128, 191, 0.6)',
        line  = list(color = 'rgba(55, 128, 191, 1.0)', width = 1.5))
    ) %>% 
    layout(
        title = list(text = ''),
        xaxis = list(title = 'User type'),
        yaxis = list(title = 'Aantal')
    )

# Output plot by simply calling "p.plotly:"
p.plotly
 









