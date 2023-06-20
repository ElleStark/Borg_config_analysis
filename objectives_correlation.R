# Pairwise correlation comparisons to remove redundant objectives
# Elle Stark May 2023

library(tidyverse)
library(corrplot)
library(GGally)

######## Remove redundant (most correlated) objectives to reduce number for optimization 
obj_df <- read.csv('data/ignore/final_objectives.csv')
pairwise_plot <- ggpairs(obj_df)
obj_corr <- cor(obj_df, method = 'kendall')

obj_cor_plot <- corrplot(obj_corr, method = 'number', type = 'upper', order = 'hclust', 
                         tl.col = 'black', tl.srt = 45)

