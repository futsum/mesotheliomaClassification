
#########################################################################################
#########################################################################################
### Project - Prediction Model for Mesothelioma                              ############
### Purpose - Training of learners to predict whether a patient              ############
###           will be diagnosed with mesothelioma using patients' clinical   ############
###           data                                                           ############
### Author: Futsum Mosazghi                                                  ############
### Date: 12/15/2017                                                         ############
### Dataset: Mesothelioma.xlsx                                               ############
### Source: https://archive.ics.uci.edu/ml/machine-learning-databases/00351/ ############
#########################################################################################
#########################################################################################

#Required Libraries
library(readxl)
library(ggplot2)
library(gridExtra)
library(e1071)
library(dummies)
library(caret)
library(nnet)
library(ROSE)
library(h2o)
library(ROCR)
library(pROC)
library(randomForest)

# Loading the dataset to R studio using readxl package
mesothelioma = read_excel('Mesothelioma.xlsx', sheet = 'Data')

#the structure of the dataset
str(mesothelioma)

# some of the numeric columns are loaded as characters
# convert all the columns to numeric
mesothelioma = as.data.frame(lapply(mesothelioma, as.numeric))
str(mesothelioma)

# are there any missing values?
sum(is.na(mesothelioma))

# convert the diagnosis class to categorical - positive & negative
mesothelioma$class.of.diagnosis = factor(mesothelioma$class.of.diagnosis,
                                              labels = c('Negative', 'Positive'))

#summary of the dataset
summary(mesothelioma)

# Bargraph of Mesothelioma diagnosis
ggplot(mesothelioma, aes(class.of.diagnosis)) +
  geom_bar(aes(fill = class.of.diagnosis)) +
  labs(title = 'Mesothelioma diagnosis')

# Proportion of Mesothelioma diagnosis
round(prop.table(table(mesothelioma$class.of.diagnosis)) * 100)

# Histogram of the variable Age
ggplot(mesothelioma, aes(age)) +
  geom_histogram(fill = 'blue', binwidth = 7) +
  labs(title = 'Age distribution of Mesothelioma patients')

# Boxplot of Age by Gender
ggplot(mesothelioma, aes(factor(gender, labels = c('F','M')), age)) +
  geom_boxplot(aes(fill = gender)) +
  labs(title = 'Age distribution by Gender')

# summary of age of female patients
summary(mesothelioma$age[mesothelioma$gender == 0])

#summary of age of male patients
summary(mesothelioma$age[mesothelioma$gender == 1])

# frequecy of patients by gender
summary(factor(mesothelioma$gender,labels = c('F','M')))

#proportion of patients by gender
round(prop.table(table(factor(mesothelioma$gender,
                              labels = c('F','M')))) * 100) 

# bargraph of proportion of patients by gender
ggplot(mesothelioma, aes(factor(gender, labels = c('F','M')))) +
  geom_bar(aes(fill = gender)) +
  labs(title = 'Proportion of Patients by Gender')

# bargraph of mesothelioma patients by gender
ggplot(mesothelioma, aes(factor(gender, labels = c('F','M')))) +
         geom_bar(aes(fill = class.of.diagnosis)) +
         labs(title = 'Diagnosis of Mesothelioma by Gender')

# frequency of mesothelioma patients by gender
table(factor(mesothelioma$gender, labels = c('F','M')), 
      mesothelioma$class.of.diagnosis)

# proportion of female mesothelioma patients
round(prop.table(table(mesothelioma$class.of.diagnosis[mesothelioma$gender == 0])) 
      * 100)

# proportion of male mesothelioma patients
round(prop.table(table(mesothelioma$class.of.diagnosis[mesothelioma$gender == 1])) 
      * 100)

# proportion of those patients diagnosed positive by gender
round(prop.table(table
                 (factor(mesothelioma$gender[mesothelioma$class.of.diagnosis== 'Positive'],
                              labels = c('F','M')))) * 100) 

# bargraph of patients exposure to asbestos
ggplot(mesothelioma, 
       aes(factor(asbestos.exposure, labels = c('No','Yes')))) +
  geom_bar(aes(fill = asbestos.exposure)) +
  labs(title = "Patients' Exposure to Asbestos")

# proportion of patients exposure to asbestos
round(prop.table(table(factor(mesothelioma$asbestos.exposure, 
                              labels = c('No','Yes')))) * 100)

