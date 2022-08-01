# data manipulation in r
# the tidyr package helps you create tidy data, a tidy data
# is easy to visualize and model
# gather(make wide data longer), 
# spread(makes long data wider),
# separate(split a col into multiple cols),
# unite(combine multiple cols)

# %>% is called the forward pipe operator in R. 
# It provides a mechanism for chaining 
# commands with a new forward-pipe operator, %>%. 
# This operator will forward a value, or the result of an expression, 
# into the next function call/expression. It is defined by the package magrittr (CRAN) and
# is heavily used by dplyr (CRAN).

install.packages("tidyr")
library('tidyr')

n=10
wide <- data.frame(
  ID = c(1:n),
  Face.1 = c(411,723,326,456,579,622,709,513,527,319),
  Face.2 = c(122,333,434,553,532,578,976,433,422,667),
  Face.3 = c(546,756,345,123,456,789,809,456,79,456)
)

View(wide)

# gather()-reshaping data from wide format to long format
long <- wide %>% gather(Face, ResposeTime, Face.1:Face.3)
View(long)

# separate()-splits a single col into multiple cols
long_separate <- long%>%separate(Face, c("target", "number"))
View(long_separate)

# unite()-combines multiple cols into one
long_unite <- long_separate%>%unite(Face, target, number, sep = ".")
View(long_unite)

# spread()-takes two columns(key and value) and spreads
# in to multiple columns, it makes long data wider
back_to_wide <- long_unite%>%spread(Face, ResposeTime)
View(back_to_wide)
