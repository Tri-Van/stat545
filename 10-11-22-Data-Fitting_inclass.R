library(tidyverse)
library(tidymodels)
library(gapminder)
library(datateachr)

data <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv", sep = ";")

data

ggplot(data,aes(fixed.acidity,pH)) + geom_point() # Explore the 2 variables acidity and pH)

my_lm <-lm(pH~fixed.acidity, data=data) # Fit a linear regression/
my_lm

#Try other function
coef(my_lm)
sigma(my_lm) #get std
summ_lm <-summary(my_lm)
summ_lm # In this case you only print it, cannot extract anything
summ_lm$coefficients
summ_lm$r.squared
#THis is all you can do with the Base R

#Model probing with broom packages of tidyverse
tidy(my_lm) # Everything is returned as a table, which you can further extract
augment(my_lm) %>% print(n=5) # apply your model and predict for different variables
augment(my_lm, new_data=tibble(fixed.acidity=8:13)) 

glance(my_lm) #Give information about model fitting

predict(my_lm) %>% unname() %>% head(5) 

ggplot(data,aes(fixed.acidity,pH)) + geom_point() + geom_smooth(method="lm") # not worth cause cannot extract the smooth line, use the normal function than put layer on graph

gapminder_zimbabwe <-gapminder %>% filter(country=="zimbawe")
ggplot(gapminder_zimbabwe, aes(year,lifeExp))+ geom_point() + geom_smooth(method="lm", formula= y~poly(x,2),se=F)

gapminder_Zimbabwe <- gapminder %>% 
  filter(country == "Zimbabwe")

gapminder_Zimbabwe %>% 
  ggplot(aes(year, lifeExp)) + 
  geom_point() +
  geom_smooth(method = "lm",
              formula = y ~ poly(x,2), 
              se = F)