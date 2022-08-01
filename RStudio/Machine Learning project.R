# End-to-end Machine Learning project with R 
# 1. Get the data
# 2. Explore and visualize data for insights
# 3. Cleaning data for machine learning algorithms
# 4. Select and train model
# 5. Tune the parameters (if possible) for performance-enhancement
# 6. Present your findings and solutions
# 7. Create, launch and maintain a scalable system

# import necessary libary
library(MASS)
library(dplyr)
library(caret)
library(ggplot2)
library(rpart)
library(e1071)
library(leaps)

# I. Get the Data

# In this project, we will be using the 1990 California Housing Prices Dataset from the StatLib repository,
# this data set contains information such as population, median income, median housing price, and total rooms
# for each geographical unit under the US Census Bureau (each unit typically has a population of 600 to 3,000 people).

cal_housing <- read.csv("RStudio/CaliforniaHousing/housing.csv")

###############################################################################
# link <- "http://www.dcc.fc.up.pt/~ltorgo/Regression/cal_housing.tgz"
# download.file(link, destfile = "RStudio/cal_housing.tgz")
# untar("cal_housing.gz")
# cal_housing <- read.csv("RStudio/CaliforniaHousing/cal_housing.data")
# cal_housing
# domain <-read.csv("RStudio/CaliforniaHousing/cal_housing.domain")
# domain

# colnames(cal_housing)
# colnames(cal_housing)<- c('longitude',	'latitude',	'housing_median_age',	'total_rooms',	'total_bedrooms', 'population',	
#                          'households',	'median_income',	'median_house_value')
# head(cal_housing)

###############################################################################


# II. Explore and visualize data for insights:

#  At first, we can take a quick look at our dataset. A few handy functions that I found particular usefuls are:
# head()
# dim()
# str()
# summary()


head(cal_housing)

# column names
names(cal_housing)
colnames(cal_housing)

dim(cal_housing)
str(cal_housing)
summary(cal_housing) #very useful
summary(cal_housing$total_bedrooms)

# There are 20,640 entries in our dataset. This sounds a lot but is still pretty small for Machine Learning
# and especially Deep Learning standard. Notably, the total bed_rooms only have 20,433 
# entries with 207 missing entries. Dealing effectively with missing entries will be discussed later.



# All variables are numerical, except for '''ocean_proximity''', which is a factor.
# In R, factors are categorical variables that acts like dummy variable codes.
# We see that '''ocean_proximty''' is a factor with 5 levels. Namely:

print(cal_housing$ocean_proximity)
levels(cal_housing$ocean_proximity)

#converting into factors
cal_housing$ocean_proximity <- as.factor(cal_housing$ocean_proximity)
levels(cal_housing$ocean_proximity)
print(nlevels(cal_housing$ocean_proximity))

# Internally, R stores the integer values 1, 2, and 3, 4, 5and maps the character strings 
# (in alphabetical order, unless I reorder) to these values, i.e. 1=1H OCEAN, 2=INLAND, and 3=ISLAND, 
# etc. More specifically, R automatically converts any categorical variables stored as factor into 
# a series of dummy variables telling us whether an entries is a specific level (1) or not (0).

# plot numerical vars
cal_housing_num <- subset(cal_housing, select = -c(ocean_proximity))
par(mfrow= c(3,3))
invisible(lapply(names(cal_housing_num), function(col_name) truehist(cal_housing_num[,col_name], main = paste("Histogram of ", col_name), xlab = NA)))

# You can also plot the data to have a good feel of what each attributes look like. For example, 
# we can see than slightly over 800 districts have a median_house_value equal to about $500,000.

# More importantly, I hope you have recognizes some of the more important findings such as these:
#  1. Median income variable does not seem in US dollars. This is the good time to go back to the documentation of the dataset,
# and learn that this variable has been scaled and capped at 15.0001 for higher median incomes and 0.4999 for lower median incomes.
# 2. Housing median age and median house value are also capped. The later is more serious since it will be our dependent
# variable. Whatever Machine learning algorithms we come up with may learn that prices never go beyond that limit.
# This is a good time to contact your clients and see if this is a problem or not. If it is, there are two ways to go about it:
# a. Collect proper labels for these data
# b. Remove these districts from the training set and test set.
# 3. The variables seem to have different scale. We will discuss how to deal with this phenomenon later.


