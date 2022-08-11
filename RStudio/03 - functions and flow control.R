# Logical Operations
# And - &
# Or - |
# Not - !

x <- 25
x < 10
x > 10
x < 20 & x > 10
(x > 20) & (x>5) & (x == 25)
x > 10 | x < 5
x < 20 | x == 30
(12 == 3)
!(12 == 3)

df <- mtcars
df

df[df['mpg'] >= 30,] # Notice the use of indexing with the comma
subset(df,mpg>=20)

df[(df['mpg'] >= 20) & (df['hp'] > 100),]

#--------------Functions in R--------------------#

# Simple function, no inputs!
hello_world <- function(){
    print('hello World in R!')
}
hello_world()

# Function with a single argument

hello_name <- function(name){
    print(paste('hello ',name))
}
hello_name('John')

# Function to add 2 numbers

add_num <- function(num1,num2){
  print(num1+num2)
}
add_num(30,40)

# Add a vector to a number

add_num(c(10,20,30),5)

# Function with default argument values

hello_name <- function(name='Rick'){
  print(paste('Hello ',name))
}
hello_name()
hello_name('Sam')

# Return the value from a function

full_name <- function(name='Sachin',title='Tendulkar'){
  return(paste(name,' ',title))
}
full_name()

full_name1 <- full_name('Don', 'Bradman') 
full_name1

# Scope of a variable in a function

v <- "I'm global variable"
stuff <- "I'm global stuff"
  
fun <- function(stuff){
    print(v) 
    stuff <- 'Reassign stuff inside the function'
    print(stuff)
}

fun()
print(v) 
print(stuff) 
fun(stuff) # Reassignment only happens in scope of function
print(stuff)
# Create a function to find the final amount to be paid by a customer after 
#adding 20% tax to the purchased amount.

amount<-function(x=100)
{
  t=x+x*(20/100)
  return(t)
}
amount(100)

#--------------------

amount1<-function(amt)
{
  if(amt>0) famt=amt+amt*(20/100) 
  if(amt<=0) famt=amt
  return(famt)
  
}  
amount1(100)

# Check the argument and the body of a function

args(amount1)
body(amount1)

# Example to understand the scope

f1<-function(x)
{
  y=10
  g1=function(x)
  {
    y+(x*x)
  }
  
  g1(x)
}

f1(10)

#------------

g2<-function(x)
{
  y+(x*x)
}
f2<-function(x)
{
  y=10
  g2(x)
}
f2(10)

#-------------

g2<-function(x,y)
{
  y+(x*x)
}
f2<-function(x)
{
  y=10
  g2(x,y)
}
f2(10)

#----------if esle, else if---------------#

# Single condition check
hot <- FALSE
temp <- 50

if (temp > 60){
  hot <- TRUE
}
hot

# Change the temp value
temp <- 100
  
if (temp > 60){
    hot <- TRUE
}
  
hot

# Else statement

score <- 63

if (score > 80){
  print("It is a good score!")
} else{
  print("Its not a good score!")
  }

# Else if statement

score <- 63
  
if (score > 80){
    print("Good score!")
} else if(score>60 & score<80){
    print('Decent score!')
} else if(score<60 & score >33){
    print("Average score!")
} else{
    print("Poor!")
}

# Example 1
status<-function(marks)
{
  result="Not Defined"
  if(marks>50) result="PASS"
  message("Your result is"," ",result)
}
status(60)
status(30)

# Example 2

status<-function(age)
{
  ageGrp="Not Defined"
  vote="Not Defined"
  if(age>=18)
  {
    ageGrp="ADULT"
    vote="YES"
  }
  message("Your age group is ",ageGrp)
  message("Voting status is ",vote)
}
status(20)
status(15)

# Example to convert a name into uppercase

status<-function(name)
{
  len<-nchar(name)
  if(len>5) name=toupper(name)
  message("User given name is ",name)
}
status("Stuart")
status("John")

# Example to calculate bonus

get_bonus<-function(salary,exp)
{
  if(exp>5)
  {
    bonus_per=10
  }else
  {
    bonus_per=5
  }
  bonus=salary*(bonus_per/100)
  return(bonus)
}
get_bonus(25000,6)
get_bonus(25000,3)

