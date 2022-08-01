# DECISION TREE
#*********************************************#
# entropy: 
# entropy is the measure of the messiness of your data
# the messier or more random your data, the higher will be the entropy
# carrot, radish, apple, oranges together

# information gain:
# information gain is the decrease obtained in entropy by splitting the 
# the data set based on some condition

# E1- is it coloured Orange 
# E2- is it round (leaf node)
# E1 > E2 , IG = E1 - E2

# ID3 algorithm - Rstudio IDE
install.packages("FSelector")
install.packages("rpart")
install.packages("stringi")
install.packages("caret", dependencies = TRUE)
install.packages("dplyr")
install.packages("rpart.plot")
install.packages("xlsx")
install.packages("data.tree")
install.packages("caTools")



library(FSelector)
library(rpart)
library(stringi)
library(caret)
library(dplyr)
library(rpart.plot)
library(xlsx)
library(data.tree)
library(caTools)


setwd("C:/Users/nomaniqbal/Documents/RStudio")
getwd()

df <- read.csv("dataset/ship.csv")
df <-select (df, Survived, Pclass, Sex, Age)
df <- mutate (df, Survived=factor(Survived), Pclass= as.numeric(Pclass), Age = as.numeric(Age) )
df

# splitting data

set.seed(123)
sample =sample.split(df$Survived, SplitRatio = .70)
sample
train = subset(df, sample == TRUE)
test = subset(df, sample == FALSE)
train
test

# training the decision tree classifier
tree <- rpart(Survived ~., data = train)
tree

# predictions
tree.Survived.predicted <- predict(tree, test, type = 'class')

#confusion matrix for evaluating the model 
confusionMatrix(tree.Survived.predicted, test$Survived)


# visualizing the decision tree
prp(tree)

# you can further visualize it into the 2D decision boundary

