#making dummy
World_Election_CSC231$dummy.es <- ifelse(World_Election_CSC231$`Electoral system family` == "Plurality/Majority", 1,
                            ifelse(World_Election_CSC231$`Electoral system family` == "PR", 0, NA))

OR231 = glm(dummy.es ~ Democ_regime08, data = World_Election_CSC231, family = binomial)
library(tidyverse)
library(broom)
tidy(OR231, conf.int = TRUE, exponentiate = TRUE)
#With statistical significance (p-value is 0.00108), 
#A country with plurality/majority voting is 74.4% less likely to be a democratic regime

#linear regression
LRes231 = lm(World_Election_CSC231$Dem_score14 ~ World_Election_CSC231$`Electoral system family`)
summary(LRes231)
library(stargazer)
stargazer(LRes231, type = 'text')

#graph stuff

ES <- World_Election_CSC231$dummy.es
Dem4 <- World_Election_CSC231$Dem_level4
ESr <- World_Election_CSC231$`Electoral system family`

##converting into factor
DL4 <- factor(World_Election_CSC231$Dem_level4)

World_Election_CSC231 %>%
  ggplot(aes(x = ESr, fill = as.factor(DL4))) +
  geom_bar(position = "stack", alpha = 1) +
  geom_text(
    stat = 'count', 
    aes(label = ..count..), 
    position = position_stack(vjust = 0.5)
  ) +
  labs(
    x = "Type of Electoral System",
    y = "Count",
    fill = "Dem_level4",
    title = "How Many Countries Per Electoral System"
  )

#making level 4 dummy (dem level 4 get 1 others get 0)
World_Election_CSC231$dummy.demlev <- ifelse(World_Election_CSC231$Dem_level4 <4, 0, 1)

#doing OR w/ new dummy to see if difference from original 
NOR231 = glm(dummy.es ~ dummy.demlev, data = World_Election_CSC231, family = binomial)
tidy(NOR231, conf.int = TRUE, exponentiate = TRUE)
  #With statically significance (p-value = 0.000691)
  #A country with Plurality/Majority is 5.2x more likely to have a democratic level of at least four.

#looking at stuff
World_Election_CSC231 %>%
  select(dummy.demlev, Dem_level4, dummy.es, `Electoral system family`) %>%
  print(n=50)

#dummy es but PR is 1 
World_Election_CSC231$dummy.es2 <- ifelse(World_Election_CSC231$`Electoral system family` == "PR", 1,
                                         ifelse(World_Election_CSC231$`Electoral system family` == "Plurality/Majority", 0, NA))

#looking again
World_Election_CSC231 %>%
  select(dummy.demlev, Dem_level4, dummy.es, `Electoral system family`, dummy.es2) %>%
  print(n=50)

#doing OR w/ newest dummy to see if difference from original 
NOR2312 = glm(dummy.es2 ~ dummy.demlev, data = World_Election_CSC231, family = binomial)
tidy(NOR2312, conf.int = TRUE, exponentiate = TRUE)
  #with statistical significance(p-value = 0.000691)
  #countries with PR systems are 81% less likely to be a democratic level 4
summary(NOR2312)
stargazer(NOR2312, type = 'text')

#new LR w dummy
NLR231 = lm(World_Election_CSC231$Dem_score14 ~ World_Election_CSC231$dummy.es2)
stargazer(NLR231, type = 'text')
  #w/ regular dummy es
NLR2312 = lm(World_Election_CSC231$Dem_score14 ~ World_Election_CSC231$dummy.es)
stargazer(NLR2312, type = 'text')


#doing OR w controlled variables
NOR2313 = glm(dummy.es2 ~ dummy.demlev +, data = World_Election_CSC231, family = binomial)
tidy(NOR2312, conf.int = TRUE, exponentiate = TRUE)
#with statistical significance(p-value = 0.000691)
#countries with PR systems are 81% less likely to be a democratic level 4

#new graph w election types
ESLegis <- World2_Election_CSC231$ES_Legislators

World2_Election_CSC231 %>%
  ggplot(aes(x = ESLegis, fill = as.factor(DL4))) +
  geom_bar(position = "stack", alpha = 1) +
  geom_text(
    stat = 'count', 
    aes(label = ..count..), 
    position = position_stack(vjust = 0.5)
  ) +
  labs(
    x = "Type of Electoral System",
    y = "Count",
    fill = "Democracy Level (1-4)",
    title = "Number of Countries Per Election System for Legislature"
  )

#accidentally seicth dv an iv previously, fixing that here
#odd ratio with electoral systems
COR231 = glm(dummy.demlev ~ dummy.es2, data = World2_Election_CSC231, family = binomial)
tidy(COR231, conf.int = TRUE, exponentiate = TRUE)

COR2 = glm(Democ_regime08 ~ dummy.es2, data = World2_Election_CSC231, family = binomial)
tidy(COR2, conf.int = TRUE, exponentiate = TRUE)

COR3 = glm(Democ_regime08 ~ dummy.es, data = World2_Election_CSC231, family = binomial)
tidy(COR3, conf.int = TRUE, exponentiate = TRUE)

COR4 = glm(dummy.demlev ~ dummy.es, data = World2_Election_CSC231, family = binomial)
tidy(COR4, conf.int = TRUE, exponentiate = TRUE)

#trying to make fancy or
#new dummies!
World2_Election_CSC231$dummy.esl <- ifelse(World2_Election_CSC231$ES_Legislators == "List PR", 1,
                                           ifelse(World2_Election_CSC231$ES_Legislators %in% c("AV", "FPTP", "BV", "TRS"), 0, NA))
#new or
ESLOR = glm(dummy.demlev ~ dummy.esl, data = World2_Election_CSC231, family = binomial)
tidy(ESLOR, conf.int = TRUE, exponentiate = TRUE)

ESLOR2 = glm(Democ_regime08 ~ dummy.esl, data = World2_Election_CSC231, family = binomial)
tidy(ESLOR2, conf.int = TRUE, exponentiate = TRUE)


#should look at correlation matrix, see what correlates the most
#then, test the type of gov on those variables
  #Spend Health and Gender Unequal had highest correlations to dem score
LMESLsh = lm(World2_Election_CSC231$SpendHealth ~ World2_Election_CSC231$dummy.esl)
LMESLgen = lm(World2_Election_CSC231$Gender_Unequal ~ World2_Election_CSC231$dummy.esl)

stargazer(LMESLsh, type = "text")
stargazer(LMESLgen, type = "text")

#simple regressioj
LRM231 = lm(Dem_score14 ~ `Electoral system family`, data = World2_Election_CSC231)

stargazer(LRM231, type = 'text')

LRM2231 = lm(Dem_score14 ~ ES_Legislators, data = World2_Election_CSC231)

stargazer(LRM2231, type = 'text')


summary(World2_Election_CSC231$Dem_score14)




