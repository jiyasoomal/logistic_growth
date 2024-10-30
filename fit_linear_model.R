#Script to estimate the model parameters using a linear approximation
library(dplyr)

growth_data <- read.csv("experiment.csv")

#Case 1. K >> N0, t is small
#Work out what t is based on when K is bigger than N on the graph
#At time 1500 is when K is not reached yet but will be - do not want ot do any later bc the line starts to curve and is no longer at exponential growth
data_subset1 <- growth_data %>% filter(t<1500) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)
#Intercept of linear model tells you the N0 

#Case 2. N(t) = K
#t is infinity 
data_subset2 <- growth_data %>% filter(t>1500)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)
#The summary only shows you the intercept and no gradient bc the gradient is 0. 
#This is because N = K and has reached carrying capacity
