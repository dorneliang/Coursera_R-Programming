add2 <- function(x,y){
  x+y
} #Returns the last expression, that is x+y
add2(2,4)

above10 <- function(x){
  use <- x> 10
  x[use]
}

above <- function(x,n=10){ #set default value n=10 that users do not need to set n
  use <- x>n
  x[use]
}
x <- 1:20
above(x)
above(x,12)

columnmean <- function(y, removeNA=T){
  nc <- ncol(y)
  for(i in 1:nc){
    x[i] <- mean(y[,i], na.rm=removeNA)
    print(x[i])
  }
  
}
columnmean(airquality)
airquality
columnmean(airquality,FALSE)
head(airquality)
mean(airquality[,3])
