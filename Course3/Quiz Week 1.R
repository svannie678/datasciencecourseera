##Course 3: getting and cleaning data##
##Week 1 Quiz 
ddir <-setwd("/Users/simonevantaylor/Documents/Coursera/Course3")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL,destfile = ddir,method = 'curl')

data <- read.csv("getdata_data_ss06hid.csv")
sum(data$VAL == 24,na.rm = TRUE)

head(temp)
data$FES

fileURL2 <-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL,destfile = "./quiztest.xlsx",method = 'curl')

install.packages("xl")
library(xlsx)
data2 <- read.xlsx

library(XML)
fname <- "restaurants.xml"
fileURL3 <-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
data3 <- xmlTreeParse(fileURL3,useInternalNodes = TRUE)
rootNode <- xmlRoot(data3)
xmlName(rootNode)
answer <- length(xpathApply(data3, "//zipcode[text()='21231']", xmlValue))


library(data.table)
fileURL4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
 download.file(fileURL4,destfile = "./question5.csv",method = 'curl')
DT <-  fread("question5.csv")
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time((rowMeans(DT)[DT$SEX==1];? rowMeans(DT)[DT$SEX==2]))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