# bargraph of the relationship of Aspestos Exposure and Mesothelioma diagnosis
ggplot(mesothelioma, aes(factor(asbestos.exposure, labels = c('No','Yes')))) +
  geom_bar(aes(fill = class.of.diagnosis)) + 
  labs(title = 'Association between Aspestos Exposure and Mesothelioma Diagnosis')

# frequency of diagnosis of mesothelioma by asbestos exposure
table(mesothelioma$class.of.diagnosis,
                       factor(mesothelioma$asbestos.exposure, 
                              labels = c('No','Yes')))

# Boxplot of the duration of asbestos exposure
ggplot(mesothelioma, aes(class.of.diagnosis,duration.of.asbestos.exposure)) +
  geom_boxplot(aes(fill= class.of.diagnosis)) +
  labs(title = 'Distribution of Duration of Asbestos Exposure')

# summary of the duration of asbestos exposure for those diagnosed positive
summary(mesothelioma$duration.of.asbestos.exposure
        [mesothelioma$class.of.diagnosis == 'Positive'])

# summary of the duration of asbestos exposure for those diagnosed negative
summary(mesothelioma$duration.of.asbestos.exposure
        [mesothelioma$class.of.diagnosis == 'Negative'])

# Boxplot of the duratoin of mesothelioma symptoms
ggplot(mesothelioma, aes(class.of.diagnosis,duration.of.symptoms)) +
  geom_boxplot(aes(fill= class.of.diagnosis)) +
  labs(title = 'Distribution of duration of mesothelioma symptoms')

# summary of the duration of symptoms for those diagnosed positive
summary(mesothelioma$duration.of.symptoms
        [mesothelioma$class.of.diagnosis == 'Positive'])

# summary of the duration of symptoms for those diagnosed negative
summary(mesothelioma$duration.of.symptoms
        [mesothelioma$class.of.diagnosis == 'Negative'])

# bargraph of smoking habits of patients
ggplot(mesothelioma, aes(habit.of.cigarette)) +
  geom_bar(aes(fill = factor(habit.of.cigarette))) +
  labs(title = 'Smoking habits of Patients')

# proportion of smoking habits by number of cigarettes
round(prop.table(table(factor(mesothelioma$habit.of.cigarette))) * 100)

# bargraph of association of smoking habits and Mesothelioma diagnosis
ggplot(mesothelioma, aes(habit.of.cigarette)) +
  geom_bar(aes(fill = class.of.diagnosis)) +
  labs(title = 'Association of Smoking habits of Patients and Mesothelioma diagnosis')

# frequency of of smoking habits vs mesothelioma diagnosis
table(mesothelioma$class.of.diagnosis, factor(mesothelioma$habit.of.cigarette))


################################################
### Mesothelioma diagnosis Classification ##########
################################################

###normilizing the dataset
#creating a normaliing function
normalize = function(x) return ((x - min(x)) / (max(x) - min(x)))

#normilizing the variables without the variable of interest 'class of diagnosis'
meso_nor = as.data.frame(lapply(mesothelioma[-35], 
                                  normalize))
summary(meso_nor)

#combining the normalized variables with the variable of interest
new_meso = data.frame(class = mesothelioma$class.of.diagnosis, meso_nor)

str(new_meso)

### Splitting the dataset into training (70%) and test (30%) sets using random sampling
set.seed(12)      #set.seed() will help to reproduce the outcome
random_samples = sample(2, nrow(new_meso), replace = T, prob = c(0.7,0.3))
train_set = new_meso[random_samples==1,]
test_set = new_meso[random_samples==2,]

# number of observations for the training and test sets
nrow(train_set)
nrow(test_set)

#propertion of the training and test sets
round(prop.table(table(train_set$class)) * 100)
round(prop.table(table(test_set$class)) * 100)

##################################
### Building a model #############
##################################


### An Artificial Neural Network (ANN) Model ###

#building an ANN model using the training set
meso_ann = nnet(class ~ ., data = train_set, decay = 5e-4,
     size = 2, maxit = 5, trace = F, set.seed(123))

#summary of the ANN model
summary(meso_ann)

# Predicting mesothelioma diagnosis using the ANN model using the test set
meso_ann_prediction = predict(meso_ann, test_set, type = 'class')

head(meso_ann_prediction)

# Evaluating the performance of the model
confusionMatrix(meso_ann_prediction, test_set$class, positive = 'Positive')

