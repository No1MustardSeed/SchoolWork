library(readr)
Wages_and_Hours <- read_csv("C:/Users/Mya H/Downloads/Wages and Hours.csv")
View(Wages_and_Hours)

#histogram
hist(x = Wages_and_Hours$AGE, 
     main = "Age of Respondents", 
     xlab  = "Age (Years)")

#correlation coefficient
cor(x=Wages_and_Hours$SCHOOL,y=Wages_and_Hours$HRS,method=c("pearson"))
cor.test(Wages_and_Hours$SCHOOL, Wages_and_Hours$HRS)

#linear model
HRS_SCHOOL <- lm(formula=HRS~SCHOOL, data=Wages_and_Hours)
summary(HRS_SCHOOL)

library(stargazer)
stargazer(HRS_SCHOOL, type = 'text')

#scatterplot with abline
plot(x=Wages_and_Hours$SCHOOL, 
     y=Wages_and_Hours$HRS,
     main="Scatter Plot of Averages Hours Worked in the Year vs. Highest Grade of School",
     xlab="Highest Grade of School",
     ylab="Average Hours Worked in a Year")
abline(lm(Wages_and_Hours$HRS~ Wages_and_Hours$SCHOOL), col="red")
lines(lowess(Wages_and_Hours$HRS~ Wages_and_Hours$SCHOOL), col="blue")
