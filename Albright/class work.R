#libraries
library(dplyr)
library(readxl)
library(RCPA3)

#used car work renaming
usedcarprep <-used_cars_prepped_1_
view(usedcarprep)

#looking 9/3
summary(usedcarprep)
describeC(usedcarprep)

freqC(x=condition, data = usedcarprep)
freqC(x=fuel, data = usedcarprep)
freqC(x=paintcolor, data = usedcarprep)

#working with graphs 
View(world)

describeC(x=carbon.footprint, data = world)
describeC(x=ciaedex, data=world)
freqC(x=civil.war, data=world, main = "Civil Wars", bar.col = "purple", printC = T)

freqC(x=threat.from.germany, w=wt, data=nes, xlab = "Amount of Threat", main = "Public Opinion", bar.col = "red", printC = T)
describeC(x=infant.mortality, data = world)
sortC(id=country, by=infant.mortality, data=world, limit=75, descending = F, printC = T)

#descriptive analysis 9/5

lruc = lm(price ~ age + agesq + odometer + odometersq + le + cond_excellent + dealer, data = usedcarprep)
library(stargazer)

summary(lruc)
stargazer(lruc, type = 'text')

lruc2 = lm(price ~ age + agesq + odometer + odometersq + le + dealer, data = usedcarprep)

summary(lruc2)
stargazer(lruc2, type = 'text')
#10/1
#logit (logistic) and odds ratio
  #use logit recession when there is a dummy variable (1 or 0 or yes or no)
    #do college students smoke yes(1) or no (0)
  #1.20 odds ratio is 20% more likely to happen, 2 = twice as likely, 1 is just as likely
    #uses baseline of one
    #p 0-1,   p/1-p 0- infin,   ln[p/1-p] -infin - infin
install.packages("broom")
library(broom)
library(tidyverse)
view(diamonds)

price <- diamonds
#creating dummy variable by adding extra row. "dummy out" all diamonds >$1000
price$price.dummy <- ifelse(price$price <1000, 1, 0)

#logistic recession model, note the family inclusion."exponentiate" will give us odds ratio
log_cheap_diamonds = glm(price.dummy ~ table, data = price, family = binomial)
  #family = binomial makes it logit
summary(log_cheap_diamonds)
  #bc logit coefficient is negative, the odds ratio WILL be less than one
tidy(log_cheap_diamonds, conf.int = TRUE, exponentiate = TRUE)
  #exponentiate = true will give the odds ratio
log_cheap_diamondscut = glm(price.dummy ~ cut, data = price, family = binomial)

#djfskd
cut.ordered <- recode(price$cut, 'Fair'=1, 'Ideal'=2, 'Good'=3, 'Very Good'=4, 'Premium'=5)
log_cheap_diamondscut = glm(price.dummy ~ cut, data = price, family = binomial)

#are euros from post com countries (1) more likely to vote
library(readxl)
EP_2019_micro <- read_excel("C:/Users/Mya H/Downloads/EP 2019 micro.xls")
View(EP_2019_micro)

EPQuiz = glm(post_comm ~ voted, data = EP_2019_micro, family = binomial)

tidy(EPQuiz, conf.int = TRUE, exponentiate = TRUE)
  #Post communist country voters are 33%(odds ratio .66) less likely to vote in EP elections

#10/3
#import new data set
EES_2019 <- read_excel("C:/Users/Mya H/Downloads/EES_2019.xlsx")
View(EES_2019)

voted = glm(Voted ~ Urban + working_class + Vote_Lag, data = EES_2019, family = binomial)
summary(voted)
#saw it was negative so that mean odds ratio prolly less than one
tidy(voted, conf.int = TRUE, exponentiate = TRUE)
#for working class we were correct it was .689 
  #means they are 31% less likely to vote
  #w/ vote lag, they are  >6x more likely to vote in the next bc oddratio is 6.22

