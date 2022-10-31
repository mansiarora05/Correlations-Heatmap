library(readr)
setwd("D:/ACRI/Catherine")
#getwd()

library("readxl")
cytokine_data <- read_excel ("Cytokine_CorrelationHeatmapData.xlsx")
View (cytokine_data)

#library("dplyr")


##### Combined - Responders and Non Responders #####

# Install and load reshape2 package
install.packages("reshape2")
library(reshape2)

#Creating matrix for correlations
corr_mat <- round (cor(cytokine_data),2)
head(corr_mat)

# reduce the size of correlation matrix
melted_corr_mat <- melt(corr_mat)
# head(melted_corr_mat)

# plotting the correlation heatmap
library(ggplot2)
ggplot(data = melted_corr_mat, aes(x=Var1, y=Var2,
                                   fill=value)) +
  geom_tile() + geom_text(aes(Var2, Var1, label = value),
                        color = "black", size = 4)


##### Responders #####

responders <- read_excel ("Responders.xlsx")

#Creating matrix for correlations
corr_mat_responders <- round (cor(responders),2)
head(corr_mat_responders)

# reduce the size of correlation matrix
melted_corr_mat_responders <- melt(corr_mat_responders)
# head(melted_corr_mat)

# plotting the correlation heatmap
library(ggplot2)
ggplot(data = melted_corr_mat_responders, aes(x=Var1, y=Var2,
                                   fill=value)) +
  geom_tile() + geom_text(aes(Var2, Var1, label = value),
                          color = "black", size = 4)



##### Non Responders #####

nonresponders <- read_excel ("Non Responders.xlsx")

#Creating matrix for correlations
corr_mat_nonresponders <- round (cor(nonresponders),2)
head(corr_mat_nonresponders)

# reduce the size of correlation matrix
melted_corr_mat_nonresponders <- melt(corr_mat_nonresponders)
# head(melted_corr_mat)

# plotting the correlation heatmap
library(ggplot2)
ggplot(data = melted_corr_mat_nonresponders, aes(x=Var1, y=Var2,
                                              fill=value)) +
  geom_tile() + geom_text(aes(Var2, Var1, label = value),
                          color = "black", size = 4)

