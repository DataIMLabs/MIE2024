# ----------------------------------------------------------
# Filename: example.r.histogram.R
# ---------------------------------------------------------- 
#   Author: David Macro (david@dataim.nl)
#     Date: 2024-03-13
#  Purpose: Show examples on how to generate a simple 
#           histogram in R using various plot libraries
# ----------------------------------------------------------
# 
#  
rm(list = ls())

# Method 1: Base R
data <- rnorm(100) 

hist(data,
        main = "Histogram with Base R",
        xlab = "Values", 
        col  = "lightblue", 
        border = "black"
)

# Method 2: ggplot2
library(ggplot2)
data <- data.frame(Values = rnorm(100))

ggplot(data.frame(data), aes(x = Values)) +
    geom_histogram(binwidth = 0.5, fill = "lightblue", color = "black") +
    ggtitle("Histogram with ggplot2") +
    xlab("Values") +
    ylab("Frequency")

# Method 3: plotly
library(plotly)

plot_ly(data, 
    x    = ~Values, 
    type = "histogram", 
    marker = list(color = 'lightblue')
) %>% layout(
    title = "Histogram with Plotly",
    xaxis = list(title = "Values"),
    yaxis = list(title = "Frequency")
)

