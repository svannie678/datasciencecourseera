rm(list=ls())

getwd()
setwd("/Users/simonevantaylor/Documents/Coursera/Course4")

#load in data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec= ".")
head(data)   
colnames(data)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]                   

#make sure its correct 
global_active_power <- as.numeric(data$Global_active_power)
hist(global_active_power, col = "red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")


#now plot to PNG
png("plot1.png", width=480, height=480)
hist(global_active_power, col = "red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
