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
library(ggplot2)

# Sample data
dt <- data.table(type   = c('Cat owners', 'Dog owners', 'No pets'), 
                 counts =  c(23, 17, 35)) 
 
p <- plot_ly(dt, x = ~type, 
                 y = ~counts, 
                type   = 'bar',
                marker = list(color = 'rgba(55, 128, 191, 0.6)',
                              line  = list(color = 'rgba(55, 128, 191, 1.0)', width = 1.5)
                )) %>% layout(
    title = list(text = ''),
    xaxis = list(title = 'User type'),
    yaxis = list(title = 'Aantal')
)

# Output plot by simply calling "p"
p
 

# Now for comparison, suppose we wanted to do this via ggplot2: 

# Create the ggplot2 plot
p <- ggplot(dt, aes(x = type, y = counts)) +
            geom_bar(stat = "identity", fill = 'rgba(55, 128, 191, 0.6)', color = 'rgba(55, 128, 191, 1.0)', size = 1.5) +
             labs(x = "User type", y = "Aantal", title = "") +
             theme_minimal()

# Display the plot
print(p)


# Show the plot
p