#Script to plot data and model

growth_data <- read.csv("experiment.csv")

#Create a function for logistic growth - using equations 
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}
#Determining what N0, r and K are
N0 <- 986.5075 ##Intercept from first linear model is the N0 but this value is log transformed so we reverse this with the exp() function
exp(6.8941709)

r <-  0.0100086 #r is the gradient of the logistic growth (first linear model)

K <- 59999999983 #Intercept from the second linear model is K - this is models just the constant period of logistic growth so intercept = K

#Graph to fit the model of t against N
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

#Graph to fit the model of t against log N
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +
  scale_y_continuous(trans='log10')

#Making a list of packages needed
sink(file = "package-versions.txt")
sessionInfo()
sink()
