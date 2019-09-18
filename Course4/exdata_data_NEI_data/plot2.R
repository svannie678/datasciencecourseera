##Homework Week 4 Course 4 Plot 2##
rm(list=ls())
getwd()
setwd('/Users/simonevantaylor/Documents/Coursera/Course4/exdata_data_NEI_data')


library(dplyr)
library(magrittr)

##reading in weird files##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##plot2:

plot2q <- NEI %>% select(Emissions,year, fips) %>% filter(fips == "24510") %>% aggregate(Emissions ~ year,.,sum)

png('plot2.png')
barplot(height = plot2q$Emissions/1000, names.arg = plot2q$year,
        xlab = "Year", ylab = expression("Aggregate Emissions"),
        main = expression('Aggregated PM'[2.5]*' Emmissions by Year in Baltimore'),col=plot2q$year)
dev.off()

#no, emissions increased in 2005!


