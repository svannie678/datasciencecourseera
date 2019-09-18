##Quiz 3##

rm(list=ls())
data("mtcars")
head(mtcars)

fit <- lm(mpg ~ factor(cyl) + wt, mtcars)
summary(fit)

fit2 <- lm(mpg ~ factor(cyl), mtcars)
summary(fit2)

fit3 <- lm(mpg ~ factor(cyl) * wt, mtcars)
summary(fit3)

anova(fit,fit3)

x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)

fit4 <- lm(y~x)
influence(fit4)$hat

x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)

influence.measures(fit4)

##Quiz 4##
library(MASS)
library(magrittr)
library(tidyverse)
library(dplyr)
data(shuttle)
head(shuttle)

shuttle %<>% mutate(usenum = ifelse(shuttle$use == "auto",1,0))
table(shuttle$usenum)

fit1 <- glm(usenum ~ wind-1, family = "binomial", data = shuttle)
summary(fit1)

(exp(coef(fit1))[1]/exp(coef(fit1))[2])

fit2 <- glm(usenum ~ wind+magn-1, family = "binomial", data = shuttle)
summary(fit2)

exp(coef(fit2))

(exp(coef(fit2))[1]/exp(coef(fit2))[2])

data("InsectSprays")
head(InsectSprays)

fit3 <- glm(count ~spray-1, family = "poisson", data= InsectSprays)
summary(fit3)


(exp(coef(fit3))[1]/exp(coef(fit3))[2])

x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
plot(x,y)
