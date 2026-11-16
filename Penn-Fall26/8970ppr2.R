library(readr)
df <- read_csv("C:/Users/Mya H/Downloads/good.csv")
View(df)

#checking
data_quality <- data.frame(
  dtype       = sapply(df, function(x) class(x)[1]),
  missing     = colSums(is.na(df)),
  `missing_%` = round(colMeans(is.na(df)) * 100, 2),
  unique      = sapply(df, function(x) length(unique(x[!is.na(x)]))),
  check.names = FALSE
)

View(data_quality)

#cleaning
vars <- c("mathraw97", "WICpreg", "AGE97", "loginc97", "bthwht", "HOME97", "faminc97")
df2_clean <- df[complete.cases(df[, vars]), ]

#summary stats
library(stargazer)
summary(df_clean[c("mathraw97", "WICpreg", "AGE97", "loginc97", "bthwht", "HOME97")])
colSums(is.na(df[c("mathraw97", "WICpreg", "AGE97", "loginc97", "bthwht", "HOME97")]))
stargazer(df2_clean[vars], type = "text",
          summary.stat = c("n", "mean", "sd", "min", "median", "max"),
          digits = 2)

#bar chart
hist(x = df2_clean$mathraw97,
     main = "1997 Raw Math Standardized Score",
     xlab  = "Standardized Scores",
     col = "darkturquoise"
)

hist(x = df2_clean$faminc97,
     main = "1997 Total Family Income",
     xlab = "Income in $",
     col = "darkturquoise"
)

plot(df2_clean$HOME97, df2_clean$faminc97)
plot(df2_clean$faminc97, df2_clean$mathraw97)

#scatter plot
plot(df2_clean$HOME97, df2_clean$mathraw97,
     pch  = 20,
     col  = adjustcolor("darkturquoise"),
     xlab = "Home Environment Score (1997)",
     ylab = "Math Raw Score",
     main = "Math Score vs. Home Environment"
)
abline(lm(mathraw97 ~ HOME97, data = df2_clean), col = "violetred", lwd = 2)

plot(df2_clean$loginc97, df2_clean$HOME97,
     pch = 20,
     col  = adjustcolor("darkturquoise",  alpha.f = 0.25),
     xlab = "Log of Income 1997",
     ylab = "Home Environment Score",
     main = "Log of Income 1997 vs Home Environment Score"
)
abline(lm(HOME97 ~ loginc97, data = df2_clean), col = "violetred", lwd = 2)

#plot of ages
means <- tapply(df2_clean$mathraw97, df2_clean$AGE97, mean, na.rm = TRUE)

barplot(means, col = "darkturquoise",
        xlab = "1997 Age", ylab = "Mean Math Score",
        main = "Average Math Score by Age")

abline(lm(mathraw97 ~ AGE97, data = df2_clean), col = "deeppink", lwd = 2)


#starting regressions
#using just main IV
lm1prr2 <- lm(mathraw97 ~ WICpreg, data = df2_clean)
#income factors
lm2prr2 <- lm(mathraw97 ~ WICpreg + loginc97 + HOME97, data = df2_clean)
stargazer(lm1prr1, type = 'text')
#all variables
lm3prr2 <- lm(mathraw97 ~ WICpreg + AGE97 + loginc97 + bthwht + HOME97, data = df2_clean)
stargazer(lm1prr2, lm2prr2, lm3prr2, type = 'text')

anova(lm1prr2, lm2prr2, lm3prr2)
stargazer(lm1prr2, lm2prr2, lm3prr2, type = "text",
          add.lines = list(c("Nested F vs. previous", "", "529.79***", "5,985.59***")))
#Linearity and Mean-zero error with Residuals vs Fitted

#Homoskedasticity with scale location
plot(lm1prr2, which = 3)
plot(lm2prr2, which = 3)
plot(lm3prr2, which = 3)

#Normality of errors with q-q
plot(lm1prr2, which = 2)
plot(lm2prr2, which = 2)
plot(lm3prr2, which = 2)

#coosk
plot(lm1prr2, which = 4)
plot(lm2prr2, which = 4)
plot(lm3prr2, which = 4)

#Same population with residuals vs Leverage
plot(lm1prr2, which = 5)
plot(lm2prr2, which = 5)
plot(lm3prr2, which = 5)

#dropping the 3 labeled points in which 5 for lm3
lm4prr2 <- lm(mathraw97 ~ WICpreg + AGE97 + loginc97 + bthwht + HOME97,
              data = df2_clean,
              subset = -c(1080, 1568, 1569))
plot(lm4prr2, which = 5)

#this one i think removes too many
lm5prr2 <- lm(mathraw97 ~ WICpreg + AGE97 + loginc97 + bthwht + HOME97,
              data = df2_clean,
              subset = -c(1080, 1568, 1569, 1600, 844, 418))
plot(lm5prr2, which = 4)

#testing just removing 1568 and 1569 to see
lm6prr2 <- lm(mathraw97 ~ WICpreg + AGE97 + loginc97 + bthwht + HOME97,
              data = df2_clean,
              subset = -c(1568, 1569))
plot(lm6prr2, which = 5)

#removing any inc below 1.12
lm7prr2 <- lm(mathraw97 ~ WICpreg + AGE97 + loginc97 + bthwht + HOME97,
              data = df2_clean[df2_clean$faminc97 >= 1.13,])
plot(lm7prr2, which = 2)
plot(lm7prr2, which = 3)
plot(lm7prr2, which = 4)
plot(lm7prr2, which = 5)

#checking something
df2_clean$logmath <- log(df2_clean$mathraw97 + 1)
lm8prr2 <- lm(mathraw97 ~ WICpreg + AGE97 + loginc97 + bthwht + HOME97 + loginc97:HOME97 + loginc97:WICpreg,
              data = df2_clean[df2_clean$faminc97 > 1.12,])
stargazer::stargazer(lm3prr2, lm7prr2, lm8prr2, type = 'text')



#the more outliers I remove the WIC coeffiecent decreases
#those outliers
stargazer(lm7prr2, lm4prr2, lm6prr2, lm3prr2, type = 'text')

cor(df2_clean$AFDCpreg, df2_clean$faminc97)

idx <- c(1080, 1568, 1569, 1600, 844, 418)
df2_clean[idx, ]
df2_clean$cooksd <- cooks.distance(lm3prr2)
install.packages("pander")
library(pander)
pander(round(df2_clean[order(df2_clean$cooksd, decreasing = TRUE)[1:15],], 3))

#outlier model
stargazer::stargazer(lm3prr2, lm7prr2, type = 'text')


#model progression
stargazer(lm1prr2, lm2prr2, lm3prr2, type = 'text')

#AIC check, lm7 lowest AIC
AIC(lm1prr2, lm2prr2, lm3prr2, lm7prr2)
AIC(lm1prr2, lm2prr2, lm3prr2, lm4prr2, lm5prr2, lm6prr2, lm7prr2, lm8prr2)

#plot codes in one area
library(ggplot2)

par(mfrow = c(2, 2))
plot(lm3prr2, which = c(1, 2, 3, 5))
par(mfrow = c(1, 1))

par(mfrow = c(2, 2))
plot(lm7prr2, which = c(1, 2, 3, 5))
par(mfrow = c(1, 1))

par(mfrow = c(2, 2))
plot(lm8prr2, which = c(1, 2, 3, 5))
par(mfrow = c(1, 1))

library(car)
vif(lm3prr2) 
vif(lm7prr2)
vif(lm8prr2)

(df2_clean$faminc97)
