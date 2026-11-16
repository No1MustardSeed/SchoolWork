
library(dplyr)

#chi test 163
ct16_3 <- table(anes_ts$P2016, anes_ts$extreme_party_dum3)
print(ct16_3)

chitest163 <- chisq.test(ct16_3)
print(chitest163)

#chi test 161
ct16_1 <- table(anes_ts$P2016, anes_ts$extreme_party_dum1)
print(ct16_1)

chitest161 <- chisq.test(ct16_1)
print(chitest161)

#chi test 121
ct12_1 <- table(anes_ts$P2012, anes_ts$extreme_party_dum1)
print(ct12_1)

chitest121 <- chisq.test(ct12_1)
print(chitest121)

#chi test total
ct_full <- table(anes_ts$year, anes_ts$party_id)
print(ct_full)

chitest <- chisq.test(ct_full)
print(chitest)
