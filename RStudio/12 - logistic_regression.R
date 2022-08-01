# LOGISTIC REGRESSION
#*********************************************#

# Define the problem
# load the liabraries
# acquire the data
# ingest the data
# EDA
# munge the data
# prepare the data
# scale the data
# split the data
# train the model
# test the model
# validate the model - accuracy, precision
library(caTools)
getwd()
mydata <- read.csv("http://www.karlin.mff.cuni.cz/~pesta/prednasky/NMFM404/Data/binary.csv")
head(mydata)
split <- sample.split(mydata, SplitRatio = 0.8)
split
train <- subset(mydata, split="TRUE")
test <- subset(mydata, split="FALSE")

# munge the data
# these are really categorical variables so lets tell R to convert them to factors
mydata$admit <- as.factor(mydata$admit)
mydata$rank <- as.factor(mydata$rank)

# train the model using the training data
# use glm, the general linear model function
# dependent variable is admit: independent variables are gpa and rank

mymodel <-glm(admit~gpa+rank, data=train, family="binomial")
summary(mymodel)


# run the test data through the model
res <- predict(mymodel, test, type='response')
res
res <- predict(mymodel, train, type='response')
res

# validate the model, confusion matrix
confmatrix <- table(Actual_value=train$admit, predicted_value=res>0.5)
confmatrix

# accuracy
(confmatrix[[1,1]]+confmatrix[[2,2]])/sum(confmatrix)