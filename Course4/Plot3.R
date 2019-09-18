rm(list=ls())

getwd()
setwd("/Users/simonevantaylor/Documents/Coursera/Course4")

#load in data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec= ".")
head(data)   
colnames(data)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]  

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

submetering1 <- as.numeric(data$Sub_metering_1)
submetering2 <- as.numeric(data$Sub_metering_2)
submetering3 <- as.numeric(data$Sub_metering_3)

#make sure its correct


plot(datetime, submetering1, type = 'l', xlab = "", ylab = "Energy Submetering")
lines(datetime, submetering2, type = 'l',col='red')
lines(datetime, submetering3, type = 'l',col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

png("plot3.png", width=480, height=480)
plot(datetime, submetering1, type = 'l', xlab = "", ylab = "Energy Submetering")
lines(datetime, submetering2, type = 'l',col='red')
lines(datetime, submetering3, type = 'l',col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
