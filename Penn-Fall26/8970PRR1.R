library(readr)
df <- read_csv("C:/Users/Mya H/Downloads/good.csv")
View(df)

#removing nas
sum(df$faminc97 == 0, na.rm = TRUE)
sum(df_clean$faminc97 == 0, na.rm = TRUE)
sum(is.na(df$faminc97))   

vars <- c("readss97", "WICpreg", "AFDCpreg", "AGE97", "faminc97", "bthwht", "HOME97")
df_clean <- df[complete.cases(df[, vars]), ]

#summary stats
colnames(df)
summary(df_clean[c("readss97", "WICpreg", "AFDCpreg", "AGE97", "faminc97", "bthwht", "HOME97")])
colSums(is.na(df[c("readss97", "WICpreg", "AFDCpreg", "AGE97", "faminc97", "bthwht", "HOME97")]))
stargazer(df_clean[vars], type = "text",
          summary.stat = c("n", "mean", "sd", "min", "median", "max"),
          digits = 2)

#visuals of summary stats
#hist of DV
hist(x = df_clean$readss97,
     main = "1997 Reading Achievement Standardized Score",
     xlab  = "Standardized Scores",
     col = "darkturquoise",
     )

#table for count for dummies
dummytable <- sapply(df_clean[, c("WICpreg", "bthwht", "AFDCpreg")], table)
library(stargazer)
stargazer(dummytable, type = 'text')

#starting regressions
#using just main IV
lm1prr1 <- lm(readss97 ~ AFDCpreg + WICpreg, data = df_clean)
#not using main IV
lm2prr1 <- lm(readss97 ~ AFDCpreg + WICpreg + AGE97 + bthwht, data = df_clean)
stargazer(lm1prr1, type = 'text')
#using main IV
lm3prr1 <- lm(readss97 ~ WICpreg + AFDCpreg + AGE97 + faminc97 + bthwht + HOME97, data = df_clean)
stargazer(lm1prr1, lm2prr1, lm3prr1, type = 'text')


#running anova
anova(lm1prr1, lm2prr1, lm3prr1)
anova <- anova(lm1prr1, lm2prr1, lm3prr1)
stargazer(anova, type = 'text')

#test
dff <- as.data.frame(scale(df_clean))
View(dff)
lm4prr1 <- lm(readss97 ~ WICpreg + AFDCpreg + AGE97 + faminc97 + bthwht + HOME97, data = dff)
stargazer(lm4prr1, type = 'text')









