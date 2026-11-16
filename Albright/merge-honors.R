#importing data
library(readxl)
electoral_systems <- read_excel("C:/Users/Mya H/Downloads/idea_export_electoral_system_design_database_world.xlsx")
View(electoral_systems)

World_1_ <- read_excel("C:/Users/Mya H/Downloads/World (1).xlsx")
View(World_1_)

#Merging
library(dplyr)
World_Election_CSC231 <- left_join(
  World_1_,
  electoral_systems,
  c('Country'='Country'),
  suffix = c('.x','.y')    )
View(World_Election_CSC231)