hardeuro = glm(hard_eurosceptic ~ religious + working_class + upper_class, data = EES_2019, family = binomial)
summary(hardeuro)
tidy(hardeuro, conf.int = TRUE, exponentiate = TRUE)
hardeuro2 = glm(hard_eurosceptic ~ working_class + middle_class + upper_class, data = EES_2019, family = binomial)
summary(hardeuro2)
tidy(hardeuro2, conf.int = TRUE, exponentiate = TRUE)
#adding age bracet
hardeuro3 = glm(hard_eurosceptic ~ working_class + middle_class + upper_class + Age_Bracket, data = EES_2019, family = binomial)
summary(hardeuro3)
tidy(hardeuro3, conf.int = TRUE, exponentiate = TRUE)

#Homework next week due
# 2 ORs, 1 using DV of unenmployed w/ 2 IV,
  #2 w/ vote leave w iv of rural and consume election news

quiz4ue = glm(unemployed ~ Urban + Voted, data = EES_2019, family = binomial)
quiz4vl = glm(Vote_Leave ~ Rural + Consume_Election_News, data = EES_2019, family = binomial)

summary(quiz4ue)
summary(quiz4vl)

tidy(quiz4ue, conf.int = TRUE, exponentiate = TRUE)
tidy(quiz4vl, conf.int = TRUE, exponentiate = TRUE)

#10/08
#working with time series s&p 500
#cross-sectional - bunch of data from diff places but same time period
#time series - data over different time period
  #cross sectional time series - both mix
  #auto correlation - already a natural link between the value to many of the data
    #ei the same people in government, although diff term
    #need to statistical account for the connection
    #--> use a special regression
install.packages("tseries")
library(tseries)

#making df
sp500ts<-ts(SP500$VIX, start = 1990, end = 2017, frequency = 365)
  #if wanted to look at it per year, 1, if monthly 12 for frequency
plot(sp500ts)
#making it monthly
msp500ts<-ts(SP500$VIX, start = 1990, end = 2017, frequency = 12)
plot(msp500ts)
#new ts not using vix
spsp500ts<-ts(SP500$SP, start = 1990, end = 2017, frequency = 365)
plot(spsp500ts)

install.packages("dynlm")
library(dynlm)

tsmodel<-dynlm(VIX ~ SP, data = SP500)
  #dependent variable ~ independent variable + IVII + IVIII
  #no need for binomial or expen bc no dummy dependent variable
summary(tsmodel)

#10/10
#test - odds ratio, time series, forecasting, tidy census
#today - time series and forecasting

install.packages("forecast")
library(forecast)

#setting object
SP500$Date = as.Date(SP500$Date, format = "%m/%d/%Y")
sp_ts = ts(SP500$SP, start = c(1990,1),
           end = c(2017, 4), frequency = 365)

plot(sp_ts)#looking at it
autoplot(sp_ts)

#arima functions starts the process of forecasting 
#naive model because we don't give it auto correlation, integration or moving average
#that's what the 3 zeros are we can adjust those to be more accurate

avgmodel = arima(sp_ts, c(0, 0, 0))

avgforecast = forecast(avgmodel)
avgforecast$mean  #avg is not moving, seeing what the avg is

plot(avgforecast)

#moving forecast out by 10000 days

avgforecast = forecast(avgmodel, 10000)
autoplot(avgforecast)
lines(avgforecast$mean, col = 'red')

#changing confidence interval

avgforecastn = forecast(avgmodel, 10000, level = c(50,90))
autoplot(avgforecastn)

#forcast for one data point
arimamod = auto.arima(sp_ts, seasonal = FALSE)
arimafc = forecast(arimamod)
autoplot(arimafc)

#seasonal
sarimamod = auto.arima(sp_ts)
sarimafc = forecast(sarimamod,
                    h = 10000,
                    level = c(50,95))
autoplot(sarimafc)

