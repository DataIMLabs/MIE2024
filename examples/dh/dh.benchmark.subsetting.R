# ----------------------------------------------------------
# Filename: dh.benchmark.subsetting.R 
# ---------------------------------------------------------- 
#   Author: David Macro (david@dataim.nl)
#     Date: 2024-03-24
#  Purpose:  
# ---------------------------------------------------------- 

rm(list=ls())

library(data.table)
library(dplyr)
library(bench)
library(plotly)

cat("- Creating a large dataset with 10 million rows \r\n")

set.seed(123)
n <- 1e7

df <- data.frame(
    id    = 1:n,
    group = sample(letters[1:5], n, replace = TRUE),
    value = rnorm(n)
)

cat("- Converting the dataset to a data.table and tibble for comparison \r\n")
dt <- as.data.table(df)
tb <- as_tibble(df)

cat("- Benchmarking data.table vs dplyr for filtering and summarizing \r\n")
benchmark.subsetting <- bench::mark(
    data.table = {
        dt[group == "a", .(mean_value = mean(value))]
    },
    dplyr = {
        tb %>%
            filter(group == "a") %>%
            summarise(mean_value = mean(value))
    },
    check = FALSE, iterations = 30
) 

cat("- Generating the benchmark plot \r\n")

p <- plotly::ggplotly(plot(benchmark.subsetting), margins = c(10,10,10,10)) %>% 
     plotly::layout(title = list(text = "\r\n\r\nBenchmark subsetting"))

cat("- Displaying the benchmark plot \r\n")

p





