rm(list=ls()) #removes all variable stored previously
library(Hmisc) #import

data <- read.csv("C:/Users/ndari masayu/Downloads/COVID19_line_list_data.csv")
describe(data) #Hmisc command

#cleaned up death column
data$death_dummy <- as.integer(data$death !=0)
#death rate
sum(data$death_dummy) / nrow(data)

#AGE
#claim: people who die are older
dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)
#is this statistically significant?
t.test(alive$age, dead$age, alternative="two.sided", conf.level=95)

#GENDER
#claim: gender has no effect
men = subset(data, gender == "male")
women = subset(data, gender == "female")
mean(men$death_dummy, na.rm = TRUE)
mean(women$death_dummy, na.rm = TRUE)
#is this statistically significant?
t.test(alive$age, dead$age, alternative="two.sided", conf.level=0.95)