#balancing the dataset
meso_balanced = ROSE(class ~ ., data = train_set, seed = 1)$data

#proportion of the balanced dataset
table(meso_balanced$class)
round(prop.table(table(meso_balanced$class))*100)

### build a model using the balanced dataset
meso_ann_balanced = nnet(class ~ ., data = train_set, decay = 5e-4,
                 size = 2, maxit = 5, trace = F, set.seed(123))

# prediction
meso_ann_pred_balanced = predict(meso_ann_balanced, test_set, type = 'class')

# performance evaluation
confusionMatrix(meso_ann_pred_balanced, test_set$class, positive = 'Positive')

### building an ANN model with 10 fold cross validataion

###cross validation
#control parameter
control = trainControl(method = 'repeatedcv', number = 10, repeats = 3,
                       classProbs = TRUE, summaryFunction = twoClassSummary)

#build an ANN model using the above control parameter
meso_ann_cv =train(class ~., data = train_set, method = 'nnet',
                   metric = 'ROC', trControl = control, trace = F)

# prediction
meso_cv_pred = predict(meso_ann_cv, test_set)

# performance evaluation
confusionMatrix(meso_cv_pred, test_set$class, positive = 'Positive')

#ROC evaluation
meso_ann_probs = predict(meso_ann_cv, test_set, type = 'prob')
meso_ann_roc = roc(response = test_set$class, predictor = meso_ann_probs$Positive,
                   levels = levels(test_set$class))
meso_ann_roc

### Feature Selection
set.seed(123)
control_fs <- rfeControl(functions=rfFuncs, method="cv", number=10)
results <- rfe(new_meso[,-1], new_meso[,1], 
               sizes=c(1:35), rfeControl=control_fs)
print(results)

#the selected features are
predictors(results)

#plotting the importance of the the features
plot(results, type = c('g','o'))

#listing the importance of the features
varImp(results)

# building a second ANN model using only the selected feature
meso_ann_fs = nnet(class ~ diagnosis.method, data = train_set, decay = 5e-4,
                size = 2, maxit = 5, trace = F, set.seed(123))

# prediction
meso_ann_pred_fs = predict(meso_ann_fs, test_set, type = 'class')

# performance evaluation
confusionMatrix(meso_ann_pred_fs, test_set$class, positive = 'Positive')


### A deep learning model
# Start a local cluster with 1GB RAM
localH2O = h2o.init(ip = "localhost", port = 54321, startH2O = TRUE)

# To use the h2o package, we need to convert our data frame into an h20frame object
meso_h2o = as.h2o(new_meso)

# type of the dataframe
class(meso_h2o)

#viewing the dimension
dim(meso_h2o)


#viewing the content
meso_h2o

# frequency of mesothelioma diagnosis
table.H2OFrame(meso_h2o$class)

#splitting the data: 70% for training and 30% for test set.

splits = h2o.splitFrame(meso_h2o, ratios = 0.7, seed=1234)
train  = h2o.assign(splits[[1]], "train.hex") 
test   = h2o.assign(splits[[2]], "test.hex")

#proportion of the the training and test sets
round(prop.table(table.H2OFrame(train$class)) * 100)
round(prop.table(table.H2OFrame(test$class)) * 100)

# building the deep learning model with two hidden layers
dl_model <- h2o.deeplearning(x = 2:35,  # column numbers for predictors
                           y = 1,   # column number for response
                           training_frame = train,
                           validation_frame = test,
                           activation = "TanhWithDropout",
                           variable_importances = T,
                           input_dropout_ratio = 0.2,
                           hidden_dropout_ratios = c(0.5,0.5), 
                           hidden = c(25,25), #two hidden layers
                           nfolds = 10, epochs = 100)

#model summary
summary(dl_model)

# prediction
dl_model_prediction = h2o.predict(dl_model, test)

#variable importance
as.data.frame(h2o.varimp(dl_model))

# the first 6 predictions
head(dl_model_prediction)$predict

#model performance
h2o.performance(dl_model, newdata = train)
h2o.performance(dl_model, newdata = test)

# performance evaluation
h2o.confusionMatrix(dl_model, test)


### building a randomforest Model ####

meso_rf = randomForest(class ~ ., data = train_set, importance = T)

#summary of the rf model
meso_rf 

#prediction
meso_rf_pred = predict(meso_rf, test_set)

# performance evaluation
confusionMatrix(meso_rf_pred, test_set$class, positive = 'Positive')