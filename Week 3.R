##Week 3
#Loop function
#lapply: Loop over a list and evaluate a function on each element
#sapply: Same as lapply but try to simplify the result
#apply: Apply a function over the margins of an array
#tapply: Apply a function over subsets of a vector
#mapply: Multivariate version of lapply
x <- list(a=1:5,b=rnorm(10))
lapply(x,mean)
#lapply always returns a list
x <- 1:4
lapply(x,runif,min=0,max=10) #still returns a list
#lapply make friends with many anonymous functons
#sapply
#if the result is a list where every element is length 1, then a vctor is returned
#the same length>1, returns a matrix 
#apply
#often use to rows and columns of a matrix
x <- matrix(rnorm(200),20,10)
apply(x,2,mean)
apply(x,1,sum)
#column:2; row:1;
apply(x,1,quantile,probs=c(0.25,0.75)) #returns a 2*20 matrix
a <- array(rnorm(2*2*10), c(2,2,10))
apply(a,c(1,2),mean)
rowMeans(a,dims=2)
#mapply e.g.suppose 2 lists
list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
mapply(rep,1:4,4:1) #same result with above
noise <- function(n,mean,sd){
        rnorm(n,mean,sd)
}
noise(5,1,2)
noise(1:5,1:5,2)
mapply(noise,1:5,1:5,2) #get 1 with mean 1,2 with mean 2,... 
list(noise(1,1,2), noise(2,2,2), noise(3,3,2), noise(4,4,2), noise(5,5,2)) #same result with above
#tapply 
#used to apply a function over subsets of a vector
x <- c(rnorm(10), runif(10), rnorm(10,1))
x
f <- gl(3,10) #create a factor variable f with 3 levels:1,2,3 each for 10
f
tapply(x,f,mean)
tapply(x,f,mean,simplify = F) #return a list
tapply(x,f,range)
#split
#always return a list
#identical with tapply whtiout the statistics
split(x,f)
lapply(split(x,f),mean)
library(datasets)
head(airquality)
tapply(airquality,airquality$Month,mean) #doesn't work
s <- split(airquality, airquality$Month)
lapply(s,function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")]))
sapply(s,function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")], na.rm=TRUE))
#splitting on more than one level
x <- rnorm(10)
f1<- gl(2,5)
f2 <- gl(5,2)
f1
f2
interaction(f1,f2) #combinations of 2 levels
str(split(x,list(f1,f2)))
split(x,list(f1,f2))
x
str(split(x,list(f1,f2),drop=TRUE))
#Debugging
log(-1) #produce a warning
#all print function returns the object it prints
#Debugging tools in R
#traceback trace where the error occurs
#debug flag the funciton for "debug" mode
#brower suspends the execution of a finction
#trace
#recover

##Quiz 3
#q1
library(datasets)
data(iris)
head(iris)
s <- split(iris,iris$Species) #s is a list
head(s)
mean(s$virginica$Sepal.Length)
#or
sapply(split(iris$Sepal.Length, iris$Species),mean)
#q2
colMeans(iris)
apply(iris,2,mean)
apply(iris[,1:4],1,mean)
rowMeans(iris[,1:4])
apply(iris[,1:4],2,mean)
apply(iris[,1:3],2,mean)
head(iris)
apply(iris,2,mean)
#q3
library(datasets)
data(mtcars)
head(mtcars)
tapply(mtcars$mpg, mtcars$cyl, mean)
apply(mtcars, 2, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)
sapply(mtcars, cyl, mean)
split(mtcars, mtcars$cyl)
with(mtcars, tapply(mpg, cyl, mean))
tapply(mtcars$mpg,mtcars$cyl,mean)
lapply(mtcars, mean)
mean(mtcars$mpg, mtcars$cyl)
tapply(mtcars$cyl, mtcars$mpg, mean)
#q4
head(mtcars)
x <- with(mtcars,tapply(hp,cyl,mean))
x[3]-x[1]
#q5
debug(ls)
ls()
undebug()
debugonce()

