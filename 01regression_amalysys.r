path ="C:\Users\tp362\OneDrive\Desktop\machine learning\pract\ml"
setwd(path) #set working directory
mydata <- read.csv("airfoil_self_noise.csv") #load data and check data
str(mydata)
colSums(is.na(mydata)) #check missing values
cor(mydata)
regmodel <- lm(Sound_pressure_level ~ ., data = mydata)
summary(regmodel)
par(mfrow=c(2,2)) #set graphic output
plot (regmodel) #create residual plots
set.seed(1) #sample
d <- sample ( x = nrow(mydata), size = nrow(mydata)*0.7)
train <- mydata[d,] #1052 rows 
test <- mydata[-d,] #451 rows
regmodel <- lm (Sound_pressure_level ~.,data = train) #train model
summary(regmodel)
regpred <- predict(regmodel, test) #test model
library(Metrics)
rmse(actual = test$Sound_pressure_level,predicted = regpred)
d <- boxplot(train$Displacement,varwidth = T,outline = T,border = T,plot = T)
d$out #enlist outlier observations