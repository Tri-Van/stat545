library(tidyverse)
library(gapminder)
library(testthat)
library(patchwork)

gdpPercap_plot <- 
  ggplot(gapminder, aes(gdpPercap)) +
  geom_histogram() +
  theme_minimal()

log_gdpPercap_plot <- 
  ggplot(gapminder, aes(log(gdpPercap))) +
  geom_histogram() +
  theme_minimal()

gdpPercap_plot + log_gdpPercap_plot
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

gapminder %>% 
  mutate(gdpPercap_scaled = (log(gdpPercap) - mean(log(gdpPercap))) / sd(log(gdpPercap)),
         pop_scaled = (log(pop) - mean(log(pop))) / sd(log(pop)))
