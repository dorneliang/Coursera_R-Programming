##R Programming Week 1
getwd()
dir() #List all files in directory
setwd("/Users/chengdong/Desktop/Coursera_R Programming")
getwd()
myfunction <- function(x) {
  y <- rnorm(100)
  mean(y)
}
source("myfunction.R") #Read R code from a file
myfunction #List the content of the file
myfunction(1) #Use the file
x <-1
print(x)
msg <- "hello"  
print(msg)
x <- 1:20
x
#R has 5 classes of objects: character, numeric, integer, complex, logical
#The most basic object is a vector; A vector can only contain objects of the same class
#list is a exception, which is represented s a vector but can contain objects of different classes
vector()
1
1L #integer
1/Inf #R has Infinity
1/0
0/0 #Get NaN, means the result is not a number
#Attributes: names, dimnames, dimensions, class, length, other user-defined attributes/metadata
attributes(X) #General way to get attributes of objects
#Use c() as concatenate
x <- vector("numeric", length=10) #Default for numeric vector is 0
x
y <- c(1.7, "a")
y
class(y)
y <- c(TRUE, 2) #TRUE treat as 1, FALSE as 0
class(y)
y <- c("a", TRUE)
class(y)
#Explicit Coercion
x <- 0:6
class(x)
as.numeric(x)
class(x)
as.logical(x)
class(x)
as.character(x) #Although x has been converted into character, class(x) still shows "interger"
class(x)
x <- c("a", "b", "c")
as.numeric(x)
#List
x <- list(1,"a",TRUE,1+4i ) #Magic of List
x
#Matrix
m <- matrix(nrow=2, ncol=3)
m
dim(m)
attributes(m)
m <- matrix(1:6, nrow=2, ncol=3)
m
m <-1:10
m
dim(m) <- c(2,5) #Assign a value to dim
m
x <- 1:3
y <- 10:12
cbind(x, y)
rbind(x, y)
#Factor
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x) #Count "yes" and "no"
unclass(x) #Strips out the class for a factor 
class(x) #Still factor
x <- factor(c("yes", "yes", "no", "yes", "no"), levels=c("yes", "no")) #specify the first level is "yes" (Bsae line)
x
#Missing value
is.na(x)
is.nan(x)
is.na(NaN) #NaN is a na value; NA is just missing, NaN has no meaning
is.nan(NA) #NA value is not a NaN value
x <- c(1,2,NA,10,3)
is.na(x)
is.nan(x)
x <- c(1,2,NaN,NA,4)
is.na(x)
is.nan(x)
#Data frame
#Data frame can store different classes of objects in each column (just like lists)
#Data frame also have a special attribute called row.names
#Data frame are usually created by calling read.table() or read.csv()
#Data frame can be converted to a matrix by calling data.matrix
T <-TRUE
F <-FALSE
x <- data.frame(foo=1:4, bar= c(T,T,F,F)) #??????????????????????????????????????Why I cannot create a data frame; Must ues TRUE and FALSE instead of T and F; Because I redefined T as a lm()
#Names
#Name for vector
x <-1:3
names(x)
names(x) <- c("foo", "bar", "norf") #Assign name for each vector in x
x
names(x)
#Name for list
x <- list(a=1, b=2, c=3) #Assign name for list
x
Name for matrix
m <- matrix(1:4, nrow=2, ncol=2)
dimnames(m) <-list(c("a", "b"), c("c", "d")) #Use list function to assign a and b for row name and c and d for column name
m
#Reading Tabular data
#For samll to moderately sized datasets, use read.table without specifying any other arguments
#Eg data <- read.table("foo.txt")
#read.csv is identical to read.table (Default is a Space) except the default separator is a comma
#Reading in Larger datasets with read.table
#set comment.char="" if there are no commented lines in your file
#Sepcify colClasses can make read.table run much faster:Eg-colClasses="numeric"
#A quick and dirty way to figure out the classes of each column is the following:
#initial <- read.table("datatable.txt", nrows=100)
#classes <- sapply(initial, class)
#tabAll <- read.table("datatable.txt", colClass=classes)
getwd()
list(getwd())
initial <- read.table("Communities.csv", nrows=100)
classes <- sapply(initial, class)
classes
tabAll <- read.table("Communities.csv", colClass=classes)
head(tabAll)
#Set nrows doesn't make R run faster but it helps with memory usage
#Textual Formats
y <- data.frame(a=1, b="a")
dput(y)
#Result of dput(y)
#structure(list(a=1, b=structure(1L, .Label="a", class="factor")), .Names=c("a", "b"), row.names=c(NA,-1L),class="data.frame")
dput(y,file="y.R") #Dput the object into a file, "y.R exists in current directory
new.y<-dget("y.R") #Using Dget read the object into R
new.y
y
#Dumping R object
x <- "foo"
y <- data.frame(a=1, b="a")
dump(c("x", "y"),file="data.R") #Multiple objets can be deparsed suing the dump function and read back in using source
#data.R exists in current directory
rm(x,y) #remove x and y
source("data.R")
y
x
#Interfaces to the Outside World
str(file)
# con <- file("foo.txt, "r"")
# data <-read.csv(con)
# close(con)
# data <- read.csv("foo.txt") #the same function as upper 3 lines, thus some times do not need connections
# con <- gzfile("words.gz")
# x <- readLines(con,10) #Read the fist 10 lines
# x
# Reading lines of a text file
#This might take time --> not at all
con <- url("http://www.jhsph.edu", "r")
x <-readLines(con)
head(x)
#Subsetting
x <- c("a", "b", "c", "c", "d", "a")
x[1] #subset x use a numeric index 1
x[2] #index 2
x[1:4] #index 1:4
x[x>"a"] #Logical index >a
u <- x>"a" #Create a logical vector u
x[u] #get all elements greater than a
#Subsetting List
x <- list(foo=1:4, bar=0.6)
x[1] #extract 1th element of list; 1,2,3,4 with the list
x[[1]] #1,2,3,4 without the list; different output with x[1]
x$bar #elements associated with name bar
x[["bar"]] #the same with above
x["bar"] #the list with a element bar in it
#Because [] always return a list if one going to subset list
#Extract multiple elements of a list
x <- list(foo=1:4, bar=.6, baz="hello")
x[c(1,3)] #Just use [], cannot use[[]] or $
#Computing index, one can just use [[]] other than $
name <-"foo" 
x[[name]] #Use[[]] to extract element
x$name #Doesn't work
x$foo
#subsetting nested elements of a list
x <- list(a=list(10,12,14), b=c(3.14,2.81)) #14 is the third elements of the first element of list
x[[c(1,3)]]
x[[1]][[3]]
x[[c(2,1)]]
#Subsetting a Matrix
x <- matrix(1:6,2,3)
x[1,2] #1th row, 2 column
x
x[2,1]
x[1,]
x[,2]
#Subset a matrix, don't get a matrix, just a vector
x[1,2,drop=F] #drop the demension set as false, get a 1 by 1 matrix
x[1,,drop=FALSE] #Get a 1*3 matrix
#Partial Matching
x <-list(aardvark=1:5)
x$a #just type "a", the $looks for a name in this list that matches the letter a
x[["a"]] #Null because [[]] is more strict than $
x[["a",exact=F]] #just type "a", looks for a name in this list that matches the letter a by setting exact=F
#Removing NA Values
x <- c(1,2,NA,4,NA,5) #Create a logical vector tells you where the NA value is and subsetting x 
bad <- is.na(x) #logical vector
x[!bad]
bad
#multiple things so that take the subset with no missing values
x <- c(1,2,NA,4,NA,5)
y <- c("a","b",NA,"d",NA,"f")
good <- complete.cases(x,y) #complete.cases telle one that in each position, 2 elements are both no missing
good
x[good]
y[good]
#Vectorized operations
x <-1:4; y <- 6:9
x+y
x>2
x>=2
y==8
x*y
x/y
x <-matrix(1:4,2,2)
y <- matrix(rep(10,4),2,2)
x*y #element-wise multiplication
x
x/y
x%*%y ##Ture matrix multiplication
###Quiz 1
#4
x <-4L
class(x)
#5
x<-c(4,"a",TRUE)
class(x)
#6
x <- c(1,3,5); y <- c(3,2,10)
z <-rbind(x,y)
class(z)
#8
x <- list(2, "a", "b", TRUE)
x[[2]]
#9
x <- 1:4; y <- 2:3
x+y
#10
x <- c(17, 14, 4, 5, 13, 12, 10)
x[x>10]==4
x
x[x>10]<-4
x
x[x==10]<-4
x
x[x==4]>10
x
x[x>=11]<-4
x[x>4]<-10
x
x[x<10]<-4
x[x>=10]<-4
x
#11
q11 <- read.csv("hw1_data.csv")
names(q11)
head(q11)
#q12
q11[c(1,2),]
#13
nrow(q11)
#14
tail(q11,2)
q11[c(152,153),]
#15 What is the value of Ozone in the 47th row?
q11[47,"Ozone"]
#16 How many missing values are in the Ozone column of this data frame?
x <- q11[,"Ozone"]
class(x)
head(x)
is.na(x)
table(is.na(x))
summary(is.na(x))
#17
q17 <-subset(q11,!is.na(Ozone))
head(q17)
x <-q17[,"Ozone"]
head(x)
mean(x)
#18
sub = subset(q11, Ozone > 31 & Temp > 90, select = Solar.R)
nrow(sub)
apply(sub, 2, mean)
head(sub)
head(y)
x
sub
#19 What is the mean of "Temp" when "Month" is equal to 6?
q19 <- subset(q11, Month==6, select=Temp)
head(q19)
apply(q19,2,mean) #2  for column
apply(q19,1,mean) #1 for row
?apply
#20 What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
q20 <- subset(q11, Month==5 & !is.na(Ozone), select=Ozone)
apply(q20,2,max)
head(q20)
