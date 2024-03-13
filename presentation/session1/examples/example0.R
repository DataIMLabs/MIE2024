# ----------------------------------------------------------
# Filename: example0.R 
# ---------------------------------------------------------- 
#   Author: David Macro (david@dataim.nl)
#     Date: 2024-03-08
#  Purpose: 
# ----------------------------------------------------------
# 
#  
rm(list = ls())

library(bench.mark)

# Generate random data frame 
set.seed(123) 

df <- data.frame(
    Var1 = rnorm(1000),
    Var2 = runif(1000, min = 0, max = 100),
    Var3 = rnorm(1000, mean = 50, sd = 10),
    Var4 = rbinom(1000, size = 1, prob = 0.5),
    Var5 = rpois(1000, lambda = 3)
)
