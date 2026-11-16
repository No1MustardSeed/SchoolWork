#USed car data lrm
library(dplyr)
library(readxl)
usedcarprep <-used_cars_prepped_1_
View(usedcarprep)
tlruc = lm(price ~ age + agesq + odometer + odometersq + cond_excellent + dealer, data = usedcarprep)
summary(tlruc)

#dyplr
library(tidyverse)
view(diamonds)
diamonds %>%
  select(price, carat, cut, color)
diamonds %>%
  filter(cut == "Ideal") %>%
  filter(color == "J") %>%
  filter(price >= 450) %>%
  print(n = 15)
  