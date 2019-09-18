rm(list=ls())

getwd()
setwd("/Users/simonevantaylor/Documents/Coursera/Course4")

#load in data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec= ".")
head(data)   
colnames(data)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]      

#convert to useable date time
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(data$Global_active_power)

#make sure its correct
plot(datetime, global_active_power, type = 'l', ylab = "Global Active Power (kilowatts)")

#now plot to PNG
png("plot2.png", width=480, height=480)
plot(datetime, global_active_power, type = 'l', ylab = "Global Active Power (kilowatts)")
dev.off()


