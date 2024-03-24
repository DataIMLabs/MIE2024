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

p.ggplot2 <- ggplot(dt, aes(x = "", y = counts, fill=type)) +
             geom_bar(stat = "identity") +
             coord_polar("y", start = 0) +
             labs(x = "User type", y = "Aantal", title = "") +
             theme_void() 
 
# Display the plot
print(p.ggplot2)


# Show the plot



