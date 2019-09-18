##Homework Week 4 Course 4 Plot 4##
rm(list=ls())
getwd()
setwd('/Users/simonevantaylor/Documents/Coursera/Course4/exdata_data_NEI_data')


library(dplyr)
library(magrittr)

##reading in weird files##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##plot 4: Coal related changed
coalrelated <- SCC %>% select(SCC,Short.Name) %>% left_join(.,NEI,by = "SCC")
coalrelated$coal <- grepl("Coal",coalrelated$Short.Name)
coalrelated <- coalrelated %>% filter(coal == TRUE)


coalrelated %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions)/1000) %>%
  ggplot + 
  aes(x = year, y = Emissions) +
  geom_col(aes(fill = year)) + 
  labs(y = "Coal Emissions", title = "Aggregated PM'[2.5]*' Coal Emmissions Across the USA ")

ggsave("plot4.png", width = 5, height = 5)


