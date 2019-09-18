##Homework Week 4 Course 4 Plot 1##
rm(list=ls())
getwd()
setwd('/Users/simonevantaylor/Documents/Coursera/Course4/exdata_data_NEI_data')


library(dplyr)
library(magrittr)

##reading in weird files##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##plot 1: PM2.5 by year##


plot1q <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(height = plot1q$Emissions/1000, names.arg = plot1q$year,
        xlab = "Year", ylab = expression("Aggregate Emissions"),
        main = expression('Aggregated PM'[2.5]*' Emmissions by Year'),col=plot1q$year)

dev.off()
#yes they have decreased!




