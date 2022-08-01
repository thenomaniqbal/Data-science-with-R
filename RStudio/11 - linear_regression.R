setwd("C:/Users/nomaniqbal/Documents/RStudio")
getwd()
sales<-read.csv("dataset/50_Startups.csv")
sales
# View(sales)
summary(sales)
head(sales)
plot(sales)


#correlation
cor(sales)

# splitting the data into training and test data
set.seed(2)
install.packages('caTools')
library(caTools)
split <- sample.split(sales, SplitRatio=0.7)
split
train <- subset(sales, split='TRUE')
test <- subset(sales, split='FALSE')
train
test
# create the model
Model <- lm(Revenue~.,data = train)
summary(Model)

# prediction
pred <- predict(Model, test)
pred

# comparing predicted vs actual values
plot(pred, type = "l", lty =1.8, col="blue")
plot(test$Revenue, type ="l", lty = 1.8, col='red' )
lines(pred, type = 'l', col= 'blue')
plot(pred, type = 'l', lty = 1.8, col= 'blue')

# finding accuracy
rmse <-sqrt(mean(pred-sales$Revenue)^2)
rmse


# CARS DATA SET
cars<-read.csv("dataset/cars.csv")
head(cars)
str(cars)
plot(cars)
plot(cars$speed, cars$dist)
cor(cars)
cor(cars$speed, cars$dis)
linearMod<-lm(speed~dist, data=cars)
summary(linearMod)
set.seed(100)
TrainingRowIndex <- sample(1:nrow(cars), 0.8*nrow(cars))
TrainingData <-cars[TrainingRowIndex,]
TestData <-cars[-TrainingRowIndex,]
lmMod<- lm(dist ~ speed, data = TrainingData)
distPred <-predict(lmMod, TestData)
summary(lmMod)
actuals_predicts <-data.frame(cbind(actuals=TestData$dist, predicteds=distPred))
head(actuals_predicts)
correlation_accuracy <-cor(actuals_predicts)
correlation_accuracy

# error matrix
# DMwR::regr.eval(actuals_predicts$actuals, actuals_predicts$predicteds)


# BOSTON DATA
boston <- read.csv("dataset/boston.csv")
boston
summary(boston)
str(boston)

boston_results <- lm(formula = prices ~ ., data=boston)
boston_results
summary(boston_results)
