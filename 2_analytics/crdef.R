library(readr)
crdef <- read_csv("1_data/default.csv")
summary(crdef)


# describe
library(psych)
describe(crdef)
str(crdef)

library(tidyr)
library(ROSE)

# Balancing a dataset by biasing the training dataset
prop.table(table(crdef$default))

set.seed(123)
dt <- sort(sample(nrow(crdef),nrow(crdef)*.7))
dt

creditcard_train <- crdef[dt,]
creditcard_test  <- crdef[-dt,]

a <- nrow(creditcard_train)
b <- nrow(creditcard_test)
c <- sum(nrow(creditcard_train),nrow(creditcard_test))
d <- c(a/c, b/c)
d

prop.table(table(creditcard_test$class))
prop.table(table(creditcard_train$class))

##Undersampling method one
n_new <- 337/0.5
# could be 0.6
# 337 are the number of minority cases

#??ovun

undersamp_result1 <- ovun.sample(Class ~.,
                                   data = creditcard_train,
                                 method = "under",
                                      N = n_new ,
                                 seed = 123
                                 )
str(undersamp_result1)
class(undersamp_result1)

#Check the class-balance of the under-sampled dataset
#convert to dataframe as currently an ovun sample
cc_undersamp_train <-  undersamp_result1$data
str(cc_undersamp_train)
classcc_undersamp_train

#then can convert to tibbles etc

## Oversampling method 1
table(creditcard_train$class)
n_new <- 6551/0.5






