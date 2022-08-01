
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

<p>
  <b> As a conclusion, R is world’s most widely used statistics programming language. It's the #1 choice of data scientists and supported by a vibrant and talented community of contributors.</b>
</p>

## 🔥 Data types/Data structures:
<p>
  The variables are assigned with R-Objects and the data type of the R-object becomes the data type of the variable. There are many types of R-objects. The frequently used ones are – 
  </p>

1.    Vectors
2.    Lists
3.    Matrices
4.    Arrays
5.    factors
6.    Data Frames

<p>
  The simplest of these objects is the vector object and there are six data types of these atomic vectors, also termed as six classes of vectors. The other R-Objects are built upon the atomic vectors.
</p>
Example:<br/>
Logical- TRUE or FALSE<br/>
Numeric - 12.3, 5, 999<br/>
Integer - 2L, 34L, 0L<br/>
Complex - 3 + 2i<br/>
Character - 'a' , '"good", "TRUE", '23.4'<br/>
Raw - charToRaw("Hello") - "Hello" is stored as 48 65 6c 6c 6f<br/>

## 🔥 Explaining the data types:
1.    vectors
apple <- c('r', 'o', 'g')<br/>
print(apple)

2.    lists
list1 <-list(c(2,3,4), 21, 3.4, sin)<br/>
print(list1)

3.    matrices
m = matrix(c('a', 'a','b', 'c', 'b', 'a'), nrow=2, ncol=3, byrow = TRUE)<br/>
print(m)

4.    arrays
a <- array(c('green', 'red'), dim = c(3, 3, 2))<br/>
print(a)

5.    factors
create a vector first<br/>
apple_colors <- c('r', 'o', 'g', 'r', 'o')<br/>
create a factor object<br/>
factor_apple <- factor(apple_colors)<br/>
print factor<br/>
print(factor_apple)<br/>
print(nlevels(factor_apple))

6.    dataframes
BMI <- data.frame(<br/>
  gender = c('male','female', 'male'),<br/>
  height = c( 152, 142, 156.8),<br/>
  weight = c(56,54,34),<br/>
  age = c(54,33,22)<br/>
)<br/>
print(BMI)

## 🔥 Variables:
<p>Variables are used to stored data, and the unique name given to it is called identifier.</p>

## 🔥 Operators in R:
<p> Arethmatic(+,-,*,/,^,%%, and integer division-%/%-quotiont-16/5=3),  Relational(>, <, >=, <=, ==, !=) , Logical(and-&, or-|, not-!) and assignment( a<-8 means a=8, 8->a means 8=a) operators. </p>

## 🔥 More about R:

<p> String </p>
string <- "hello world"<br/>
print(string)

<p>Multiline comment</p>
if(FALSE){<br/>
  "this is a multi line<br/>
  comment, and this is how we<br/>
  put it"<br/>
}

## 🔥 data manipulation in r
<b>dplyr:</b>

<p> the dplyr package is used to transform and summarize tabular data with rows and columns<br/>
select, filter, sort, arrange, summary, mutate </p>

<b>tidyr</b>

<p>the tidyr package helps you create tidy data, a tidy data is easy to visualize and model, gather(make wide data longer), spread(makes long data wider), separate(split a col into multiple cols), unite(combine multiple cols)</p>

<p> %>% is called the forward pipe operator in R. It provides a mechanism for chaining commands with a new forward-pipe operator, %>%. 
<p> This operator will forward a value, or the result of an expression into the next function call/expression. It is defined by the package magrittr (CRAN) and
is heavily used by dplyr (CRAN).</p>

## 🔥 Conditional statement, loops, break, next, Rscript and Functions

<h3>if else</h3>
x=20<br/>
if (x>18)<br/>
{<br/>
  print("major")<br/>
} else {<br/>
  print ("minor")<br/>
}<br/>

<h3>for loop</h3>
vec <- c(1,2,3,4,5)<br/>
for(val in vec)<br/>
{<br/>
  print(val)<br/>
}

<h3>while loop</h3>
i <- 1<br/>
while(i<6)<br/>
{<br/>
  print(i)<br/>
  i=i+1<br/>
}

<h3>repeat loop</h3>
x <- 1<br/>
repeat<br/>
{<br/>
  print(x)<br/>
  x=x+1<br/>
  if(x==6){<br/>
    break<br/>
  }<br/>
}


<h3>break and next</h3>
num <- 1:5<br/>
for (val in num){<br/>
  if (val == 3){<br/>
    break<br/>
  }<br/>
  print(val)<br/>
}

