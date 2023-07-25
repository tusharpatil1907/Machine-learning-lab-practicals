require("datasets")
data("iris") # load Iris Dataset
str(iris) #view structure of dataset
summary(iris) #view statistical summary of dataset
head(iris) #view top rows of dataset
iris.new<- iris[,c(1,2,3,4)]
iris.class<- iris[,"Species"]
head(iris.new)
head(iris.class)
normalize <- function(x){
 return ((x-min(x))/(max(x)-min(x)))
}
iris.new$Sepal.Length<- normalize(iris.new$Sepal.Length)
iris.new$Sepal.Width<- normalize(iris.new$Sepal.Width)
iris.new$Petal.Length<- normalize(iris.new$Petal.Length)
iris.new$Petal.Width<- normalize(iris.new$Petal.Width)
head(iris.new)
result<- kmeans(iris.new,3) 
result$size # gives no. of records in each cluste
result$centers 
result$cluster 
table(result$cluster,iris.class)
par(mfrow=c(2,2), mar=c(5,4,2,2))
plot(iris.new[c(1,2)], 
col=result$cluster)
plot(iris.new[c(1,2)], col=iris.class)
plot(iris.new[c(3,4)], col=result$cluster)
plot(iris.new[c(3,4)], col=iris.class)
tunek <- kmeansruns(scaled_wd,krange = 1:10,criterion = "ch") 
tunek$bestk 
> tunekw <- kmeansruns(scaled_wd,krange = 1:10,criterion = "asw") > tunekw$bestk