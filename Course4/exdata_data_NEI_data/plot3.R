##Homework Week 4 Course 4 Plot 3##
rm(list=ls())
getwd()
setwd('/Users/simonevantaylor/Documents/Coursera/Course4/exdata_data_NEI_data')


library(dplyr)
library(magrittr)
library(ggplot2)

##reading in weird files##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

plot3q <- NEI %>% select(Emissions,year, fips, type) %>% filter(fips == "24510") 

plot3q %>%
  group_by(year,type) %>%
  summarise(Emissions = sum(Emissions)) %>%
  ggplot() + 
  aes(x = year, y = Emissions) +
  geom_col(aes(fill = year))+ 
  facet_wrap(~type)+
  labs(title = "Aggregated PM'[2.5]*' Emmissions by Year and Type in Baltimore ")

ggsave("plot3.png", width = 5, height = 5)
  

