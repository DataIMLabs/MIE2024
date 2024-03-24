# ----------------------------------------------------------
# Filename: examples.R 
# ---------------------------------------------------------- 
#   Author: David Macro (david@dataim.nl)
#     Date: 2024-03-24
#  Purpose: Quick way to execute example scripts
# ----------------------------------------------------------
# 
#  


#' exampleBarcharts
#'
#' Show a Plotly and GGPlot2 implementation of a simple barchart
#' @return Opens a  Shiny app
#' @export
#'
#' @examples \dontrun{exampleBarcharts()}
exampleBarcharts <- function(){
    devtools::wd(".")
    shiny::runApp('examples/charting/barchart/barchart.compared.R')
}

#' examplePiecharts
#' 
#' Show a Plotly and GGPlot2 implementation of a simple barchart
#' @return Opens a  Shiny app
#' @export
#'
#' @examples \dontrun{examplePiecharts()}
examplePiecharts <- function(){
    devtools::wd(".")
    shiny::runApp('examples/charting/piechart/pierchart.compared.R')
    
}