#10/22 - causal analysis
#Using data to statistically demonstrate how a causal variable affects the DV
  #Do vitamins have a beneficial health effect?
#LM uses theory and common sense while Causal inference we directly statistically show that causality.
#How do we do causal?
  #1 experiments 
  #2 instrumental Variable - (usually dummy) to capture difference between two or more groups
  #3 Interactions to get margins
  #4 Difference in difference - essentially a instrumental variable
  #these do not rely on theory or interpretation - just statistically causality
#Could rework regression to include causality
  #same with plotting results, particularly margin plots
#10/29 - Experiments
#lab - environment controlled
  #ethical dilemmas can exist (Stanford prison)
#field/natural - done in "nature"
  #could introduce treatments to elicit responses
  #ethical dilemmas  still exist (Stanford voting project)
#A/B Testing - 2 version of the same product are evaluated
  #could be user experience, lots of jobs
#Random assignment (prof lost $100 w/ random number generator)
  #no selection bias
#internal vs external validity
  #internal - research design proper, procedures followed, testing was appropriate
  #external - findings are generalization
#establishing causality
  #if you have a dummy for group assignment, you interact this variable w/ the casual variable you choose(for margin plots)
  # 1 = treatment, 0 = control
  #For regression analysis, you use interaction term (w/ base terms) on the DV you're interested in
#10/31
library(readxl)
work_from_home <- read_excel("C:/Users/Mya H/Downloads/work_from_home.xlsx")
View(work_from_home)
library(dplyr)
#Some descriptive

total_treatment <- work_from_home %>%
  group_by(treatment) %>%
  summarise(count = n())

View(total_treatment)

total_quit <- work_from_home %>%
  group_by(quitjob) %>%
  summarise(count = n())

View(total_quit)

quitjob90 <- glm(quitjob ~ treatment + age + costofcommute + children + male + married, data = work_from_home, family = binomial)
summary(quitjob90)
  #treatment, age, and cost of commute are significant
  #because it is binomial we cannot evaluate the coefficients
  #but we can see if it isl positive or negative
library(broom)
tidy(quitjob90, conf.int = TRUE, exponentiate = TRUE)
  #treatment and age decrease the likelihood while cost increases

#how much affect does working form home have on their bonus
bonus90 <- glm(bonus ~ treatment + age + costofcommute + children + male + married, data = work_from_home)
summary(bonus90)
  #age and male significant
  #age have a increased likelihood of bonus males have decreased
tidy(bonus90, conf.int = TRUE, exponentiate = TRUE)

#11/5
#working with data that is a count variable (type of interval variable)
  #use poisson to statistically analyze
  #ex: how many speeches a politician makes, how many championships does a team win?
  #how many times something occurs
#poisson (we are doing a regular one, but there is more complicated ones based on distribution)
  #look at the significance and direction
  #change in the log of the expected count DV for 1 unite change in the predictor

library(readxl)
environ_treaties <- read_excel("C:/Users/Mya H/Downloads/Environmental Treaties dataset.xlsx")
View(environ_treaties)

#running poisson w glm function but family is poisson
treat_ratifs <- glm(treat_ratifs ~ coal_dum + gov_days + mean_scor + right_gov, data = environ_treaties, family = poisson)
library(stargazer)
stargazer(treat_ratifs, type = 'text')
summary(treat_ratifs)

#doing it on my own
MOPM <- glm(treat_sigs ~ num_party + gov_days + eu_dum, data = environ_treaties, family = poisson)
stargazer(MOPM, type = 'text')
summary(MOPM)
  #with significance (p<0.01), as the amount of parties increase, so does the number of signatures
#need to explain count and general direction of variable AND significance of variables
#brief explain AB and plug in what your talking about hypothetically (make up excel sheet)

#11/12 - diff in differences (chapter 22)
#has a cutoff point, aims to find the difference
#Something occurred (cutoffs point) and wants to see difference before and after
  #type of causal analysis
