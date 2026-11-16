library(readr)
df8 <- read_csv("C:/Users/Mya H/Downloads/NLSY1.csv")
View(df8)

#leverage - how far away from the mean
#discrepancy - large residual unusual 
#influence - changes the mean a lots
#residuals vs leverage (whihc = 4) see what comes off the dotted line
#AIC lower = better, same data set, if changing removing variable is changing the model better
#multicollinearity - interaction affects. two variables move together, they are close
  #above 0.8 is or below -0.8 is bad
  #VIF - variance inflation factor
#standardizing - comparing two varibales on the same unit(scale())
  #mean is now 0
#interaction on model lm(y~v1+v2+v1:v2) or *
#this variable is moderating this variable by this/ to the extent of this coefficient
  #slopes go up quicker depending on the 



#1
df8$race2 <- ifelse(df8$race == 1, "Hispanic",
                    ifelse(df8$race == 2, "Black",
                           ifelse(df8$race == 3, "NBlNHs", NA)))
df8$race2 <- factor(df8$race_)
df8$race2 <- relevel(df8$race_, ref = "NBlNHs")

levels(df8$race_)   # "NBlNHs" "Black" "Hispanic"
table(df8$race, df8$race_, useNA = "ifany")

#2
lm1a8 <- lm(read ~ race2 + hhnum, data = df8)
summary(lm1a8)
library(stargazer)
stargazer(lm1a8, type = 'text')



b <- coef(lm1a8)

plot(df8$hhnum, df8$read,
     pch = 20,
     col = adjustcolor("black", alpha.f = 0.25),
     xlab = "hhnum", ylab = "read")

abline(a = b["(Intercept)"],                    b = b["hhnum"], col = "darkgreen", lwd = 2)  # NBlNHs
abline(a = b["(Intercept)"] + b["race2Black"],    b = b["hhnum"], col = "red",       lwd = 2)  # Black
abline(a = b["(Intercept)"] + b["race2Hispanic"], b = b["hhnum"], col = "blue",      lwd = 2)  # Hispanic

legend("topright", legend = c("NBlNHs", "Black", "Hispanic"),
       col = c("darkgreen", "red", "blue"), lwd = 2)

#3 
lm2a8 <- lm(read ~ race2 * hhnum, data = df8)
summary(lm2a8)
anova(lm1a8, lm2a8)


#center mean 4
df8$magebirth_c <- df8$magebirth - mean(df8$magebirth, na.rm = TRUE)
df8$birthord_m1 <- df8$birthord - 1

lm3a8 <- lm(read ~ magebirth_c * birthord_m1, data = df8)
stargazer(lm3a8, type = 'text')


