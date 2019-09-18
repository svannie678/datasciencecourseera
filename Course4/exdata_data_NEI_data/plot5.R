##Homework Week 4 Course 4 Plot 5##
rm(list=ls())
getwd()
setwd('/Users/simonevantaylor/Documents/Coursera/Course4/exdata_data_NEI_data')


library(dplyr)
library(magrittr)

##reading in weird files##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#plot5: motor vehicle emissions in Baltimore

plot5q <-  NEI %>% select(Emissions,year, fips, type) %>% filter(fips == "24510" & type == "ON-ROAD") 

plot5q %>%
  group_by(year)%>%
  summarise(Emissions = sum(Emissions)/1000) %>%
  ggplot +
  aes(x = year, y = Emissions) +
  geom_line()+
  labs(y = "Motor Emissions", title = "Aggregated PM 2.5 Motor Emmissions")

ggsave("plot5.png", width = 5, height = 5)

