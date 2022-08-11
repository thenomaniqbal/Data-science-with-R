# Basic Arthmetic operations

192+250 #Addition
955-380 #Subtraction
20*100 #Multiplication
50/5 #Division
5^4 #Exponent
18%%7 #Modulo - returns the remainder
(500*2)+(80/2) #Order of operations
500*(2+1) #Order of operation

# Assigning variables
selling <- 500               #Assign variable1
cost <- 250                  #Assign variable2
profit <- selling - cost     #Assign variable3
profit                       #Displays the value stored in profit

# Data types in R
num <- 3.7 #Decimals are part of the Numeric class in R
class(num)

i <- 10 #Whole numbers are known as integers
typeof(num) #To check the data type of the variable

t <- TRUE
f <- FALSE #Boolean values are part of the logical class
typeof(t)

ch <- "HELLO" #Text/string values are known as characters 
class (ch) #Checks the data type of a variable
typeof(ch) #Checks the data type of a variable

c <- 1+2i #R supports complex data type too
class(c)
length(ch)

# Using the Print function

#string
string <- "hello world"
print(string)

print ("hey") #Prints hey on the screen 

y <- 20
print(y) #Prints the value of y

x <- mtcars
print (mtcars) #Prints the mtcars dataset

print(paste('hello','students'))  #Paste function

print(paste('hello','students', sep=',')) #Sep is for the chosen separator between the pasted items

paste0('hello','students')  #Displays without space

sprintf("%s is %f feet tall", "Ashley", 5.1) #Returns a character vector containing a formatted combination of text and variable values 

#multiline comment
if(FALSE){
  "this is a multi line
  comment, and this is how we
  put it"
}

#DATA TYPES
logical <- TRUE
print(logical)

numeric <- 23.5
print(numeric)

integer <- 2L
print(integer)

complex <- 2+3i
print(complex)

character <- "true"
print(character)

raw <- charToRaw("Hello")
print(raw)

# Data structures
#1. vectors
apple <- c('r', 'o', 'g')
print(apple)

#2. lists
list1 <-list(c(2,3,4), 21, 3.4, sin)
print(list1)


list2<-list("(3,4)", TRUE, sin, "okay", 3,4)
list2

#3. matrices
m = matrix(c('a', 'a','b', 'c', 'b', 'a'), nrow=2, ncol=3, byrow = TRUE)
print(m)

#4. arrays
a <- array(c('green', 'red'), dim = c(3, 3, 2))
print(a)

#5. factors
#create a vector first
apple_colors <- c('r', 'o', 'g', 'r', 'o')
#create a factor object
factor_apple <- factor(apple_colors)
#print factor
print(factor_apple)
print(nlevels(factor_apple))

#6. dataframes
BMI <- data.frame(
  gender = c('male','female', 'male'),
  height = c( 152, 142, 156.8),
  weight = c(56,54,34),
  age = c(54,33,22)
)
print(BMI)


# Vectors in R

# Create vectors
vec1<-c(10,20,30)
vec1
class(vec1)

vec2<-c("a","b","c")
vec2
class(vec2)

vec3<-c(TRUE,FALSE,TRUE)
vec3
class(vec3)

# Print the above 3 vectors at once with semicolon
vec1;vec2;vec3 #';' is used to separate 2 or more variables

vec4<-c(10,"a",TRUE) #R converts every value to character type
vec4
class(vec4)

vec5 <- c(FALSE,2) #R converts every value to numeric type
vec5
class(vec5)

vec6 <- c('A',1)
vec6
class(vec6)

vec7<-c(1:20)
vec7

vec8<-seq(1,20)
vec8

vec9<-1:25
vec9

#Create a vector with odd values b/w 1 to 20

odd_value<-seq(1,20,2)
odd_value

#Create a vector with even values b/w 1 to 20

even_value<-seq(2,20,2)
even_value

#Create vector with 10 odd values starting from 20

vec10<-seq(from=21,by=2,length.out=10)
vec10

# Naming your vectors using names() function

temperature <- c(72,71,68,73,69,75,71)
temperature

names(temperature) <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
temperature

# Another way to name your vectors

days <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
temperature1 <- c(40,45,60,30,36,12,29)
names(temperature1) <- days
temperature1

# One more way to give names to each price values
price<-seq(100,220,20)
names(price)<-paste0("p",1:7)
price

# Basic operation on Vectors

v1 <- c(2,1,4)
v2 <- c(5,6,7)

# Add 2 vectors
v1+v2

# Subtract 2 vectors
v2-v1

# Multiply 2 vectors
v1*v2

# Divide 2 vectors
v1/v2

# Using basic maths functions with vectors
v1

sum(v1) # Add the values in a vector
sd(v1) # Finds the standard deviation
var(v1) # To display the variance
prod(v1) # Give the product of the vector values
max(v1) # Returns the maximum value 
min(v1) # Returns the minimun value

# Comparing vectors using comparision operators

v1 <- c(19,12,45)
v2 <- c(19,20,30)

v1<v2
v1>v2
v1!=v2
v1==v2

v <- c(1,2,3,4,5)
v<3

# Vector slicing and indexing

price1<-seq(550,670,20)
names(price1)<-paste0("p",1:7)
price1

#1. Using index position
price1[3]
price1[3:4]
price1[c(1,4)]
price1[c(2,6)]

#2. Indexing with names
price1[c("p3")]
price1[c("p3","p4","p7")]
price1["p3"]

#3.Using logical position
price1[c(T,F,T,T,F,F,F)]
price1[c(T,F)]

#4.Using exclude position method
price1[-2]
price1[c(-2,-5)]

#5. Using comparision operator
price1[price1>600]

filter <- price1>600
price1[filter]


# Loops

# if else
x=20
if (x>18)
{
  print("major")
} else {
  print ("minor")
}

# for loop
vec <- c(1,2,3,4,5)
for(val in vec)
{
  print(val)
}

# while loop
i <- 1
while(i<6)
{
  print(i)
  i=i+1
}

# repeat loop
x <- 1
repeat
{
  print(x)
  x=x+1
  if(x==6){
    break
  }
}


# break and next
num <- 1:5
for (val in num){
  if (val == 3){
    break
  }
  print(val)
}

num <- 1:5
for (val in num){
  if (val == 3){
    next
  }
  print(val)
}
