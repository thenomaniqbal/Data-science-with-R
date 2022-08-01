# data manipulation in r
# the dplyr package is used to transform and summarize
# tabular data with rows and columns
# select, filter, sort, arrange, summary, mutate


library(dplyr)
library(nycflights13)
View(flights)
head(flights)

# subset data set using filter
f1 <- filter(flights, month==07)
View(f1)
f2 <- filter(flights, month==07, day==3)
View(f2)

#slice()allows us to select rows by position
slice(flights, 1:5)

#mutate is used to add new column
over_delay <- mutate(flights, overall_delay=arr_delay-dep_delay)
head(over_delay)

#transute() function is used to show only new column
over_delay<-transmute(flights, overall_delay=arr_delay-dep_delay)
View(over_delay)

#summarise() used to find descriptive statistics
summarise(flights, avg_air_time=mean(air_time, na.rm=T))
summarise(flights, avg_air_time=sum(air_time, na.rm=T))
summarise(flights, avg_air_time=mean(air_time, na.rm=T), tot_air_time=sum(air_time, na.rm=T))

#group by calculation using group_by()

#example 1:
head(mtcars)
by_gear<-mtcars%>% group_by(gear)
by_gear
View(by_gear)

a<-summarise(by_gear, gear1=sum(gear), gear2=mean(gear))
a
summarise(group_by(mtcars, cyl), mean(gear, na.rm =-TRUE))

b<-by_gear%>% summarise(gear1=sum(gear), gear2=mean(gear))
b

#arrange to sort data
View(arrange(flights, year, dep_time))
head(arrange(flights, year, dep_time))

df<-mtcars
df
View(mtcars)