# Example for multiple condition & multiple actions

get_Group<-function(age)
{
  if(age>0)
  {
    if(age<18)
    {
      ageGrp="KIDS"
    }else if(age<60)
    {
      ageGrp="ADULT"
    }else
    {
      ageGrp="SENIOR"
    }
  }else
  {
    ageGrp="Not Defined"
    message("Wrong Age")
  }
  message("your age group is ",ageGrp)
}
get_Group(10)
get_Group(40)
get_Group(65)
get_Group(-10)

#-----------Using  switch  function------------#
# Returns value matched with the first argument
# First argument should be a character

# Example to return hra amount based on cities
HRA<-function(city)
{
  hra_amt<-switch(toupper(city),
                 BLR=7500,
                 MUM=1000,
                 DEL=8000,
                 CHN=7500,
                 5000
  )
  return(hra_amt)
}

HRA("BLR")
HRA("PUNE")
HRA("blr")

# Example to return the salary band.

salary_range<-function(band)
{
  range<-switch(band,
                L1="10000-15000",
                L2="15000-25000",
                L3="25000-40000"
  )
  return(range)
}
salary_range("L1")
salary_range("B1")

#----------Using Repeat in R-------------#

time<-15
repeat
{
  message("Hello, Welcome to R tutorial for beginner!")
  if(time>=20) break
  time=time+1
}

# R function to find the square of any user given numbe.
# If square value is less than 100,then
#increment user value by 1 & find square again.
#Repeat this step till sqaure exceeds 100.

sqr<-function(n)
{
  repeat
  {
    square=n*n
    message("The square is ",square)
    if(square>=100) break
    n=n+1
  }
  return(n)
  
}
sqr(6)

#--------------While Loops----------------#

# Example

x <- 0

while(x < 10){
  
  cat('x is currently: ',x)
  print(' x is still less than 10, adding 1 to x')
  
  # add one to x
  x <- x+1
  if(x==10){
    print("x is equal to 10! Terminating loop")
  }
}

# R function to find the total number of years required 
# to raise $8000 if the user deposits $750 per month

req_years<-function(amount=550)
{
  famt=0;month=0
  while(famt<=8000)
  {
    month=month+1
    famt=famt+amount
    message("Month=",month,"final_amount=",famt)
  }
  year=month/12
  return(year)
}
req_years()
req_years(750)


#---------Using break statement in a while loop----------#

x <- 0

while(x < 5){
  
  cat('x is currently: ',x)
  print(' x is still less than 5, adding 1 to x')
  
  # add one to x
  x <- x+1
  if(x==5){
    print("x is equal to 5!")
    break
    print("I will also print, woohoo!")
  }
}


#-----------For Loops----------------#

vec <- c(1,2,3,4,5)
for (temp_var in vec){
  print(temp_var)
}

# Another process
for (i in 1:length(vec)){
  print(vec[i])
}

# For loop over a list

li <- list(1,2,3,4,5)

for (temp_var in li){
  print(temp_var)
}


for (i in 1:length(li)){
  print(li[[i]]) # Remember to use double brackets!
}

# For loop to print a matrix

mat <- matrix(1:25,nrow=5)
mat

for (num in mat){
    print(num)
}

# Example to print the square and square roots of numbers b/w 1-25

for(i in 1:25)
{
  sq=i*i
  sqroot=sqrt(i)
  message("i=",i,"sq=",sq,"sqroot=",sqroot)
  
}

#R function to find the balance in a bank a/c after n years if I have deposited
#x amount in the beginning. Bank gives interest at rate of 8% p.a.

get_finalbal<-function(amt,year,rate)
{
  for(i in 1:year)
  {
    interest=round(amt*rate/100,2)
    finalamt=amt+interest
    message("Year=",i,"amt=",amt,"Interest=",interest,"final amt=",finalamt)
    amt=finalamt
  }
  return(finalamt)
}
get_finalbal(5000,5,8)
get_finalbal(10000,10,5)
