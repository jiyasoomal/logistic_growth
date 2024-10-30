#Script to plot the logistic growth data

growth_data <- read.csv("experiment.csv")

install.packages("ggplot2")
library(ggplot2)

#Plotting a graph of time on the x axis and N on the y axis
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t(min)") +
  
  ylab("N (#cells)") +
  
  theme_bw()

#Plotting a graph of time on the x axis and logN on the y axis
#scale_y_continuous(trans='log10') - logs your data for you so you dont need to log it again
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t (min)") +
  
  ylab("logN (#cells)") +
  
  scale_y_continuous(trans='log10')
