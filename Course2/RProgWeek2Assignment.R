#course2 week 2 programming assignment 
#purpose of this script is to get comfortable w function writing etc 

rm(list=ls())
library(tidyverse)
library(magrittr)
directory <- setwd("/Users/simonevantaylor/Documents/Coursera/")

#need to write a function to specify the mean of a pollutant across one or more monitors, and also removes NA


pollutantmean <- function(directory,pollutant,id = 1:332){
  filenames <- list.files(path=directory,pattern = "*.csv",full.names = TRUE)
  values <-  numeric()
  
  for (i in id){
    data <- read.csv(filenames[i])
    values <- c(values,data[[pollutant]])
  }

  mean(values,na.rm = TRUE)
}

check1 <- pollutantmean(directory,"sulfate",id = 1:10)
check2 <- pollutantmean(directory,"nitrate",id = 70:72)


complete <- function(directory, id= 1: length(filenames)){
  filenames <- list.files(path=directory,pattern = "*.csv",full.names = TRUE)
  nobs <- numeric()
  
  for (i in id) {
    data <-read.csv(filenames[i])
    nobs <- c(nobs,sum(complete.cases(data)))
  }

  
  data.frame(id,nobs)
  
}

completedata <-complete(directory)
completedata <- rename(completedata, ID = id)
head(completedata)


corr <- function(directory, threshold = 0){
  path <- paste0(getwd(),"/", directory)
  corr_vect <- numeric()
  for (i in 1:332) {
    if (i < 10) {
      dat <- read.csv(paste(path,"/00", as.character(i),".csv", sep = ""), 
                      as.is = T, 
                      header = T)
    }
    else if (i < 100) {
      dat <- read.csv(paste(path,"/0", as.character(i),".csv", sep = ""), 
                      as.is = T, 
                      header = T)
    }
    else {
      dat <- read.csv(paste(path,"/", as.character(i),".csv", sep = ""), 
                      as.is = T, 
                      header = T)
    }
    
    data <- dat[complete.cases(dat),]
    if (nrow(data) > threshold) {
      corr_vect <- c(corr_vect, cor(data[,"sulfate"], data[, "nitrate"]))
    }
  }
  
  return(corr_vect)
}

cr <- corr("specdata", 150)
head(cr,6)
