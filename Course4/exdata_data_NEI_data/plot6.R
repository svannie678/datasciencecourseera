##Homework Week 4 Course 4 Plot 6##
rm(list=ls())
getwd()
setwd('/Users/simonevantaylor/Documents/Coursera/Course4/exdata_data_NEI_data')


library(dplyr)
library(magrittr)

##reading in weird files##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#plot6: Motor Emissions Between LA and Baltimore)

plot6q <-  NEI %>% select(Emissions,year, fips, type) %>% filter(fips == "24510" | fips== "06037")  %>% filter (type == "ON-ROAD")


plot6q %>%
  group_by(year,fips)%>%
  summarise(Emissions = sum(Emissions)) %>%
  ggplot +
  aes(x = year, y = Emissions, color = fips) +
  geom_line() + 
  labs(y = "Motor Emissions", title = "Motor Emmissions in LA(06037) versus Baltimore (25410") 

ggsave("plot6.png", width = 5, height = 5)



