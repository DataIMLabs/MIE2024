# ----------------------------------------------------------
# Filename: dh.benchmark.R 
# ---------------------------------------------------------- 
#   Author: David Macro (david@dataim.nl)
#     Date: 2024-03-24
#  Purpose: Show example of how to benchmark data
# ----------------------------------------------------------
# 
rm(list=ls())

library(data.table)
library(dplyr)
library(bench)
library(plotly)

# Creating a large dataset with 10 million rows
set.seed(123)
n <- 1e7

df <- data.frame(
    id    = 1:n,
    group = sample(letters[1:5], n, replace = TRUE),
    value = rnorm(n)
)

# Converting the dataset to a data.table and tibble for comparison
dt <- as.data.table(df)
tb <- as_tibble(df)

# Benchmarking data.table vs dplyr for filtering and summarizing
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

benchmark.groupmeans <- bench::mark( 
    data.table = {
        dt[, .(
            gmean = mean(value), 
            diff  = value - mean(value)
        ), by = group]
    }, 
    dplyr = {
        df_with_diff <- df %>%
          group_by(group) %>%
          mutate(
            mean_value = mean(value),  
            diff = value - mean_value  
          ) %>%
          ungroup()        
    },
    check = FALSE, iterations = 30
 
) 

plotly::ggplotly(plot(benchmark.groupmeans))


 



