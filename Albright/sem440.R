library(haven)
anes_ts <- read_dta("C:/Users/Mya H/Downloads/anes_timeseries_cdf_stata_20220916.dta")
View(anes_ts)

write.csv(anes_ts, "C:/Users/Mya H/Downloads/anes_ts.csv")
library(readxl)
pres_by_year <- read_excel("C:/Users/Mya H/Downloads/pres_by_year.xlsx")
View(pres_by_year)

###making stacked area chart
library(tseries)
library(ggplot2)
library(dplyr)
#changing data
library(reshape2)
###See how the the incumbent rating changed overtime
anes_ts$incumbent_rating <- ifelse(anes_ts$VCF9221 >= 1 & anes_ts$VCF9221 <=4, anes_ts$VCF9221, NA)
lmir = lm(incumbent_rating ~ year + extreme_party_dum1, data = anes_ts)
library(stargazer)
stargazer(lmir, type = 'text')

lmir12 = lm(incumbent_rating ~ P2012 + extreme_party_dum1, data = anes_ts)
library(stargazer)
stargazer(lmir12, type = 'text')

#nvm, wrong model, I want to see the difference between democrats and republicans 
# when the incumbent of a different party
anes_ts$incumbent_dum <- ifelse(anes_ts$VCF9221 %in% c(3, 4), 1, ifelse(anes_ts$VCF9221 %in% c(1, 2), 0, NA))

log_ir = glm(incumbent_dum ~ extreme_party_dum1 + P2016, data = anes_ts, family = binomial)
stargazer(log_ir, type = 'text')
# I want to see the difference between democrats and republicans
anes_ts$dem_dum <- ifelse(anes_ts$VCF0302 == 5, 1, ifelse(anes_ts$VCF0302 == 1, 0, NA))
anes_ts$rep_dum <- ifelse(anes_ts$VCF0302 == 1, 1, ifelse(anes_ts$VCF0302 == 5, 0, NA))

anes_ts$dem_rating <- anes_ts$dem_dum*anes_ts$incumbent_rating
anes_ts$demdum_rating <- anes_ts$dem_dum*anes_ts$incumbent_dum

anes_ts$rep_rating <- anes_ts$rep_dum*anes_ts$incumbent_rating
anes_ts$repdum_rating <- anes_ts$rep_dum*anes_ts$incumbent_dum
#merging data
anes_ts <- merge(anes_ts, pres_by_year, by = "year")

anes_ts$incumbent_rep_r_dem<- anes_ts$dem_dum*anes_ts$Rep_Pres
anes_ts$incumbent_dem_r_rep<- anes_ts$rep_dum*anes_ts$Dem_Pres





#maybe useful objects
library(plm)
anes_ts$P2012 = ifelse(anes_ts$VCF0004 >= 2012, 1, 0)
anes_ts$P2016 = ifelse(anes_ts$VCF0004 >= 2016, 1, 0)
anes_ts$extreme_party_dum3 = ifelse(anes_ts$party_id %in% c(0, 1, 2, 8, 9, 10), 1, 0)
anes_ts$extreme_party_dum2 = ifelse(anes_ts$party_id %in% c(0, 1, 9, 10), 1, 0)
anes_ts$extreme_party_dum1 = ifelse(anes_ts$party_id %in% c(0, 10), 1, 0)


anes_ts$DiD12_3 = anes_ts$P2012 * anes_ts$extreme_party_dum3
anes_ts$DiD12_2 = anes_ts$P2012 * anes_ts$extreme_party_dum2
anes_ts$DiD12_1 = anes_ts$P2012 * anes_ts$extreme_party_dum2
anes_ts$DiD16_3 = anes_ts$P2016 * anes_ts$extreme_party_dum3
anes_ts$DiD16_2 = anes_ts$P2016 * anes_ts$extreme_party_dum2
anes_ts$DiD16_1 = anes_ts$P2016 * anes_ts$extreme_party_dum1

anes_ts$year = anes_ts$VCF0004
as.numeric(anes_ts$year)

