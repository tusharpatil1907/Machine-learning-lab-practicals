install.packages("randomForest")
library(randomForest)
data1 <- read.csv(file.choose(), header = TRUE)
head(data1)
str(data1)
summary(data1)
# Split into Train and Validation sets
# Training Set : Validation Set = 70 : 30 (random)
set.seed(100)
train <- sample(nrow(data1), 0.7*nrow(data1), replace = FALSE)
TrainSet <- data1[train,]
ValidSet <- data1[-train,]
summary(TrainSet)
summary(ValidSet)
# Create a Random Forest model with default parameters
model1 <- randomForest(Condition ~ ., data = TrainSet, importance = TRUE)
model1
# Fine tuning parameters of Random Forest model
model2 <- randomForest(Condition ~ ., data = TrainSet, ntree = 500, mtry = 6, importance = 
TRUE)
model2
# Predicting on train set
predTrain <- predict(model2, TrainSet, type = "class")
# Checking classification accuracy
table(predTrain, TrainSet$Condition) 
# Predicting on Validation set
predValid <- predict(model2, ValidSet, type = "class")
# Checking classification accuracy
mean(predValid == ValidSet$Condition) 
table(predValid,ValidSet$Condition)
# To check important variables
importance(model2) 
varImpPlot(model2) 
 
Output of the program and analysis