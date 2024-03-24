library(plotly)
 

# Sample data
dt <- data.table(
    type = c('Cat owners', 'Dog owners', 'No pets'), 
    counts =  c(23, 17, 35)
) 
 
p <- plot_ly(dt, 
    x      = ~type, 
    y      = ~counts, 
    type   = 'bar',
    marker = list(
        color = 'rgba(55, 128, 191, 0.6)',
        line  = list(color = 'rgba(55, 128, 191, 1.0)', width = 1.5)
    )
) %>% layout(
    title = list(text = ''),
    xaxis = list(title = 'User type'),
    yaxis = list(title = 'Aantal')
)

p

# Show the plot
p