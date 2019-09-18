rm(list=ls())

getwd()
setwd("/Users/simonevantaylor/Documents/Coursera/Course4")

#load in data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec= ".")
head(data)   
colnames(data)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]  

#manipulate data

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

global_active_power <- as.numeric(data$Global_active_power)
globalReactivePower <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
submetering1 <- as.numeric(data$Sub_metering_1)
submetering2 <- as.numeric(data$Sub_metering_2)
submetering3 <- as.numeric(data$Sub_metering_3)

#test it out 
par(mfrow = c(2, 2)) 
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", ylab="Voltage", cex=0.2)

plot(datetime, submetering1, type = 'l', xlab = "", ylab = "Energy Submetering")
lines(datetime, submetering2, type = 'l',col='red')
lines(datetime, submetering3, type = 'l',col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = ,lwd=2.5, col=c("black", "red", "blue"), bty = 'o')

plot(datetime, globalReactivePower, type="l", ylab="Voltage", cex=0.2)

#plot it 
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", ylab="Voltage", cex=0.2)

plot(datetime, submetering1, type = 'l', xlab = "", ylab = "Energy Submetering")
lines(datetime, submetering2, type = 'l',col='red')
lines(datetime, submetering3, type = 'l',col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = ,lwd=2.5, col=c("black", "red", "blue"), bty = 'o')

plot(datetime, globalReactivePower, type="l", ylab="Voltage", cex=0.2)
dev.off()
