
<h1 align="center">
  Data Science with R!
</h1>
<br/>

## 🔥 Data Science:
<p>
  Data science is a multidisciplinary field that unifies <b>statistics</b>, <b>data analysis</b>, <b>machine learning</b>, and their <b>related methods</b> to extract knowledge and insights from data.  
  Extracting insights from seemingly random data, data science normally involves <b>collecting data</b>, <b>cleaning data</b>, performing <b>exploratory data analysis</b>, <b>building and evaluating machine learning models</b>, and <b>communicating insights to stakeholders</b>.

  **Business analytics:** Business analytics is a scientific process that transforms data into insights.  
  **Descriptive analytics** includes techniques that explain what has happened in the past.  
  **Predictive analytics** includes techniques that predict the future by using models created from past data or determining one variable's impact on another.  
  **Prescriptive analytics**, the final phase of business analytics, specifies the best course of action for business activity in the form of the output of a prescriptive model (Recommend to the organization).
</p>

## 🔥 R:
<p> R is a programming language and software environment for statistical analysis, graphics representation and reporting. </p>

## 🔥 Features:

1.    R is a well-developed, simple and effective programming language which includes conditionals, loops, user defined recursive functions and input and output facilities.
2.    R has an effective data handling and storage facility.
3.    R provides a suite of operators for calculations on arrays, lists, vectors and matrices.
4.    R provides a large, coherent and integrated collection of tools for data analysis.
5.    R provides graphical facilities for data analysis and display either directly at the computer or printing at the papers.

  As a conclusion, R is world’s most widely used statistics programming language. It's the #1 choice of data scientists and supported by a vibrant and talented community of contributors.
</p>

## 🔥 Data types/Data structures:
The variables are assigned with R-Objects and the data type of the R-object becomes the data type of the variable. There are many types of R-objects. The frequently used ones are – 

1.    Vectors
2.    Lists
3.    Matrices
4.    Arrays
5.    factors
6.    Data Frames

The simplest of these objects is the vector object and there are six data types of these atomic vectors, also termed as six classes of vectors. The other R-Objects are built upon the atomic vectors.<br/>
Example:<br/>
Logical- TRUE or FALSE<br/>
Numeric - 12.3, 5, 999<br/>
Integer - 2L, 34L, 0L<br/>
Complex - 3 + 2i<br/>
Character - 'a' , '"good", "TRUE", '23.4'<br/>
Raw - charToRaw("Hello") - "Hello" is stored as 48 65 6c 6c 6f<br/>

## 🔥 Explaining the data types:
1.    vectors
<h3> combining vectors </h3>

apple <- c('r', 'o', 'g')
print(apple)

### 2. lists
list1 <-list(c(2,3,4), 21, 3.4, sin)
print(list1)

### 3. matrices
m = matrix(c('a', 'a','b', 'c', 'b', 'a'), nrow=2, ncol=3, byrow = TRUE)
print(m)

### 4. arrays
a <- array(c('green', 'red'), dim = c(3, 3, 2))
print(a)

### 5. factors
create a vector first

apple_colors <- c('r', 'o', 'g', 'r', 'o')

create a factor object

factor_apple <- factor(apple_colors)

print factor
print(factor_apple)
print(nlevels(factor_apple))

### 6. dataframes
BMI <- data.frame(
  gender = c('male','female', 'male'),
  height = c( 152, 142, 156.8),
  weight = c(56,54,34),
  age = c(54,33,22)
)
print(BMI)

## 🔥 Variables:
Variables are used to stored data, and the unique name given to it is called identifier.

## 🔥 Operators in R:
Arethmatic, Relational, Logical and assignment( a<-8 means a=8) operators.

## 🔥 More about R:

### string

string <- "hello world"
print(string)

### multiline comment
if(FALSE){
  "this is a multi line
  comment, and this is how we
  put it"
}

## 🔥 Conditional statement, loops, break, next, Rscript and Functions


### if else
x=20
if (x>18)
{
  print("major")
} else {
  print ("minor")
}

### for loop
vec <- c(1,2,3,4,5)
for(val in vec)
{
  print(val)
}

### while loop
i <- 1
while(i<6)
{
  print(i)
  i=i+1
}

### repeat loop
x <- 1
repeat
{
  print(x)
  x=x+1
  if(x==6){
    break
  }
}


### break and next
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

## 🔥 R script
a set of commands to be executed in console

source("myScript.R")

## 🔥 Function

stored as r object, there are 1000 of functions at the core of R

append(), c(), identical(), length() and so on

## 🔥 Importing files in R
R enables you to import data from different sources. 

1. Table: A table can be loaded in R using the read.table function.

2. CSV: A .csv file is imported using the read.csv function.

3. Excel: A .xls file is imported using the read.excel function.

## 🔥 Exporting Files in R
You can also export different files to another location in R.

1. To export a table: Write.table(file_name, “c:/file_name.txt”, sep=“\t”)

2. To export an Excel file: Write.xls(file_name, "c:/file_name.txt", sep= "\t")

3. To export a CSV file: Write.csv(file_name, “c:/file_name.csv”)

## 🔥 Data Visualization:
Bar plot, Pie chart, Histogram, Kernel density plot, Line chart, Box plot, Heat map, Word cloud.


