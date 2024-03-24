# ----------------------------------------------------------
# Filename: examples.R 
# ---------------------------------------------------------- 
#   Author: David Macro (david@dataim.nl)
#     Date: 2024-03-24
#  Purpose: Quick way to execute example scripts
# ----------------------------------------------------------
# 
#  

#' exampleBenchmarkGroupMeans
#'
#' This example shows the result of a benchmark between dplyr and data.table on comparing group means. 
#' See: examples/dh/dh.benchmark.groupmeans.R for a more detailed description
#' @return Show a Plotly plot of the benchmark'          
#' @export
#'
#' @examples \dontrun{exampleBenchmarkGroupMeans()}
exampleBenchmarkGroupMeans<- function(){
    devtools::wd(".")
    source("examples/dh/dh.benchmark.groupmeans.R")
    p
}

#' exampleBenchmarkSubsetting
#'
#' This example shows the result of a benchmark between dplyr and data.table on subsetting a large data set. 
#' See: examples/dh/dh.benchmark.subsetting.R for a more detailed description
#' @return Show a Plotly plot of the benchmark'          
#' @export
#'
#' @examples \dontrun{exampleBenchmarkSubsetting()}
exampleBenchmarkSubsetting<- function(){
    devtools::wd(".")
    source("examples/dh/dh.benchmark.subsetting.R")
    p
}



#' exampleBarcharts
#'
#' Show a Plotly and GGPlot2 implementation of a simple barchart
#' @return Opens a  Shiny app
#' @export
#'
#' @examples \dontrun{exampleBarcharts()}
exampleBarcharts <- function(type = c("run", "view")){
    
    devtools::wd(".")
    
    type <- type[[1]]
    type <- match.arg(type, several.ok = F)
    
    src <- "examples/charting/barchart/barchart.compared.R"
    
    if(type == "run"){
        shiny::runApp(src)    
    } else {
        rstudioapi::navigateToFile(src)
    } 
}

#' examplePiecharts
#' 
#' Show a Plotly and GGPlot2 implementation of a simple barchart
#' @return Opens a  Shiny app
#' @export
#'
#' @examples \dontrun{examplePiecharts()}
examplePiecharts <- function(type = c("run", "view")){
    
    devtools::wd(".")
    
    type <- type[[1]]
    type <- match.arg(type, several.ok = F)
    
    src <- "examples/charting/piechart/piechart.compared.R"
    
    if(type == "run"){
        shiny::runApp(src)    
    } else {
        rstudioapi::navigateToFile(src)
    }
     
    
}

