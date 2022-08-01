setwd("C:/Users/nomaniqbal/Documents/RStudio")
getwd()
mydata<-read.csv("dataset/utilities.csv")
head(mydata)
plot(mydata)
pairs(mydata)

# cleaning data
mydata<-(na.omit(mydata))
mydata


#scatter plot
plot(Fuel_Cost~Sales, mydata)
with(mydata, text(Fuel_Cost~Sales, labels=Company, pos=4, cex=.3))

plot(RoR~Sales, mydata)
with(mydata, text(RoR~Sales, labels=Company, pos=4, cex=.3))

###########################
#hierarcial clustering
hierar_clust <- dist(mydata, method = "euclidian")
hierar_clust
fit<-hclust(hierar_clust, method = "ward.D")
groups <- cutree(fit, k=3)
groups
my_data <- cbind(mydata, clusterNum=groups)
View(my_data)
plot(fit)
############################

#normalization
z <- mydata[,-c(1,1)]
m <- apply(z, 2, mean)
s <- apply(z, 2, sd)
z <- scale(z, m, s)



#calculate euclidean distance
distance <- dist(z)
distance
print(distance, digits = 2)

install.packages('cluster')
library(cluster)

#clustering dindogram
hc.l<-hclust(distance)
plot(hc.l)
plot(hc.l, labels = mydata$Company,  hang = -1)

#clustering dendogram(avg)
hc.l <- hclust(distance, method = "average")
plot(hc.l)
plot(hc.l, labels = mydata$Company,  hang = -1)

#clustering membership
member.1 <- cutree(hc.l, 3)
plot(member.1)
aggregate(z, list(member.1), mean)

#actual values
aggregate(mydata[, -c(1,1)], list(member.1), mean)
