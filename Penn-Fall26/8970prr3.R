library(readr)
df <- read_csv("C:/Users/Mya H/Downloads/good.csv")
View(df)

#cleaning
vars3 <- c("mathraw97", "WICpreg", "AGE97", "CHRACE", "bthwht", "HOME97", "faminc97")
df3_clean <- df[complete.cases(df[, vars3]), ]
df3_clean$RACE <- ifelse(df3_clean$CHRACE == 1, 0,
                         ifelse(df3_clean$CHRACE == 2, 1, NA))

df3_clean <- df3_clean[!is.na(df3_clean$RACE), ]

#summary stats
library(stargazer)
summary(df_clean[c("mathraw97", "WICpreg", "AGE97", "faminc97", "bthwht", "HOME97", "CHRACE")])
colSums(is.na(df[c("mathraw97", "WICpreg", "AGE97", "faminc97", "bthwht", "HOME97", "CHRACE")]))
stargazer(df2_clean[vars], type = "text",
          summary.stat = c("n", "mean", "sd", "min", "median", "max"),
          digits = 2)


#graphs
#bar chart
hist(x = df3_clean$mathraw97,
     main = "1997 Raw Math Standardized Score",
     xlab  = "Standardized Scores",
     col = "darkturquoise"
)

#inc
hist(x = df2_clean$faminc97,
     main = "1997 Total Family Income",
     xlab = "Income in $",
     col = "darkturquoise"
)

#home and math score
plot(df3_clean$HOME97, df3_clean$mathraw97,
     pch  = 20,
     col  = adjustcolor("darkturquoise"),
     xlab = "Home Environment Score (1997)",
     ylab = "Math Raw Score",
     main = "Math Score vs. Home Environment"
)
abline(lm(mathraw97 ~ HOME97, data = df3_clean), col = "violetred", lwd = 2)

#inc and home score
plot(df3_clean$faminc97, df3_clean$HOME97,
     pch = 20,
     col  = adjustcolor("darkturquoise",  alpha.f = 0.25),
     xlab = "Income 1997",
     ylab = "Home Environment Score",
     main = "Income 1997 vs Home Environment Score"
)
abline(lm(HOME97 ~ faminc97, data = df3_clean), col = "violetred", lwd = 2)

#ages
means <- tapply(df3_clean$mathraw97, df3_clean$AGE97, mean, na.rm = TRUE)
barplot(means, col = "darkturquoise",
        xlab = "1997 Age", ylab = "Mean Math Score",
        main = "Average Math Score by Age")
abline(lm(mathraw97 ~ AGE97, data = df3_clean), col = "deeppink", lwd = 2)



#regressions
lm1prr3 <- lm(mathraw97 ~ WICpreg, data = df3_clean)
lm2prr3 <- lm(mathraw97 ~ WICpreg + faminc97 + HOME97, data = df3_clean)
lm3prr3 <- lm(mathraw97 ~ WICpreg + faminc97 + HOME97 + AGE97 + bthwht + RACE, data = df3_clean)

library(stargazer)
stargazer(lm1prr3, lm2prr3, lm3prr3, type = 'text')

#diagnostics 
par(mfrow = c(2, 2))
plot(lm3prr2, which = c(1, 2, 3, 5))
par(mfrow = c(1, 1))

#taking log of inc, with outliers removed
lm4prr3 <- lm(mathraw97 ~ WICpreg + log(faminc97) + HOME97 + AGE97 + bthwht + RACE, 
              data = df3_clean[df3_clean$faminc97 >= 1.13,])
# new diagnostics 
par(mfrow = c(2, 2))
plot(lm4prr2, which = c(1, 2, 3, 5))
par(mfrow = c(1, 1))

#adding interactions regarding income
lm5prr3 <- lm(mathraw97 ~ WICpreg + log(faminc97) + HOME97 + AGE97 + bthwht + RACE + 
                log(faminc97):WICpreg + log(faminc97):HOME97, 
              data = df3_clean[df3_clean$faminc97 >= 1.13,])
# newest diagnostics 
par(mfrow = c(2, 2))
plot(lm5prr2, which = c(1, 2, 3, 5))
par(mfrow = c(1, 1))

stargazer(lm3prr3, lm4prr3, lm5prr3, type = 'text')

#adding interactiosn around the race variable 
lm6prr3 <- lm(mathraw97 ~ WICpreg + log(faminc97) + HOME97 + AGE97 + bthwht + RACE + 
                RACE:WICpreg + RACE:HOME97, 
              data = df3_clean[df3_clean$faminc97 >= 1.13,])
#and one with both
lm7prr3 <- lm(mathraw97 ~ WICpreg + log(faminc97) + HOME97 + AGE97 + bthwht + RACE + 
                RACE:WICpreg + RACE:HOME97 + log(faminc97):WICpreg + log(faminc97):HOME97, 
              data = df3_clean[df3_clean$faminc97 >= 1.13,])

stargazer(lm5prr3, lm6prr3, lm7prr3, type = 'text')



