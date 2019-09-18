###Coursera Course 6: Regression Notes

setwd('/Users/simonevantaylor/Documents/DataScience_Coursera/Course6')

##Week 1##
#galton invented regression
#regression is best at determining the simpelest relationship
#unexplained/residual variation
#regression to the mean
#marginal distribution = normal histogram
#mean squared error = sum of squared distances between observed data and mu (higher is worse?)
install.packages('UsingR')
library(UsingR)
library(UsingR); data(galton); library(reshape); long <- melt(galton)
g <- ggplot(long, aes(x = value, fill = variable)) 
g <- g + geom_histogram(colour = "black", binwidth=1) 
g <- g + facet_grid(. ~ variable)
g 

#want to explain childrens heights using parents heights 
#slope gives us the best line: want to find slope (beta) that minimizes sum of squared distances between observed and fitted data 
#regression to the origen subtract both of the means 
lm()

#ordinary least squares: each point on the line contributes equally to error between line and fitted points
#centering = subtracting the mean from each vector 
#sample mean is the least squares solution 
#scaling = divide every obs by SD 
#centing and scaling = z scoring ? (normalize the data)
#normalizing makes non comparable data sets comparable
#correlation = covariance standardized to be unitless
#B1 = cor(x,y)sdy/sdx
#regression to the mean: intrinsic component versus noise 
#how to quantify it? 
#residual variation: variation around regression line
#residuals: help diagnose model fit, vertical distance between the observed outcome and the expected outcome
#empirical sum of residuals is 0 
#carry residuals forward in a new outcome having removed predictor
#residual variation is different than systematic variation
resid(fit)
predict(fit)
#plot residuals versus x
  #looking for any form of pattern, to determine if the model is adequate 
#linear model is not always correct for data 
  #doesnt mean the model itself is useless 
#heteroscedasticity 
#residual variation summary(fit)$sigma
# total variability = regression (explained)+ residual variablity (not explained)
#r^2 = % variation explained by the model
  #r^2 can be misleading

#regression is really important tool for prediction: can get inference and prediction
  #predication variance
  #Prediction error is going to be the smallest when were predicting at the average of the predictor
  #variablity decreases prediction error
predict(fit3, data.frame(mtcars$mpg=mean(mtcars$mpg)), interval ="confidence"))

