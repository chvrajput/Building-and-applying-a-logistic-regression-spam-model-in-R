rm(list=ls())
#Load tha spam data
data(spam)
set.seed(1000)# Pseudo random number generator # Given the same seed , gives the same seq
#split the data into training and testing
split = sample.split(spam$type, SplitRatio = 0.70)# p = 0.70 means train =70% data and test = 30% data
training <- subset(spam,split==TRUE)
testing <- subset(spam,split==FALSE)
dim (training) #/ dimension of an object # output: 3221       58
dim (testing) ##output: 1380      58

#Building and applying Logistic regression spam model
modelFit <- glm(type~. , data = training , family = binomial) 
# train is the command from caret package 
# ~. is used to use all the other variables in this data frame
summary(modelFit)
predict = predict(modelFit,type="response",newdata=testing)

#confusion matrix 
(table(testing$type,predict>0.5))

# Accuracy is 93%
#Precision is 92%
#Recall is 90%
#sensitivity means true positive rate ans exactly equal to recall ie 90%
#specificity means true negative rate is 94%