num <- 1:5<br/>
for (val in num){<br/>
  if (val == 3){<br/>
    next<br/>
  }<br/>
  print(val)<br/>
}

## 🔥 R script
<p>A set of commands to be executed in console</p>
source("myScript.R")

## 🔥 Function
<p>Stored as r object, there are 1000 of functions at the core of R</p>

append(), c(), identical(), length() and so on

## 🔥 Importing files in R
<p>R enables you to import data from different sources.</p> 

1.    Table: A table can be loaded in R using the read.table function.

2.    CSV: A .csv file is imported using the read.csv function.

3.    Excel: A .xls file is imported using the read.excel function. or Read data from the sheets using read_excel i.e read_excel("filename.xlsx",sheet='sheetname')

## 🔥 Exporting Files in R
<p>You can also export different files to another location in R.</p>

1.    To export a table: Write.table(file_name, “c:/file_name.txt”, sep=“\t”)

2.    To export an Excel file: Write.xls(file_name, "c:/file_name.txt", sep= "\t")

3.    To export a CSV file: Write.csv(file_name, “c:/file_name.csv”)

## 🔥 Data Visualization:
<p>Bar plot, Pie chart, Histogram, Kernel density plot, Line chart, Box plot, Heat map, Word cloud.</p>

## 🔥 Statistical analysis:
Hypothesis: Assumption<br/>
Hypothesis needs analysis to be validated.<br/>
Simple hypothesis: R.S between 2 variables<br/>
Complex hypothesis: R.S between more than 2 variables<br/>
Null hypothesis: H1-mean =100<br/>
Alternate hypothesis: H1-mean = or != 100<br/>
Statistical hypothesis: statistical inference performed data from a scientific study.<br/>

## 🔥 Hypothesis test:
<p>hypothesis test is a formal procedure in statistics used to test whether a hypothesis can be accepted or not.</p>

## 🔥 Data sampling:
<p>A statistical hypothesis technique used to select, manipulate, and analyze a subset of data points to discover hidden patterns and trends in the larger data set.</p>

## 🔥 Statistical tests:
<p>Statistical tests are statistical methods that help us reject or not reject our null hypothesis. They’re based on probability distributions and can be one-tailed or two-tailed, depending on the hypotheses that we’ve chosen.<br/>
There are other ways in which statistical tests can differ and one of them is based on their assumptions of the probability distribution that the data in question follows.</p>

## 🔥 Parametric tests:
<p>Parametric tests are those statistical tests that assume the data approximately follows a normal distribution (In a normal distribution the mean is zero and the standard deviation is 1.  its mean (average), median (midpoint), and mode (most frequent observation) are all equal to one another.), amongst other assumptions. for example: z-test, t-test, ANOVA, Manova. <br/>
Important note — the assumption is that the data of the whole population follows a normal distribution, not the sample data that you’re working with.

## 🔥 Nonparametric tests:
<p>Nonparametric tests are those statistical tests that don’t assume anything about the distribution followed by the data, and hence are also known as distribution free tests (examples include Chi-square, Mann-Whitney U-test). <br/>
  Nonparametric tests are based on the ranks held by different data points. </p>

<p>Common parametric tests are focused on analyzing and comparing the mean or variance of data.<br/>
The mean is the most commonly used measure of central tendency to describe data, however it is also heavily impacted by outliers. Thus it is important to analyze your data and determine whether the mean is the best way to represent it. If yes, then parametric tests are the way to go! If not, and the median better represents your data, then nonparametric tests might be the better option.</p>

<p><b>As mentioned above, parametric tests have a couple of assumptions that need to be met by the data:</b></p>

1.    Normality — the sample data come from a population that approximately follows a normal distribution
2.    Homogeneity of variance — the sample data come from a population with the same variance
3.    Independence — the sample data consists of independent observations and are sampled randomly
4.    Outliers — the sample data don’t contain any extreme outliers

## 🔥 Degree of freedom: 
<p>The degrees of freedom are essentially the number of independent values that can vary in a set of data while measuring statistical parameters.</p>

## 🔥 Comparing means:
<p>If you want to compare the means of two groups then the right tests to choose between are the z-test and the t-test.</p>

## 🔥 Parametric tests:
## 🔥 T-test
<p>t-test is a classic method for comparing mean values of two samples that are normally distributed (i.e. they have a Gaussian distribution). Such samples are described as being parametric and the t-test is a parametric test. In R the t.test() command will carry out several versions of the t-test.</p>

