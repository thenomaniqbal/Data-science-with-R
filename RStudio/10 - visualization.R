# building interactive visuals for eda
# plot, barplot, hist, boxpot, ggplot, plotly
installed.packages("datasets")
plot(ChickWeight)

setwd("C:/Users/nomaniqbal/Documents/RStudio")
getwd()
diabetes<-read.csv("dataset/diabetes.csv")
diabetes
View(diabetes)
str(diabetes)
max(diabetes$Glucose)
min(diabetes$BloodPressure)
install.packages("ggplot2")
library("ggplot2")


ggplot(diabetes, aes(x=Outcome))+geom_bar()
ggplot(diabetes, aes(x=Outcome))+geom_density()

View(ChickWeight)

#base graphics
library(MASS)
plot(UScereal$sugars, UScereal$calories)
title("plot(UScereal$sugars, UScereal$calories)")

x <- UScereal$sugars
y <- UScereal$calories
library(grid)

#grid graphics
pushViewport(plotViewport())
pushViewport(dataViewport(x,y))
grid.rect()
grid.xaxis()
grid.yaxis()
grid.points(x,y)
grid.text("UScereal$sugars", x=unit(-3, 'lines'), rot=90)
grid.text("UScereal$calories", y=unit(-3, 'lines'), rot=0)
popViewport(2)


#piechart for different products and units sold
#create data for the graph
x<-c(33,45,70,110)
labels<-c('shop','gym', 'oil', 'shampo')
pie(x, labels, main = 'city pie chart', col = rainbow(length(x)))
piepercent<-round(100*x/sum(x),1)
pie(x, labels=piepercent, main = 'city pie chart', col = rainbow(length(x)))
legend('topright', c('soap', 'gym', 'oil', 'shampo'), cex = 0.8, fill = rainbow(length(x)))

#3-d piechart
library(plotrix)
x<-c(33,45,70,110)
lbl<-c('shop','gym', 'oil', 'shampo')
pie3D(x, labels=lbl, explode = 0.1, main = 'city pie chart')
