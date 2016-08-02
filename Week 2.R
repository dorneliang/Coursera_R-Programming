##Week 2
#If else
if(x>3){
        y<-10
} else{
        y<-0
}
x=3
y<-if(x>3){
        10
} else{
        0
}
x=4
y
#else clause is not necessary
#for loops
for(i in 1:10){
        print(i)
}
x <- c("a","b","c","d")
for(i in 1:4){
        print(x[i])
}

for(i in seq_along(x)){ #seq_along create a integer sequence
        print(x[i])
}
seq_along(x) #output1,2,3,4
for(letter in x){
        print(letter)
}

for(i in 1:4) print(x[i]) #No {}
x <- matrix(1:6,2,3)
for(i in seq_len(nrow(x))){
        for(j in seq_len(ncol(x))){
                print(x[i,j])
        }
}
x
seq_len(nrow(x))
seq_len(ncol(x))
seq_along(nrow(x))
#While loop
count <- 0
while(count <10){
        print(count)
        count <- count+1
}

z<- 5
while(z>=3 && z<=10){
        print(z)
        coin<-rbinom(1,1,0.5)
        
        if(coin==1){##random walk
                z<- z+1
        } else{
                z<- z-1
        }
}
#One want to use the long forms only when you are certain the vectors are length one; Difference between && and &
rbinom(1,1,0.5)
rbinom(100,100,0.5)
sample(c(0,1), 100, replace = TRUE,prob=c(0.5,0.5))
#repeat
x0 <- 1
tol <- 1e-8
repeat{
        x1 <- computeEstimate()
        
        if(abs(x1-x0)<tol){
                break
        } else{
                x0 <- x1
        }
}
#next
for(i in 1:100){
        if(i<=20){
                ##skip the first 20 iterations
                next
        }
        print(i)
        ##Do something here
}
#Functions
#The return value of a function is the last expression in the function body to be evaluated
#R functions arguments can be matched positionally or by name
#Lazy Evaluation
f <-function(a,b){
        a^2
}
f(2)

f <- function(a,b){
        print(a)
        print(b)
}
f(45) #Return a error because no matching
#"..." argument indicate a variable number of arguments that are usually passed on to other function
myplot <- function(x,y,type="1",...){
        plot(x,y,type=type,...)
}
search()
#Lexical scoping in R means that the values of free variables are searched for in the environment in which the function was defined
#An environment is a collection of (symbol, value) pairs, i.t. x is a symbol and 3.14 might be its value
#Every environment has a parent environment; it is possible for an environment to have multiple "children"
#the only environment without a parent is the empty environment
#A function + an environment= a closure or function closure
make.power <- function(n){
        pow <-function(x){
                x^n
        }
        pow
}
cube <-make.power(3)
square <- make.power(2)
cube(3)
square(2)
square(3)
#What's in a function's environment?
ls(environment(cube)) #output:"n"   "pow"
get("n", environment(cube)) #output 3
ls(environment(square))
get("n",environment(square))
get("pow",environment(square)) #function(x){x^n}
y<- 10
f <- function(x){
        y<-2
        y^2+g(x)
}
g<- function(x){
        x*y
}
f(3)
sigma
rnorm(100,1,2)
#Code standard
#Dates and Times
#Dates are stored internally as the number of days since 1970-01-01
x <- as.Date("1970-01-01")
x
unclass(x) #0
unclass(as.Date("1970-01-02")) #1
x <- Sys.time()
x
p <- as.POSIXlt(x)
names(unclass(p))
p$sec
unclass(x)
p <-as.POSIXlt(x)
p$sec
#strptime function in case your dates are written in a different format
datestring <- c("January 10, 2012 10:40","December 9, 2011 9:10")
x<- strptime(datestring, "%B %d, %Y %H:%M")
x
class(x)
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x-y #error
x <-as.POSIXlt(x)
x-y

#Quiz 2
#Q2
x <- 1:10
if(x>5){
        x <- 0
}
#Q3
f <- function(x){
        g <- function(y){
                y+z
        }
        z <- 4
        x+g(x)
}
z <- 10
f(3)
#q4
x <- 5
y <- if(x<3){
        NA
}else{
        10
}
y
#q5
h <- function(x, y = NULL, d = 3L) {
        z <- cbind(x, d)
        if(!is.null(y))
                z <- z + y
        else
                z <- z + f
        g <- x + y / z
        if(d == 3L)
                return(g)
        g <- g + 10
        g
}