#Visualizing data is an art. Drawing histogram as we have done earlier is one way to do it. Depending on your dataset, 
# there can be many different ways to present our data in an insightful way. More often than not, a good representation
# of our dataset can uncover new insights and opens new channels for discovery and experimentation. In R, a very useful 
# tools for data visualization is ggplot. There are plenty of ggplot tutorial online so I'm not going to deep in the actual syntax.

# Back to our housing dataset, since we have geographical information such as latitude and longitude, 
# it is usually a good idea to draw a scatter plot to visualize our data.

# scatter plot with ggplots
g <- ggplot(cal_housing, aes(x = longitude, y = latitude, colour = median_income))
g+geom_point()+scale_color_distiller(palette = "Spectral")

# In the above plot, we have the radius of each circle represents the geographical unit's population and 
# the color represents the house price.

# Another technique we could use is to compute the standard correlation coefficient between our target variable 
# (median_house_price) and other variabels. In a nutshell, standard correlation coefficient measures the strength 
# and relationship between 2 variables. By pitching all other variables against median_house_price, we can see which 
# variables are strongly correlated to our target variables, thus, be useful for our prediction.
# Correlation of median_house_value against all other variables

cor(subset(cal_housing, select = -c(ocean_proximity)), use = "pairwise.complete.obs")[,"median_house_value"]
# The correlation ranges from -1 to 1. When it is close to 1, it means that there is a strong positive correlation. 
# When it is close to -1, there is a strong negative correlation. 0 means no linear correlation.

# We can see that there is a strong correlation between median house value and median income. Is it a coincidence that
# the houses of higher value usually belongs to those of higher income? Maybe.

# Now that we have gained some insights about the dataset (the distribution of income, correlations between variables, etc.),
# maybe it's the time for us to start thinking about applying models to our dataset? Not yet. Remember that our dataset is 
# still relatively messy, with missing values (total_bedrooms), categorical variables, etc.. This brings us to the next step,
# Data Cleaning (Data Wrangling) which usually takes up 70-80% of the time people spend on each data science project. 
# The second part of the series will show you how to approach this step methodologically and effective. 

# III. Prepare data for Machine Learning algorithms:

# Fortunately, our dataset was relatively clean to deal with. We already saw several issues:
# Missing data
# Entries that does not represent actual values
# Some variables are in the form of factor
# Variables are of different scales

# We can see it right in our data: the total number of rooms range from 6 to 39,320 while median income ranges from 0 to 15. 
# Thus, we usually scale them by a method called standardization to minimize the effect scale may have on our algorithms.
# In general, depending on the nature of the dataset, We may need to do several steps:
#  Deal with missing data
# Create some extra numerical data that can be useful for prediction
# Make sure that categorical data is in the form of factor
# Standardize the all the column
# Creating training set and test set

# a. Dealing with misisng data
# There are several ways we can deal with missing data, we can either:

# Method 1: delete the column
# cal_housing <- subset(cal_housing, select = -c(total_bedroom)) 

# or:

# Method 2: remove the missing NA
cal_housing_1 <- cal_housing[complete.cases(cal_housing),]
dim (cal_housing_1)
# before 20640    10
# we see that 207 rows with misssing values have been removed

# or:

# Method 3: impute missing NAs with median
cal_housing$total_bedrooms[is.na(cal_housing$total_bedrooms)] <- median(cal_housing$total_bedrooms, na.rm=TRUE)
summary(cal_housing$total_bedrooms)

# In option 3, we can see that I compute the median value on the dataset and impute the missing value of by this median. 
# You can also use other value to impute the missing values, e.g: mean, but usually median is chosen as a good representation
# of the variables. The nice thing about this option is that you do not have to remove 
#any data entries, which could be valuable in a small dataset. Let's stick with this method in this project

