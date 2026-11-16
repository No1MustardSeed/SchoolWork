#question 1
T3Q1 <- glm(quitjob ~ treatment + children + married, data = work_from_home, family = binomial)
summary(T3Q1)
library(broom)
tidy(T3Q1, conf.int = TRUE, exponentiate = TRUE)

work_from_home$cto <- ifelse(work_from_home$treatment <1, 1, 0)
T3Q12 <- glm(quitjob ~ cto + children + married, data = work_from_home, family = binomial)
tidy(T3Q12, conf.int = TRUE, exponentiate = TRUE)

#4
T3Q4 <- glm(treat_ratifs ~ num_party, data = environ_treaties, family = poisson)
summary(T3Q4)

#5
library(dplyr)
work_from_home %>%
  select(personid, bonus)%>%
  filter(bonus > 1800) %>%
  print(n = 100)