library(readr)
NLSY1 <- read_csv("C:/Users/Mya H/Downloads/NLSY1.csv")
View(NLSY1)

#1
NLSY1$raceHispanic <- ifelse(NLSY1$race == 1, 1, 0)
View(NLSY1)
NLSY1$raceBlack <- ifelse(NLSY1$race == 2, 1, 0)

#2
NLSY1$race <- factor(NLSY1$race,
                     levels = c(3, 1, 2),
                     labels = c("Non-Black, Non-Hispanic", "Hispanic", "Black"))

#3
lm1l5 <- lm(read ~ raceBlack + raceHispanic, data = NLSY1)
lm2l5 <- lm(read ~ race, data = NLSY1)

library(stargazer)
stargazer(lm1l5, lm2l5, type = 'text')

#5
anova(lm2l5, lm1l5)






