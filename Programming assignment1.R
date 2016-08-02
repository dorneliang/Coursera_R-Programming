##Programming assignment 1: Air Pollution
getwd()
setwd("/Users/chengdong/Desktop/Coursera_R Programming")
getwd()
#Part 1
pollutantmean <- function(directory, pollutant, id= 1:332){
        files_full <- list.files(directory, full.names= TRUE)
        selectData <- data.frame()
        for (i in id){
                selectData <- rbind(selectData,read.csv(files_full[i]))
        }
        mean(selectData[,pollutant], na.rm=TRUE)
}
pollutantmean("specdata", "sulfate", 1:10)

#Part 2
complete <- function(directory, id = 1:332) {
        files_full <- list.files(directory, full.names = TRUE)
        selectData <- data.frame()
        
        for (i in id) {
                moni_i <- read.csv(files_full[i])
                nobs <- sum(complete.cases(moni_i))
                tmp <- data.frame(i, nobs)
                selectData <- rbind(selectData, tmp)
        }
        
        colnames(selectData) <- c("id", "nobs")
        selectData
}
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

#Part 3
corr <- function(directory, threshold = 0) {
        files_full <- list.files(directory, full.names = TRUE)
        dat <- vector(mode = "numeric", length = 0)
        
        for (i in 1:length(files_full)) {
                moni_i <- read.csv(files_full[i])
                csum <- sum((!is.na(moni_i$sulfate)) & (!is.na(moni_i$nitrate)))
                if (csum > threshold) {
                        tmp <- moni_i[which(!is.na(moni_i$sulfate)), ]
                        submoni_i <- tmp[which(!is.na(tmp$nitrate)), ]
                        dat <- c(dat, cor(submoni_i$sulfate, submoni_i$nitrate))
                }
        }
        
        dat
}
cr <- corr("specdata", 150)
head(cr)
length(list.files("specdata",full.names=TRUE))
cr <- corr("specdata", 400)
head(cr)
summary(cr)
length(cr)

#q1
pollutantmean("specdata", "sulfate", 1:10)
#q2
pollutantmean("specdata", "nitrate", 70:72)
#q3
pollutantmean("specdata", "sulfate", 34)
#q4
pollutantmean("specdata", "nitrate")
#q5
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
#q6
cc <- complete("specdata", 54)
print(cc$nobs)
#q7
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
#q8
cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
#q9
cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)
#q10
cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))

