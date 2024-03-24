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
 
 
plot_ly(dt,
    labels  = ~type, 
    values = ~counts, 
    type   = 'pie'
) 

 









