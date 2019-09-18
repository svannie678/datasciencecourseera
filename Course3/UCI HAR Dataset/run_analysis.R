###purpose of this script###


rm(list=ls())
library(tidyverse)
library(magrittr)
directory <- setwd("/Users/simonevantaylor/Documents/Coursera/Course3/UCI HAR Dataset")

variables <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")
colnames(activity_labels) <- c("activityID","activityType")

#Read in the training data 
xtrain <- read.table("./train/X_train.txt")
colnames(xtrain) <- variables[,2]
ytrain <- read.table("./train/y_train.txt")
colnames(ytrain) <- "activityID"
subtrain <- read.table("./train/subject_train.txt")
colnames(subtrain) <- c("subjID")


trainingdata <- cbind(ytrain,subtrain,xtrain)

#read in the testing data
xtest <- read.table("./test/X_test.txt")
colnames(xtest) <- variables[,2]
ytest <- read.table("./test/y_test.txt")
colnames(ytest) <- "activityID"
subtest <- read.table("./test/subject_test.txt")
colnames(subtest) <- c("subjID")

testingdata <- cbind(ytest,subtest,xtest)

##1 Merge the training and the test sets to create one data set.
  
rawdata <- rbind(trainingdata,testingdata)

##2 Extract only the measurements on the mean and standard deviation for each measurement.
data <- rawdata[,grep(("mean\\(\\)|std"),x = names(rawdata))]
#but I still want activity and activity ID and subject ID
data <- cbind(rawdata[,1:2],data)


## 3 Use descriptive activity names to name the activities in the data set
data <- merge(data,activity_labels,by= 'activityID', all.x = TRUE)


## 4Appropriately labels the data set with descriptive variable names.

columns = colnames(data)

##5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.