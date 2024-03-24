# ----------------------------------------------------------
# Filename: examples.R 
# ---------------------------------------------------------- 
#   Author: David Macro (david@dataim.nl)
#     Date: 2024-03-24
#  Purpose: Quick way to execute example scripts
# ----------------------------------------------------------
# 
#  

ff.exampleBenchmark <- function(src){ 
    
    force(src)
    
    return(
        function(type = c("run", "view")){
            
            devtools::wd(".")
            
            type <- type[[1]]
            type <- match.arg(type, several.ok = F)
            
            if(type == "run"){
                source(src) 
                p
            } else {
                rstudioapi::navigateToFile(src)
            }  
        }
    ) 
} 

ff.exampleShiny <- function(src){ 
    
    force(src)
    
    return(
        function(type = c("run", "view")){
            
            devtools::wd(".")
            
            type <- type[[1]]
            type <- match.arg(type, several.ok = F)
            
            if(type == "run"){
                shiny::runApp(src)  
            } else {
                rstudioapi::navigateToFile(src)
            }  
        }
    ) 
} 


exampleShinyInputs        <- ff.exampleShiny(src = "examples/shiny/inputs/shiny.inputs.R")

#' exampleShinyCatMoneyHappy
#'
#' This example shows 
#' @param type "run" or "view" 
#' @return 
#' @export
#'
#' @examples \dontrun{exampleShinyCatMoneyHappy()}
exampleShinyCatMoneyHappy <- ff.exampleShiny(src = "examples/shiny/interactive/catmoneyhappy.R")


#' exampleBenchmarkGroupMeans
#'
#' This example shows the result of a benchmark between dplyr and data.table on comparing group means. 
#' See: examples/dh/dh.benchmark.groupmeans.R for a more detailed description
#' @return Show a Plotly plot of the benchmark'          
#' @export
#'
#' @examples \dontrun{exampleBenchmarkGroupMeans()}
exampleBenchmarkGroupMeans <- ff.exampleBenchmark(src = "examples/dh/dh.benchmark.groupmeans.R")
     
#' exampleBenchmarkSubsetting
#'
#' This example shows the result of a benchmark between dplyr and data.table on subsetting a large data set. 
#' See: examples/dh/dh.benchmark.subsetting.R for a more detailed description
#' @return Show a Plotly plot of the benchmark'          
#' @export
#'
#' @examples \dontrun{exampleBenchmarkSubsetting()}
exampleBenchmarkSubsetting <- ff.exampleBenchmark(src = "examples/dh/dh.benchmark.subsetting.R")

#' exampleBarcharts
#'
#' Show a Plotly and GGPlot2 implementation of a simple barchart
#' @return Opens a  Shiny app
#' @export
#'
#' @examples \dontrun{exampleBarcharts()}
exampleBarcharts <- ff.exampleShiny(src = "examples/charting/barchart/barchart.compared.R")

#' examplePiecharts
#' 
#' Show a Plotly and GGPlot2 implementation of a simple barchart
#' @return Opens a  Shiny app
#' @export
#'
#' @examples \dontrun{examplePiecharts()}
examplePiecharts <- ff.exampleShiny(src = "examples/charting/piechart/piechart.compared.R")
    
 