# this is used when a time period could result in a different outcomes
#DiD modeling allows us to calc the diff between 2 different linear regression
  #each LR represents a different time period
#treat it as an experiment
  #interact the treatment with the main IV in some way
  #instead of treatment does this happen before or after a certain date
#basically it is just a linear regression with a few extra steps
  #no random assignment but we are acting as if we did
  #can interact it with time variable
#we could use 202 as cutoff  year so the code would look like
  #0=<2020, 1=>=2020 (could switch the ones and zeros, need to include one greater or less than sign)
  #we could also use the great recession 2008 or 2001 for America, 2010 for smart phones
#create a time period dummy
  mydata$time = ifelse(mydata$year>=2010, 1, 0)
    #using 2010 as an example, best to use most recent time period as 1
  mydata$DiD = mydata$time*mydata$treated
    #might not need this
  #then plug in you lm
    didreg = lm(y ~ treated + time + DiD, data = mydata)
    summary (didreg)
  #need to have x+y+xy (base terms) in regression  (unless you are working entirely with dummy variables)
  #still create your time dummy as a treatment
  #then include your intrection in ur lm
    didreg1 = lm(y ~ treated*time, data = mydata)
    summary (didreg1)
    #r will automatically include both base terms
# for more complicated models you will decide which other IVs are included
    #usually use your 
    
#loading excel file with dates 1956(independent) to 1995(joins EU)
library(readxl)
austrian_beer_production <- read_excel("C:/Users/Mya H/Downloads/austrian_beer_production.xlsx")
View(austrian_beer_production)

#trying out new dummy variable
austrian_beer_production$month.dum = ifelse(austrian_beer_production$Month>=1985, 1, 0)
#making variable,only shows data from after 1985, before is just 0
austrian_beer_production$DiD = austrian_beer_production$month.dum*austrian_beer_production$`Monthly beer production`

#running first lm WARNING MESSAGES (11/12 - because you just need a dummy)
didreg = lm(`Monthly beer production` ~ `Monthly beer production` + month.dum + DiD, data = austrian_beer_production)
summary (didreg)
#running second lm
didreg1 = lm(`Monthly beer production` ~ `Monthly beer production`*month.dum, data = austrian_beer_production)
summary (didreg1)

#importing new library
library(readxl)
Electric_production <- read_excel("C:/Users/Mya H/Downloads/Electric_production.xlsx")
View(Electric_production)

#11/12
#cannot do DiD with just hose variables, you need another one
  # just use time dummy for previous datasets
#bringing up new data
library(readxl)
Environmental_Treaties_dataset <- read_excel("C:/Users/Mya H/Downloads/Environmental Treaties dataset.xlsx")
View(Environmental_Treaties_dataset)

#starting DiD
Environmental_Treaties_dataset$time = ifelse(Environmental_Treaties_dataset$decade >= 1990, 1, 0)

Environmental_Treaties_dataset$DiD = Environmental_Treaties_dataset$time * Environmental_Treaties_dataset$europe

DiDEnviro = lm(treat_sigs ~ gov_days + time + europe + DiD, data = Environmental_Treaties_dataset)
summary(DiDEnviro)

#doing it in the regression instead of making new object
DiDEnviro1 = lm(treat_sigs ~ gov_days + europe*time, data = Environmental_Treaties_dataset)
summary(DiDEnviro1)

#new DiD with cut off 1970
Environmental_Treaties_dataset$time2 = ifelse(Environmental_Treaties_dataset$decade >= 1970, 1, 0)

DiDEnviro2 = lm(treat_sigs ~ gov_days + time2 * europe, data = Environmental_Treaties_dataset)
summary(DiDEnviro2)

#now 2010
Environmental_Treaties_dataset$time3 = ifelse(Environmental_Treaties_dataset$decade >= 2010, 1, 0)

DiDEnviro3 = lm(treat_sigs ~ gov_days + time3 * europe, data = Environmental_Treaties_dataset)
summary(DiDEnviro3)
  #not statistically significant

