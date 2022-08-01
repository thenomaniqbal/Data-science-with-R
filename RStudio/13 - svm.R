install.packages("RCurl")
library(RCurl)
UCI_data_URL <- getURL('https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data')
names <- c('id_number', 'diagnosis', 'radius_mean', 
           'texture_mean', 'perimeter_mean', 'area_mean', 
           'smoothness_mean', 'compactness_mean', 
           'concavity_mean','concave_points_mean', 
           'symmetry_mean', 'fractal_dimension_mean',
           'radius_se', 'texture_se', 'perimeter_se', 
           'area_se', 'smoothness_se', 'compactness_se', 
           'concavity_se', 'concave_points_se', 
           'symmetry_se', 'fractal_dimension_se', 
           'radius_worst', 'texture_worst', 
           'perimeter_worst', 'area_worst', 
           'smoothness_worst', 'compactness_worst', 
           'concavity_worst', 'concave_points_worst', 
           'symmetry_worst', 'fractal_dimension_worst')
breast_cancer <- read.table(textConnection(UCI_data_URL), sep = ',', col.names = names)

breast_cancer$id_number <- NULL
head(breast_cancer)
my.data <- data.frame(breast_cancer) 
my.data


#svm
#######################################################################################
install.packages("e1071")
library(e1071)
setwd("C:/Users/nomaniqbal/Documents/RStudio")
getwd()
data<-read.csv("dataset/weight-height.csv")
data
ishorse<-c(rep(-1,10),rep(+1,10))
my.data <- data.frame(Height=data['Height'],
                      Weight=data['Weight'],
                      animal=as.factor(ishorse))
my.data

plot(my.data[,-3], col=(3)/2, pch=19); abline(h=0,v=0,lty=3)
#perform svm by calling the svm and passing the parameters
svm.model <- svm(animal~., 
                 data = my.data,
                 type = 'C-classification',
                 kernal = 'linear',
                 scale = FALSE)
summary(svm.model)

#show the support vectors
points(my.data[svm.model$index, c(1,2)], col='orange', cex=2)

#get parameters of the hyperplane
w <- t(svm.model$coefs)%*%svm.model$SV
b <- svm.model$rho

#in this 2d case the hyperplane is the line w[1,1]*x1+w[1,2]*2+b=0
abline(a=-b/w[1,2], b=w[1,1]/w[1,2], col='blue', lty=3)
abline

#new data - mule, horse, mule
observations <- data.frame(Height=c(67,121,100), weight=c(121,190,100))
observations
# plot the new data
plot(my.data[,-3], col=(ishorse+3)/2, pch=19, xlim=c(0,10000), ylim=c(0,10000))
abline(h=0, v=0, lty=3)
points(observations[1,],col='green', pch=19)
points(observations[2,],col='blue', pch=19)
points(observations[3,],col='dark orange', pch=19)

abline(a=-b/w[1,2], b=-w[1,1]/w[1,2], col='blue', lty=3)

#verify the results
predicts(svm.model, observations)
