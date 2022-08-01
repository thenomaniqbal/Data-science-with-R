#-------Factors in R----------#

#create a vector first
apple_colors <- c('r', 'o', 'g', 'r', 'o')
#create a factor object
factor_apple <- factor(apple_colors)
#print factor
print(factor_apple)
print(nlevels(factor_apple))


Type<-c("s","m","l","s","l","m")
Type[3]>Type[4]
Type[1]>Type[2]
Type[2]<Type[3]

Type.factor<-factor(TRUE)

#default Nominal factor
Type.factor

Type.factor2<-factor(Type,ordered=T)
#Factor created in ordinal
Type.factor2

Type.factor3<-factor(Type,ordered=T,level=c("s","m","l"))
#Ordered factor with user given order
Type.factor3

Type.factor4<-factor(Type,ordered=T,level=c("s","m","l"),
                     labels=c("small","medium","large"))
Type.factor4

Type.factor4[1]>Type.factor4[2]

Type<-c("Small","Tall","Tallest","Medium","Small",
        "Medium","Tallest","Tall","Small","Small")
Type

#Compare height type of first value with fourth value

Type.factor5<-factor(Type,ordered=T,level=c("Small","Medium","Tall","Tallest"))

Type.factor5

Type.factor5[1]>Type.factor5[4]

as.integer(Type.factor5)

# Create a sequence

v <- seq(0,20, by=2)
v

# Sort a vector

v <- c(2,4,5,7,1,16,4)
sort(v)
sort(v,decreasing = TRUE)

# Reverse a vector

v2 <- c(1,2,3,4,5)
rev(v2)

# Structure of a vector
str(v)

# Append 2 vectors
append(v,v2)

# Check the class of an R object
v <- c(1,2,3)
is.vector(v)
is.list(v)

# Covert the vector into a list using as.list()
as.list(v)

# Convert the vector into a matrix
as.matrix(v)

# Sample 2 random values between 10 and 20
sample(x = 10:20,1) # The value changes everytime you run it


# Basic maths functions

abs(-5) # returns the absolute value

v <- c(-3,0,1,-5,6,4,5)
abs(v)

sum(v)
mean(v)
round(45.12453)
round(45.12453,2) # Rounds the number to 2 decimal places
ceiling(45.12453) # Return the next highest integer
floor(45.12453) # Returns the next lowest integer
trunc(56.783) # Truncates the decimal places 
log(2) # Return the log
exp(2) # Return exponent

# Regular expressions

text <- "R is fun to learn"
grepl('learn', text) #returns a logical value indicating if the pattern was found
grepl('study',text)

v <- c('a','b','c','d')
grep('b',v)

grep('d',v)

# Working with timestamps

Sys.Date() # Returns the current system date

# Set as a variable
today <- Sys.Date()
today

# YYYY-MM-DD
as.Date('1990-11-03')

# Using Format
# %b month abbreviated
# %d day of the month
# %y year in 2 digits

as.Date("Nov-03-90",format="%b-%d-%y")

# Using Format
# %B Full month name
# %Y year in 4 digits

as.Date("November-03-1990",format="%B-%d-%Y")




