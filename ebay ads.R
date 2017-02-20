library(lubridate)
library(ggplot2)
getwd()
setwd("C:/Users/df84/Desktop/lets do it/New Projects")

# read in data, change file name or location for different cases
mydata <- read.csv("C:/Users/dayif/Desktop/lets do it/New Projects/Used Auto Ads Data - Ebay .csv", header=TRUE) 

# use dim to check how large is our data
dim(mydata)
# use sty to get further information 
str(mydata)
# take a look at our main response variable price
summary(mydata$price) # there is one NA, which means missing data point, we can simply remove it due to the large dataset volume 
mydata = mydata[complete.cases(mydata$price),]
summary(mydata$price)
options(scipen = 5,digits=4) # no scientific notation
quantile(mydata$price, 0.05)
quantile(mydata$price, 0.1)
quantile(mydata$price, 0.90)

ggplot(aes(x=vehicleType, y=price), data = mydata) + 
  geom_boxplot() +
  ylim(quantile(mydata$price, 0.05), quantile(mydata$price, 0.95))


p1 <- ggplot(aes(x="price", y=price), data = mydata) + 
  geom_boxplot()

p2 <- ggplot(aes(x="price", y=price), data = mydata) + 
  geom_boxplot() +
  ylim(0, quantile(mydata$price, 0.99))

p3 <- ggplot(aes(x="price", y=price), data = mydata) + 
  geom_boxplot() +
  ylim(0, quantile(mydata$price, 0.95))

p4 <- ggplot(aes(x="price", y=price), data = mydata) + 
  geom_boxplot() +
  ylim(0, quantile(mydata$price, 0.90))

# need to clean the dataset and convert the date format 
mydata$dateCrawled <- ymd(mydata$dateCrawled) 
mydata$dateCreated <- ymd_hms(mydata$dateCreated)
mydata$lastSeen <- ymd_hms(mydata$lastSeen)



class(mydata)
newdata = mydata[1:1000,]
summary(mydata)

ls()
names(mydata)
plot(newdata$price~newdata$kilometer)
plot(mydata$price~mydata$powerPS)
summary(mydata$price)
pie(table(mydata$notRepairedDamage))
hist(newdata$price)
str(mydata$price)
summary(newdata$price)
pie(table(mydata$offerType))
pie(table(mydata$vehicleType))
pie(table(mydata$abtest))
pie(table(newdata$abtest))
plot(newdata$price~newdata$monthOfRegistration)
plot(newdata$price~newdata$kilometer,type="l")
plot(newdata$price~newdata$powerPS)
new1=newdata[order(newdata$powerPS),]
str(newdata$powerPS)
is.numeric(newdata$kilometer)
newdata$powerPS = as.numeric(newdata$powerPS)
plot(newdata$price~newdata$powerPS)
pie(table(mydata$vehicleType))
pie(table(mydata$brand))
pie(table(mydata$fuelType))
pie(table(mydata$gearbox))
pie(table(mydata$notRepairedDamage))