## 🔥 Z-test
<p>A one-sample z-test is used to determine whether the population mean is equal or different from a predefined standard (or theoretical) value of mean, when population standard deviation is known and the sample size is larger.</p>

## 🔥 One-sample:
<p>One-sample (one-sample z-test or a one-sample t-test): one group will be a sample and the second group will be the population. So you’re basically comparing a sample with a standard value from the population. We are basically trying to see if the sample comes from the population, i.e. does it behave differently from the population or not.</p>

## 🔥 Two-sample:
<p>Two-sample (two-sample z-test and a two-sample t-test): both groups will be separate samples. As in the case of one-sample tests, both samples must be randomly selected from the population and the observations must be independent of one another.</p>

<p>difference: in case of z the test statistics is t, and @ which is known while in case of t-test its unknown.</p>

## 🔥 ANOVA:
<p>ANOVA -short for “analysis of variance”- is a statistical technique for testing if 3(+) population means are all equal.</p>

## 🔥 MANOVA:
<p>multivariate analysis of variance (MANOVA) is a procedure for comparing multivariate sample means. As a multivariate procedure, it is used when there are two or more dependent variables, and is often followed by significance tests involving individual dependent variables separately.<p>
  
  <b>Oneway anova, twowayanova</b>


## 🔥 Non parametric test:
## 🔥 U-test:
<p> The U-test is used for comparing the median values of two samples. You use it when the data are not normally distributed, so it is described as a non-parametric test. The U-test is often called the Mann-Whitney U-test but is generally attributed to Wilcoxon (Wilcoxon Rank Sum test), hence in R the command is wilcox.test().</p>

## 🔥 Chi-squre test:
<p>It is used to observe the closeness of a sample that maches a population.</p>


## 🔥 Linear regression:
## 🔥 Simple regression:
<p>It predicts the value of a variable based on the value of two or more variables.</p>
## 🔥Multiple regression: 
<p>It considers more than one quantitative and qualitative variable (X1, .. , Xn) to predict a quantitative and dependent variable Y.</p>

## 🔥 Non linear regression:
<p>not linear line i.e polynomial, logarithmic, square root, reciprocal, and exponential regression.</p>

## 🔥 Clustering
<p>type of unsupervised learning.</p>
group things based on similarities.

(1)prototype based clustering=partial clustering (kmeans and fuzzy c-means) clustering-based on centeroid<br/>
(2)hierarchial clustering-based on dendogram = agglomerative (bottom-top) and divisive(top-bottom)<br/>
(3)density based clustering-used to identify clusters of any shape in a data set containing noise and outliers<br/>

## 🔥 End-to-end Machine Learning project with R 
1.    Get the data
2.    Explore and visualize data for insights
3.    Cleaning data for machine learning algorithms
4.    Select and train model
5.    Tune the parameters (if possible) for performance-enhancement
6.    Present your findings and solutions
7.    Create, launch and maintain a scalable system


## 🔥 Cross validation:
<p>When model is split into training and testing it can be possible that specific type of data point may go entirely into either training or testing portion. This would lead the model to perform poorly. Hence over-fitting and underfitting problems can be well avoided with cross validation techniques. cross validation is a technique used to determine the accuracy in predicting models.</p>

## 🔥 K-fold cross validation
<p>We are doing evaluation because we want to get an accurate measure of how well the model performs. If our dataset is small, our test set is going to be small. Thus it might not be a good random assortment of datapoints and by random chance end up with easy or difficult datapoints in our evaluation set.
Since our goal is to get the best possible measure of our metrics (accuracy, precision, recall and F1 score), we can do a little better than just a single training and test set.
Instead of doing a single train/test split, we’ll split our data into a training set and test set multiple times.</p>
<p> This process for creating multiple training and test sets is called k-fold cross validation. The k is the number of chunks we split our dataset into. </p>

## 🔥 PCA
<p> Reducing the number of input variables for a predictive model is referred to as dimensionality reduction.</p>
<p> Perhaps the most popular technique for dimensionality reduction in machine learning is Principal Component Analysis, or PCA for short. This is a technique that comes from the field of linear algebra and can be used as a data preparation technique to create a projection of a dataset prior to fitting a model.</p>
<p>PCA are linear components of the original variables. They tend to capture as much variance as possible in a dataset.</p>


                🔥 Furthermore, the practice files are included in the R folder, and the datasets are included in the Data-sets folder 🔥