#choosing year and diff variable
Environmental_Treaties_dataset$time4 = ifelse(Environmental_Treaties_dataset$decade >= 2000, 1, 0)

DiDEnviro4 = lm(treat_sigs ~ gov_days + time4 * minority_dum, data = Environmental_Treaties_dataset)
summary(DiDEnviro4)

#Diff in Diff is NOT AN EXPERIMENT BECAUSE THERE IS NO RANDOM ASSIGNMENT
  #we are intentional in the cutoff
#11/19 - Panel Data
#Panel Data - it is time series
  #can be balanced or unbalanced depending on how uniform the time observations are
#serial or autocorrelation - this is when observations are similar and expected to be naturally correlated to some level
  #inherent trend/behavior/performance
    #to isolate effects of IVs on a DV need to account for what would naturally be occurring
    #LeBron is always going to score a lot of points
    #unemployment from month to month will be similar
    #Political Parties will have a predicted election vote share
#remedies
  #A lagged dv - include the previous time, T-1, as an IV in the regression
  #Fixed effects - FE, as opposed to Rando Eff, assumes there is something unobservant about a characteristic
    #uses dummies
  #Clustered Stan Err - tell the software to adjust the standard by the characteristic you choose
  #Panel Corrected SE - not as specific to the characteristic as CSE
    #still similar to CSE
#how to know when to do a FE
  #HT will tell you if a FE model is better than just a regular TS or LM that uses random effects
  #Run Hausman Test is significant, use FE
install.packages("plm")
library(plm)
fixed <- plm(y ~xl, data = dataframe, 
             index=c("country", "year"), 
             model = "within")
  #the index c tells what variable we are doing the fixed effect on
    #in the example we used TWO variable
    #for one variable only use one

random <- plm(y ~xl, data = dataframe, 
              index=c("country", "year"), 
              model = "random")
phtest (fixed, random) #hausman test
#11/21
library(readxl)
eumoney_matter <- read_excel("C:/Users/Mya H/Downloads/does eu money matter.xlsx")
View(eumoney_matter)

install.packages("pml")
library(plm)

#creating fe model
fixed_eu <- plm(validvoteturnout ~ lag_valid_vote + logeu_spent + unemploymentratelagged6months, data = eumoney_matter,
                index = c("country", "electionyear"), 
                model = "within")
summary(fixed_eu)

#creating random
random_eu <- plm(validvoteturnout ~ lag_valid_vote + logeu_spent + unemploymentratelagged6months, data = eumoney_matter,
                index = c("country", "electionyear"), 
                model = "random")
summary(random_eu)

#running test
phtest (fixed_eu, random_eu)
  #the lower the p-value, the more you need to use a FIXED model
  #in this case it is telling us to use a FE model

#redoing with no country, but add postcomm
fixed_eu2 <- plm(validvoteturnout ~ lag_valid_vote + logeu_spent + unemploymentratelagged6months + post_comm, data = eumoney_matter,
                index = "electionyear", 
                model = "within")
random_eu2 <- plm(validvoteturnout ~ lag_valid_vote + logeu_spent + unemploymentratelagged6months + post_comm, data = eumoney_matter,
                 index = "electionyear", 
                 model = "random")
    #error with the random one

#interaction (multiplying logeu_spent by post_comm) this is causality
fixed_eu3 <- plm(validvoteturnout ~ lag_valid_vote + logeu_spent*post_comm + unemploymentratelagged6months + post_comm, data = eumoney_matter,
                 index = c("electionyear"), 
                 model = "within")
summary(fixed_eu3)

random_eu3 <- plm(validvoteturnout ~ lag_valid_vote + logeu_spent*post_comm + unemploymentratelagged6months + post_comm, data = eumoney_matter,
                 index = c("electionyear"), 
                 model = "random")
  #same error as previous, so ig that means we should use fixed effects







