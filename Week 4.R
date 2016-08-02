###Week 4
#str function
str(str)
str(lm)
str(ls)
x <- rnorm(100,2,4)
summary(x)
str(x)
f <- gl(40,10)
str(f)
summary(f)
library(datasets)
head(airquality)
str(airquality)
m <- matrix(rnorm(100),10,10)
str(m)
s <- split(airquality, airquality$Month)
str(s)

#Simulation
dnorm(x, mean=0, sd=1)
x <- rnorm(10)
x
x <- rnorm(10,20,2)
x
summary(x)
set.seed(1) #set seed to get same random number list
rnorm(5)
rnorm(5)
set.seed(1)
rnorm(5)
#Always set the seed to get double check
#Generating Poisson data
rpois(10,1)
rpois(10,2)
rpois(10,20)
ppois(2,2) #Porb. of rate less than 2

#Generating Random Bumbers from a linear model
set.seed(20)
x <- rnorm(100)
e <- rnorm(100,0,2)
y <- 0.5+2*x+e
summary(y)
plot(x,y)

set.seed(10)
x <- rbinom(100,1,0.5)
e <- rnorm(100,0,2)
y <- 0.5+2*x+e
summary(y)
str(x)
plot(x,y)

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5+0.3*x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x,y)

#Random Sampling
set.seed(1)
sample(1:10,4)
sample(letters,5)
sample(1:10)
sample(1:10) 
sample(1:10, replace=TRUE) #Sampling with replacement

#Profie your R code
system.time()
#Rprof()
#summaryRprof()
#Do not use system.time() and Rprof() at the same time

#Quiz 4
set.seed(1)
rpois(5, 2)
