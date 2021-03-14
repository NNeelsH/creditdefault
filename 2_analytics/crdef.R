library(readr)
crdef <- read_csv("1_data/default.csv")
summary(crdef)

# describe
library(psych)
describe(crdef)

library(tidyr)
prop.table(table(crdef$default))
