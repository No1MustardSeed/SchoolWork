#Tidy censuss
#library
library(tidycensus)
library(tidyverse)
#calling api
census_api_key('67087148ff0938bf6acf85a074b10d507c11c48c', install = TRUE)
#checking api
Sys.getenv("CENSUS_API_KEY")

#1
New_Jersey <- get_acs(geography = "county",
                      variables = c(medincome = "B19013_001"),
                      state = "NJ",
                      year = 2020)
View(New_Jersey)

#2
library(dplyr)
New_Jersey%>%
  arrange(desc(estimate))

#3
View(EES_2019)
library(broom)
WCOR_Test2 = glm(working_class ~ religious, data = EES_2019, family = binomial)
tidy(WCOR_Test2, conf.int = TRUE, exponentiate = TRUE)

ROR_Test2 = glm(Rural ~ religious, data = EES_2019, family = binomial)
tidy(ROR_Test2, conf.int = TRUE, exponentiate = TRUE)

#5 
library(dynlm)
library(tseries)

library(readr)
SP_500 <- read_csv("C:/Users/Mya H/Downloads/S&P 500.csv")
View(SP_500)

SP500_Test2<-dynlm(SP ~ VIX, data = SP_500, start = 2010, end = 2017)
plot(SP500_Test2)
summary(SP500_Test2)

