# ----------------------------------------------------------
# Filename: barchart.ggplot2.R 
# ---------------------------------------------------------- 
#   Author: David Macro (david@dataim.nl)
#     Date: 2024-03-24
#  Purpose: 
# ----------------------------------------------------------
# 

rm(list=ls())
library(data.table)
library(ggplot2)

set.seed(1234)

# Sample data
dt <- data.table(type   = c('Cat owners', 'Dog owners', 'No pets'), 
    counts =  c(23, 17, 35)) 

# Now for comparison, suppose we wanted to do this via ggplot2: 

p.ggplot2 <- ggplot(dt, aes(x = type, y = counts)) +
             geom_bar(stat = "identity", fill = '#377CBF', color = '#377CBF', size = 1.5, alpha = 0.6) + # Adjusted fill and added alpha
    labs(x = "User type", y = "Aantal", title = "") +
    theme_minimal()

# Display the plot
print(p.ggplot2)


# Show the plot



