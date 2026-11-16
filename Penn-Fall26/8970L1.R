library(readr)
Nursing_Home <- read_csv("Nursing Home.csv")
View(Nursing_Home)

colnames(Nursing_Home)

mean(Nursing_Home$NSAL)
median(Nursing_Home$NSAL)
min(Nursing_Home$NSAL)
max(Nursing_Home$NSAL)
sd(Nursing_Home$NSAL)

mean(Nursing_Home$FEXP[Nursing_Home$RURAL == 1])
mean(Nursing_Home$FEXP[Nursing_Home$RURAL == 0])

Nursing_Home$BED100 <- ifelse(Nursing_Home$BED <=100, 1, 0)

table(Nursing_Home$BED100)