# b. Other cleaning taks:

# That's one task out of the way! We still need to remove the entries whose median_house_value exceeds $500,000, 
# create some new useful (hopefully) variables, making sure that our categorical variables are in factor form, and 
# perform feature scaling.
# A very useful tools that can be used for these tasks are dplyr with piping techniques. Again, without going too 
# much into the details, here is how the entire data transforming pipeline is effectively and succintly coded using dplyr.
# Here, you can see that I have:
# Removed entries whose median_house_value >= 500,000
# Created two predictors: rooms per house and population per house
# Made sure that ocean_proximity is encoded as a factor
# Scaled all numerical variables using standardization techniques as explained

cal_housing <- cal_housing %>%
  filter(median_house_value < 500000) %>%
  mutate(rooms_per_house = total_rooms / households) %>%
  mutate(population_per_house = population / households) %>%
  mutate(ocean_proximity = as.factor(ocean_proximity)) %>%
  mutate_at(vars(-ocean_proximity, -median_house_value, -median_income), list(scale)) %>%
  data.matrix %>% data.frame 
head(cal_housing)

# c. Split to training set and test set:

# random sampling
set.seed(365)
train_id <- sample(nrow(cal_housing), size = 0.8*nrow(cal_housing))
train_set <- cal_housing[train_id,]
test_set <- cal_housing[-train_id,]
print (paste(nrow(train_set), "train +", nrow(test_set), "test"))

# This purely random sampling method is generally fine if we have a large dataset, but if it is not, you run the
# risk of introducing significant sampling bias. In short, it is the phenomenon when the sample is not represetative
# of the actual population. We want to guarantee that the test set is representative of the population.
# this is called stratified sampling.
# What does it mean for our dataset? Let's say that we think median income is a very important attribute to predict median housing prices. We want to ensure that 
# the test set is representatiuve of the various categories of incomes in the whole dataset (that mean, we should have the same 
# representation of the 0.1%, 1%, 10% richest - Ok, we are not going into that much details though). Since our median income 
# is continuous variable, we have to convert them into categorical variables of different levels (I choose 5 levels of income)
# and perform stratified sampling to create the test set. This can be easily done with the caret package in R.

#Convert median income into categorical variables with 5 levels

# stratified sampling
par(mfrow = c(1,2))
truehist(cal_housing[,"median_income"], main = paste("Histogram of median income"), xlab = NA)
cal_housing <- cal_housing %>% 
  mutate(income_level = ceiling(median_income/2)) %>%
  mutate(income_level = factor(ifelse(income_level >= 5, 5, income_level))) %>%
  select(-median_income)
plot(cal_housing$income_level, main = paste("Bar plot of income level"), xlab = NA)	

train_str_id <- createDataPartition(cal_housing$income_level, p =.8,
                                    list = FALSE, times = 1)
train_str <- cal_housing[train_str_id,]
test_str <- cal_housing[-train_str_id,]

# We can compare the performance of stratified sampling and random sampling by seeing how well each method
# represents the distribution of income level in the overall data set ('overall' column):


# test to see if we achieve stratified sampling
table(cal_housing$income_level) / nrow(cal_housing)
table(train_str$income_level) / nrow(train_str)

# The table compares the income category proportions in the overall dataset, in the test set generated
# with stratified sampling and in a test set generated by random sampling. We can see that the stratified 
# sampling generated test set has income category  proportions almost identical to those of the dataset,
# compared to the skewedness of the test set generated by random sampling

# IV. Fit models on the dataset:
# Now that you have got the data, explored and visualized it, transformed it appropriately and divided it into a 
# training set and a test set, it becomes a lot easier to select and train your Machine Learning Algorithms.

# Let's start with a fairly straightforward method: simple linear regression.

 model_lm <- lm(median_house_value~., train_str)
 model_lm

