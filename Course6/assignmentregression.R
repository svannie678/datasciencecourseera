##Assignment for Regression Course Rough Draft##
#The purpose of this assignment is play around with the mtcars data set and understand it##
rm(list=ls())
library(ggplot2)
library(lme4)
library(magrittr)
library(tidyverse)

#load in data and play around with it: We want to know is automatic or manual better for MPG? 
data("mtcars")
head(mtcars)

mtcars$am %<>% as.factor()
levels(mtcars$am)=c("AT","MT")

mtcars %>%
  group_by(am) %>%
  summarise(avgmpg = mean(mpg))

mtcars %>%
  ggplot(aes(am,mpg)) + 
  geom_boxplot()

#so from this exploratory analysis it looks as if mpg is higher for an manual car as opposed to an automatic.
#But lets explore this with regression! 

fit1 <- lm(mpg ~ factor(am), data = mtcars)
summary(fit1)

coef(fit1)
#this shows that manual transmission adds 7.245 increase to mpg. this is a significant relationship however r^2 is .3385 showing that 
#only 34% of the variance in mpg is accounted for with tranmission type 

#because we don't have a theoretical reason for other variables that may impact mpg, we will run a 
#stepwise regression, which will give us the variables that explain the variance of mpg the most

fit2 <- step(lm(mpg~.,mtcars))
summary(fit2)

#The step model allows us to pick the variables that affect mpg the most. From this we can see that weight and qsec (or acceleration)
#also impact the mpg. It also changes the estimate for manual's impact on mpg, saying that holding the other variables constant 
# manual tranmission increases the mpg by 2.93 miles. 


#beyond R^2, how else can we explore how well our model fits the data?
##checking the residuals: 
par(mfrow = c(2,2))
plot(fit2)

#overall the residual plots show us that the model is fit fairly well to the data. 
#The residuals versus fitted graph is distributed normally, the q-q plot falls along the line and 
#hthe residuals versus location doesnt violate cooks distance.
#however the scale-location graph increases linearily which shows us that there may not be equal variance

#other measures

influence.measures(fit2)
confint.lm(fit2)

mtcars %>%
  ggplot(aes(x = am, y = mpg), color = am) + 
  geom_point() + 
  geom_abline(fit1)

?geom_abline

plot(mpg ~ am, data = mtcars)
abline(fit1)
