# RANDOM FORREST
#*********************************************#

install.packages('randomForest')
library(randomForest)
setwd("C:/Users/nomaniqbal/Documents/RStudio")
getwd()
data<-read.csv("dataset/winequalityN.csv")
head(data)

# converting into factor or categorical data
data$quality = as.factor(data$quality)
data_set_size = floor(nrow(data)*0.80)
index <- sample(1:nrow(data), size = data_set_size)
training <-data[index,]
testing <- data[-index,]

rf <- randomForest(quality~., data = training, mtry=4, ntree=2001, importance=TRUE, na.action=na.exclude)
rf

plot(rf)

result <- data.frame(testing$quality, predict(rf, testing[, 1:13], type = "response"))
head(result, 5)
result

plot(result)
