library(readr)
df7 <- read_csv("C:/Users/Mya H/Downloads/PISA.csv")
View(df7)

#outliers, linearity, homoskedacity
#check for linearity
#for residual vs fitted plot you want a straight line that dots have no relationship to be linear
#check for homoskedaskity to see consistency, make sure we are not missing variables
#outliers have leverage, discrepancy, influence
  #Cooks d runs models without outliers to see how much the coefficients change
#which = 4 plot is nice
#multicolinearity

#1
hist(df7$PISARead)
hist(df7$GDP)
hist(df7$GNI)

plot(df7$GNI, df7$PISARead)
plot(df7$GDP, df7$PISARead)
plot(df7$GDP, df7$GNI)


#2

lm1l7 <- lm(PISARead ~ GDP + GNI, data = df7)
library(stargazer)
stargazer(lm1l7, type = 'text')

#2b
library(car)
vif(lm1l7)
plot(lm1l7, which = 2)
plot(lm1l7, which = 3)
plot(lm1l7, which = 4)

#2c
plot(lm1l7, which = 5)

#3
df7$logGNI <- log(df7$GNI)

lm2l7 <- lm(PISARead ~ logGNI, data = df7)
stargazer(lm2l7, type = 'text')

#3a
plot(lm2l7, which = 5)

#3b
AIC(lm1l7)/nobs(lm1l7)
AIC(lm2l7)/nobs(lm2l7)