# Let's see how our model performs when we apply on our training set and predict it again. A way to measure the
# perform of this regression task is to use a metric called Root-mean-square-error (RMSE). It is a frequently used
# measure of the differences between values (sample and population values) predicted by a model or an estimator and 
# the values actually observed. The RMSE represents the sample standard deviation of the differences between predicted 
# values and observed values. These individual differences are called residuals when the calculations are performed over 
# the data sample that was used for estimation, and are called prediction errors when computed out-of-sample.
 
# We can calculate the RMSE metric as follows:  
 predict_lm_train <- predict(model_lm, train_str)
 sqrt(mean((train_str$median_house_value - predict_lm_train)^2)) #square root of sum of differences

# It works, but not amazingly. To put in context, a RMSE error of 63450.96 means that on average, the prediction error is 
# around $63,450. If we go back to our dataset and notice how the median_housing_value mostly ranges from $200,000 to $500,000,
# prediction error could account to up to 30% of the actual value. This is called underfitting, where the predictors does not 
# provide enough information or the algorithm is not powerful enough (which is likely to be the case here).
 
# There are a couple of ways we can proceed:
   
# We can feed better predictors (which is usually impossible)
# We can develop our algorithms. For linear regression specifically, this could means including interactions,
# higher-order predictors, etc. (There is a huge literature on these methods)
# We could try different models
# For the purpose of this example, let us try different algorithms and see how it perform.
# I choose Decision Tree and Support Vector Machine Regression, both are very powerful and capable
# of detecting complex patterns in our dataset.  
 
# Decision tree model
library(rpart)
model_decision_tree <- rpart(median_house_value~.,data = train_str, method = "anova", control = rpart.control(minsplit = 2, cp=0.001))
#make prediction						
predict_decision_tree <- predict(model_decision_tree, train_str)
#calculate RMSE error
sqrt(mean((train_str$median_house_value - predict_decision_tree)^2))

# Support Vector Machine Regression model
library(e1071)
model_svm <- svm(median_house_value~.,data = train_str, cost = 10)
predict_svm <- predict(model_svm, train_str)
sqrt(mean((train_str$median_house_value - predict_svm)^2))

# That looks good, using the Decision tree regression model and Support vector machine, we can reduce the internal 
# residuals down to $53,320 and $50,342 respectively, significantly improving from the simple linear regression model
# in nominal value.

# In fact, the two models perform well that we may run the risk of overfitting the data, which means that the algorithms
# learn so many features unique to the training set that it performs badly to new dataset.

# How can we assess overfitting of a model, there are generally 2 methods:

# Test on the test_set (we usually don't want to touch the test set until we have a model ready to launch)
# k-fold Cross-validation (Sounds fancy, what is it?)

# What is k-fold cross-validation?
# Cross-validation is a technique to evaluate predictive models by partitioning the original sample into a training set to train the model, 
# and a test set to evaluate it (sounds familiar, yes, it does borrow the idea from partitioning dataset into training/test set)

# In k-fold cross-validation, the original sample is randomly partitioned into k equal size subsamples. Of the k subsamples, a single subsample
# is retained as the validation data for testing the model, and the remaining k-1 subsamples are used as training data. 
# The cross-validation process is then repeated k times (the folds), with each of the k subsamples used exactly once as the validation data. 
# The k results from the folds can then be averaged (or otherwise combined) to produce a single estimation. The advantage of this method is that
# all observations are used for both training and validation, and each observation is used for validation exactly once.

# Sounds straightforward enough, let's perform a 10-fold cross validation technique to objectively assess the power of our 3 algorithms:

# randomly shuffle your data	
cal_housing_copy <- cal_housing[sample(nrow(cal_housing)),]
head(cal_housing_copy)

#Create 10 equally size folds
folds <- cut(seq(1,nrow(cal_housing_copy)),breaks=10,labels=FALSE)
head(folds)

#Perform 10 fold cross validation
MSE_lm <- 0
MSE_tree <- 0
MSE_svm <- 0