## 🔥 Statistical analysis:
Hypothesis: Assumption
hypothesis needs analysis to be validated.
simple hypothesis: R.S between 2 variables
complex hypothesis: R.S between more than 2 variables
Null hypothesis: H1-mean =100
alternate hypothesis: H1-mean = or != 100
statistical hypothesis: statistical inference performed data from a scientific study.

## 🔥 hypothesis test:
hypothesis test is a formal procedure in statistics used to test whether a hypothesis can be accepted o not.

## 🔥 Data sampling:
A statistical hypothesis technique used to select, manipulate, and analyze a subset of data points to discover hidden patterns and trends in the larger data set.

## 🔥 Statistical tests:
statistical tests are statistical methods that help us reject or not reject our null hypothesis. They’re based on probability distributions and can be one-tailed or two-tailed, depending on the hypotheses that we’ve chosen.
There are other ways in which statistical tests can differ and one of them is based on their assumptions of the probability distribution that the data in question follows.

## 🔥 Parametric tests:
Parametric tests are those statistical tests that assume the data approximately follows a normal distribution (In a normal distribution the mean is zero and the standard deviation is 1.  its mean (average), median (midpoint), and mode (most frequent observation) are all equal to one another.), amongst other assumptions (examples include z-test, t-test, ANOVA, Manova). Important note — the assumption is that the data of the whole population follows a normal distribution, not the sample data that you’re working with.

## 🔥 Nonparametric tests:
Nonparametric tests are those statistical tests that don’t assume anything about the distribution followed by the data, and hence are also known as distribution free tests (examples include Chi-square, Mann-Whitney U). Nonparametric tests are based on the ranks held by different data points.

Common parametric tests are focused on analyzing and comparing the mean or variance of data.
The mean is the most commonly used measure of central tendency to describe data, however it is also heavily impacted by outliers. Thus it is important to analyze your data and determine whether the mean is the best way to represent it. If yes, then parametric tests are the way to go! If not, and the median better represents your data, then nonparametric tests might be the better option.

As mentioned above, parametric tests have a couple of assumptions that need to be met by the data:

Normality — the sample data come from a population that approximately follows a normal distribution
Homogeneity of variance — the sample data come from a population with the same variance
Independence — the sample data consists of independent observations and are sampled randomly
Outliers — the sample data don’t contain any extreme outliers

Degree of freedom: The degrees of freedom are essentially the number of independent values that can vary in a set of data while measuring statistical parameters.

Comparing means:
If you want to compare the means of two groups then the right tests to choose between are the z-test and the t-test.

## 🔥 T-test
t-test is a classic method for comparing mean values of two samples that are normally distributed (i.e. they have a Gaussian distribution). Such samples are described as being parametric and the t-test is a parametric test. In R the t.test() command will carry out several versions of the t-test.

## 🔥 Z-test
A one-sample z-test is used to determine whether the population mean is equal or different from a predefined standard (or theoretical) value of mean when population standard deviation is known and the sample size is larger.

## 🔥 One-sample:
One-sample (one-sample z-test or a one-sample t-test): one group will be a sample and the second group will be the population. So you’re basically comparing a sample with a standard value from the population. We are basically trying to see if the sample comes from the population, i.e. does it behave differently from the population or not.

## 🔥 Two-sample:
Two-sample (two-sample z-test and a two-sample t-test): both groups will be separate samples. As in the case of one-sample tests, both samples must be randomly selected from the population and the observations must be independent of one another.

difference: in case of z the test statistics is t and @ is known while in case of t-test its unknown.

## 🔥 ANOVA:
ANOVA -short for “analysis of variance”- is a statistical technique for testing if 3(+) population means are all equal.

## 🔥 MANOVA:
multivariate analysis of variance (MANOVA) is a procedure for comparing multivariate sample means. As a multivariate procedure, it is used when there are two or more dependent variables, and is often followed by significance tests involving individual dependent variables separately.
Oneway anova, twowayanova


## 🔥 Non parametric test:

## 🔥 U-test:
The U-test is used for comparing the median values of two samples. You use it when the data are not normally distributed, so it is described as a non-parametric test. The U-test is often called the Mann-Whitney U-test but is generally attributed to Wilcoxon (Wilcoxon Rank Sum test), hence in R the command is wilcox.test().

## 🔥 Chi-squre test:
It is used to observe the closeness of a sample that maches a population.


## 🔥 Linear regression:
Simple regression:
It predicts the value of a variable based on the value of two or more variables.
Multiple regression: It considers more than one quantitative and qualitative variable (X1, .. , Xn) to predict a quantitative and dependent variable Y.

## 🔥 Non linear regression:
not linear line i.e polynomial, logarithmic, square root, reciprocal, and exponential regression.

## 🔥 Cross validation:
cross validation is a technique used to determine the accuracy in predicting models.

## 🔥 PCA
PCA are linear components of the original variables. They tend to capture as much variance as possible in a dataset.

## 🔥 Clustering
type of unsupervised learning.
group things based on similarities.

(1)prototype based clustering=partial clustering (kmeans and fuzzy c-means) clustering-based on centeroid
(2)hierarchial clustering-based on dendogram = agglomerative (bottom-top) and divisive(top-bottom)
(3)density based clustering-used to identify clusters of any shape in a data set containing noise and outliers

# 🔥 WORKING ON THIS DIRECTORY - SICK TODAY- SO WILL DO IT TOMMOROW 🔥
