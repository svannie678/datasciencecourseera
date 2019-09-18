###statistical inference coursera final project##

rm(list=ls())
setwd("/Users/simonevantaylor/Documents/DataScience_Coursera")

library(ggplot2)
library(magrittr)
library(tidyverse)

##helpful code
hist(runif(1000))

mns = NULL
for (i in 1 : 1000) mns = c(mns, mean(runif(40)))
hist(mns)

##question 1: Show the sample mean and compare it to the theoretical mean distribution
#set seed
set.seed(12345)
n <- 40 
lambda = .2
sim <- 1000
simmean <- NULL 
for(i in 1:sim) {
  simmean <- c(simmean, mean(rexp(n, lambda)))
}
mean(simmean) ##the simulation mean is 4.97
theomean <- 1/lambda ##theoretical mean is 5, therefore our sample is quite close to the theoretical mean


##question 2: Show the sample is (via variance) and compare it to the thoretical variance of the distribtution.

samplevariance <- var(simmean)
theovariance <- (lambda * sqrt(n))^-2
##not large difference between the theoretical variance and the sample variance


##question 3: Show that the distribution is appoximately normal
hist(simmean,breaks = n, prob = TRUE, xlab = "means", main = "sample mean versus theoretical mean")
abline(v = theomean, pch =30, col = "green")
abline(v = mean(simmean), pch = 30, col = "blue")



hist(simmean,breaks = n, prob = TRUE, xlab = "means", main = "sample variance versus theoretical variance")
x <- seq(min(simmean), max(simmean), length = 100)
y <- seq(min(1/lambda), max(1/lambda), length = 100)
lines(y, dnorm(y, mean = 1/lambda, sd = (1/lambda/sqrt(n))), pch = 25, col = "green")
lines(x, dnorm(x, mean = 1/lambda, sd = (1/lambda/sqrt(n))), pch = 25, col = "blue")


qqnorm(simmean)


qqline(simmean, col = "blue")

###PART 2 PROJECT 

#load in data
toothgrowth <- ToothGrowth

#explore the data 
head(toothgrowth)
unique(toothgrowth$supp)
unique(toothgrowth$dose)
summary(toothgrowth)
#whats the mean of the toothgrowth by supplement? 
toothgrowth %>% 
  group_by(supp) %>%
  summarise(mean(len))

##seems like its a little longer for OJ 

##whats the mean by dose? 
toothgrowth %>% 
  group_by(dose) %>%
  summarise(mean(len))
##seems like the higher the dose the better 

#lets visualize this: 
toothgrowth %>%
  ggplot(aes(x = as.factor(dose), y = len, fill = supp))+ 
  geom_boxplot()+ 
  labs(xlab = "dose", ylab = "length", title = "Tooth Length vs Dose by Delivery")

##looks like theres a basic trend that as dose goes up length goes up. But is it significant? and is there an effect of supplement? 

t.test(len~supp, data = toothgrowth)
#confidence int crosses 0 and y is not less than 5 therefore we fail to reject the null hypothesis. Looks to be no significant difference between supplement type 

toothgrowth_sub <- filter(ToothGrowth, ToothGrowth$dose == 1.0|ToothGrowth$dose == 0.5)
t.test(len~dose,data=toothgrowth_sub)

toothgrowth_sub <- filter(ToothGrowth, ToothGrowth$dose == 0.5|ToothGrowth$dose == 2.0)
t.test(len~dose,data=toothgrowth_sub)

toothgrowth_sub <- filter(ToothGrowth, ToothGrowth$dose == 1.0|ToothGrowth$dose == 2.0)
t.test(len~dose,data=toothgrowth_sub)

##for all t tests we reject the null hypothesis and the confidence int did not pass through zero. 