for(i in 1:10){
  #Segement your data by fold using the which() function 
  testIndexes <- which(folds==i,arr.ind=TRUE)
  testData <- cal_housing_copy[testIndexes, ]
  trainData <- cal_housing_copy[-testIndexes, ]
  
  # fit in the models
  lm_model <- lm(median_house_value~., trainData)
  tree_model <- rpart(median_house_value~.,data = trainData, method = "anova",
                      control = rpart.control(minsplit = 2, cp = 0.001))
  svm_model <- svm(median_house_value~.,data = trainData, cost = 10)
  
  # make predictions
  predict1 <- predict(lm_model, testData)
  predict2 <- predict (tree_model, testData)
  predict3 <- predict(svm_model, testData)
  
  #update MSE
  MSE_lm <- MSE_lm + sum(folds == i)/nrow(cal_housing_copy) * mean((predict1 - testData$median_house_value)^2)
  MSE_tree <- MSE_tree + sum(folds == i)/nrow(cal_housing_copy) * mean((predict2 - testData$median_house_value)^2)
  MSE_svm <- MSE_svm + sum(folds == i)/nrow(cal_housing_copy) * mean((predict3 - testData$median_house_value)^2)
  
}

sqrt(MSE_lm)

sqrt(MSE_tree)

sqrt(MSE_svm)

# So our performace using this technique is generally good, although not as great as when we only use the 
# training set to evaluate the model.

# V. Fine tuning our model:
# Now that we have some promising models, we can enhance their performance by fine-tuning the hyperparameters 
# associated with each model. From a technical standpoint, there are many ways you can do this:
  
# 1. Just play around the hyperparameters, change them, each time repeating the same process we have done above to 
# come up with a model with good performance. This is a lot of tedious work. Let's think about Decision Tree 
# Regression. Let's say you want to play around with the two hyperparameters: minsplit and cp, each of which you 
# have 4 candidates to try out. This means a combination of 16 different 'models'. That's a lot of manual coding to do.

# 2. Ask a R package to find a good combination of the hyperparameters for us. All you have to do is to tell R what 
# hyperparamters you want to try and what value to try out, and it will automatically compute all the hyperparameters
# and choose the best model. This is called Grid Search and the R package e1076 does just that.

# Caveat: Tuning can take a really really long time to run (depending on your resources and algorithm). The code below only experiment 16 combinations for Decision trees and 12 combinations for Support Vector Machine and it still takes 13 hours for my poor CORE I5, 2GB RAM HP to compute. Lesson: get a good laptop or GPU if you want to do some serious machine learning work.

# Advise: To do well in fine-tuning, it is important that you know what each hyperparameter does and set a range to try out appropriately. This means that it is in general very important to understand the mechanism behind each algorithms and what roles does each hyperparameters play. You can get away with treating ML algorithms as a blackbox and playing around but in the long run, you won't get really far with Machine Learning.

# First, we try a set of parameters for Decision tree model. I decided to search through 2 hyperparameters: 
# minsplit (5 different values) and cp (5 different values). This makes a total of 25 iterations of training and
# we will get the model that performs the best out of these 25 iterations.

#applying grid search
tuneResult1 <- tune.rpart(median_house_value~., data = train_str, minsplit = c(5,10,15, 20), cp = c(0.1,0.01,0.001,0.0001))
tune_tree <- tuneResult1$best.model #get the best model

#find RMSE value of the best model
predict_tree <- predict(tune_tree, train_str) 
sqrt(mean((train_str$median_house_value - predict_tree)^2))

# Let's try applying Grid search to SVM Regression. Here, I searched through 2 parameters: cost
# (4 different values) and gamma (3 different values), making a total of 12 iterations of training

#applying grid search
tuneResult2 <- tune.svm(median_house_value ~., data = train_str, cost=10^(-1:2), gamma=c(0.1,0,1))
tune_svm <- tuneResult2$best.model #get best model

#find RMSE of the best model
predict_svm <- predict (tune_svm, train_str)
sqrt(mean((train_str$median_house_value - predict_svm)^2))

# That's impressive, we managed to further reduce RMSE of Decision Tree and SVM Regression to 40,282
# and 44,399 respectively by fine-tuning the hyperpameters. 
# Notice that this is up to 20,000 or 30% improvement from our naive linear regression model.