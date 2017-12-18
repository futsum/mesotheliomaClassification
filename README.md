 <h1 align = 'Center'>Prediction Model for Malignant Mesothelioma </h1>
 
According to Centers for Disease Control and Prevention (CDC), a Malignant mesothelioma “is a neoplasm associated with occupational and environmental inhalation exposure to asbestos fibers and other elongate mineral particles (EMPs); it is a highly aggressive tumor of the serous membranes.  The median survival of patients with malignant mesothelioma is about 1 year from the time they are diagnosed. Between 1999 to 2015, a total of 45,221 mesothelioma related deaths were recorded in the Unites States (Mazurek, Syamlal, Wood, Hendricks, & Weston, 2017; Er, Tanrikulu, & Abakay, 2015).

It takes 20 to 40 years to develop a malignant mesothelioma from the time of exposure (Mazurek et al., 2017). As a result, mesothelioma is rare, and it is difficult to diagnosis; most patients diagnosed with mesothelioma when it is in advanced stage where treatment is less effective. Hence, early detection using patients’ clinical data is important (Ostroff et al., 2012). 

In this project, machine learning techniques will be used to predict patients with mesothelium. If patients with mesothelioma are identified early enough, medical experts can design proper treatment that can save the lives of their patients. As a student of Regis University, I’m hoping to reflect Regis values through this project. I’ll strive to excellency in each step of the way, and I hope this project provides an insight for creating a better expert decision support tool to help medical professions. 

R programming will be used for this project. Since the project is trying to predict patients with malignant mesothelioma, a classification method will be used. A learner will be trained using a patients’ clinical dataset. The first part of the project will focus on exploratory data analysis; in the second part, machine learning model will be built to predict patients with malignant mesothelioma. Both visual and non-visual analytical methods will be used to demonstrate the project. 

<h3> Required Libraries </h3>

![libraries]()
To conduct the data analysis, the following R packages will be used:

<h3> Data Collection </h3>

A clinical dataset from UC Irvine Machine Learning Repository will be used for this project. The dataset was prepared by Abdullah Cetin Tanrikulu from Dicle University Faculty of Medicine in Turkey, and it was donated to UCI in 2016. It has 324 observations and 35 variables. All the variables are numeric type. The dataset is available as excel spreadsheet; an R package “readxl “was used to upload it to R studio. 

<h3> Exploratory Data Analysis </h3>

The variable of interest is “class of diagnosis’; the goal is to accurately predict mesothelioma patients using patient’s clinical test results that could support the diagnosis capability of medical experts. There are no missing values in the dataset. 

![dataset structure](https://user-images.githubusercontent.com/2644463/33036907-1f4a3bd4-cded-11e7-9263-802975735898.PNG)

The response variable is converted to categorical variable to describe the diagnosis of mesothelioma as positive or negative. The following table summarizes the dataset. 

![summary1](https://user-images.githubusercontent.com/2644463/33045213-5956e5b8-ce09-11e7-8bf8-29030ae0cf32.PNG)

Out of 324 patients, only 96 (30%) are diagnosed positive.

![proportion diagnosis](https://user-images.githubusercontent.com/2644463/33627056-927cf592-d9b9-11e7-87aa-05fad74de811.PNG)

![meso diagnosis](https://user-images.githubusercontent.com/2644463/33627069-9c70d956-d9b9-11e7-9021-0fad173771eb.PNG)

The median age of the patients is 55. The age distribution looks roughly normal. 

![age histogram](https://user-images.githubusercontent.com/2644463/33622904-7583ffa6-d9ac-11e7-98a1-3de72c27edae.PNG)

The median age for female patients is 56 and the median age for male patients is 54. 

![age boxplot](https://user-images.githubusercontent.com/2644463/33052953-7991208a-ce2e-11e7-90c9-700bd642de6b.PNG)

Majority of the patients are male; 59% male vs 41% female.

![genderproportion](https://user-images.githubusercontent.com/2644463/33044415-1c03e934-ce06-11e7-811a-f87eec382666.PNG)

![genderpropplot1](https://user-images.githubusercontent.com/2644463/33051695-86b48c44-ce28-11e7-9d2c-a30db4d575fd.PNG)

Out of 134 female subjects, 51 patients (38%) diagnosed positive; and out of 190 male subjects 45 patients (24%) diagnosed positive. Looking at those patients diagnosed with mesothelioma, 53% are female and 47% are male; more female patients diagnosed positive to mesothelioma than male. 

![proportion meso gender](https://user-images.githubusercontent.com/2644463/33623897-ccb287b8-d9af-11e7-86d4-1d7b85930c62.PNG)

![genderplot2](https://user-images.githubusercontent.com/2644463/33051838-21e0e384-ce29-11e7-81ef-8b096d4772b8.PNG)

Majority of patients (86%) are exposed to asbestos. 

![exposure meso yes](https://user-images.githubusercontent.com/2644463/33624367-708a464a-d9b1-11e7-8f20-9409f0c41a59.PNG)

![asbestosexposure](https://user-images.githubusercontent.com/2644463/33623706-28a7315a-d9af-11e7-8164-1b29e8c30606.PNG)

Out of 280 patients exposed to asbestos, only 87 (31%) are diagnosed with mesothelioma and out of 44 patients who are not exposed to asbestos, only 9 (20%) are diagnosed with mesothelioma. 

![prop meso exposure](https://user-images.githubusercontent.com/2644463/33624508-dc668d88-d9b1-11e7-9bc2-84ac33e55d57.PNG)

![association meso exposure](https://user-images.githubusercontent.com/2644463/33624466-bbc15568-d9b1-11e7-9a3e-d55e747ad793.PNG)

The median duration of asbestos exposure is 34 days; the duration ranges from 0 days to 70 days.

![exposure days](https://user-images.githubusercontent.com/2644463/33625398-ac14b9c2-d9b4-11e7-93cc-7f9b8b01add3.PNG)

The overall median duration of symptoms is 5 days; for those diagnosed negative, the duration is 4 days and for those positively diagnosed, the duration is 6 days. 

![symptom days](https://user-images.githubusercontent.com/2644463/33625426-c13b6d46-d9b4-11e7-973e-6824b27c3c22.PNG)

Majority of the patients (56%) are non-smokers. 

![prop smoking habits](https://user-images.githubusercontent.com/2644463/33626320-7b660922-d9b7-11e7-9444-05dfabf69df9.PNG)

![smoking habits](https://user-images.githubusercontent.com/2644463/33626655-77cf7afe-d9b8-11e7-84b2-feffa2b550ba.PNG)

Out of 183 non-smokers, 57 (31%) are diagnosed positive, in contrast, out of 141 smokers, only 39 (28%) are diagnosed positive.

![prop smoking habits Meso](https://user-images.githubusercontent.com/2644463/33626398-b147157c-d9b7-11e7-9161-a332dad9ca77.PNG)

![smoking habits Meso](https://user-images.githubusercontent.com/2644463/33626416-bf89bd9c-d9b7-11e7-9766-9491380300a5.PNG)




<h3> Data Analysis </h3>

<h4>Preparing the data for model building</h4>

Some of the predictors have a wider range than the others; before proceeding to the next step, the variables need to be normalized.  After normalizing, all the predictors are within the range of 0 and 1.

![normalized dataset](https://user-images.githubusercontent.com/2644463/33799192-0c6b47a0-dce4-11e7-8ca3-66d324527b6f.PNG)

<h3>Training and Test Sets</h3>

The dataset is split into training (70%) and test (30%) sets; training set is used to train the learner and a test set is used to evaluate the performance of the learner. Both sets reflect the original dataset with a record of 30% of positive and 70% negative diagnosis.

<h3>Model Building</h3>

Different learners using Artificial Neural Networks (ANN), Deep Learning, and Random Forest algorithms will be trained to classify the diagnosis mesothelioma patients. The performance of the classifiers will be evaluated. The classifier with the best performance will be recommended as the final model for mesothelioma diagnosis classification for the given dataset.

<h3>Artificial Neural Networks (ANN)<h3>

The first learner is an ANN classifier; the nnet package is used to build the classifier. The ANN classifier was trained using the training set. 

![ANN model](https://user-images.githubusercontent.com/2644463/33799201-42ed4b98-dce4-11e7-9aad-f9c1fb7b5b02.PNG)

<h3>Prediction</h3>

The ANN learner was used to predict the outcome of the mesothelioma diagnosis using the test set. The outcome of the first six patients is: 

![ANN Prediction](https://user-images.githubusercontent.com/2644463/33799206-68f7c23c-dce4-11e7-97f6-d61f0dd1fc12.PNG)

<h3>Performance Evaluation</h3>

The overall accuracy rate of the ANN classifier is 69%. The sensitivity rate (true positive or positive diagnosis agreement between the predicted and the observed values) is 0% and the specificity rate (true negative or negative diagnosis agreement between the predicted and the observed values) is 100%. A Kappa of 0 % indicates a poor agreement between the predicted and observed values. At 0% sensitivity rate, the model has misclassified all the positive diagnosed patients as negative. Since the interest of the project is to identify those patients with positive diagnosis, the ANN model is a very poor model.

![ANN performance](https://user-images.githubusercontent.com/2644463/33799208-83a79184-dce4-11e7-8206-d76aa71e3b64.PNG)

<h3>Balancing the dataset</h3>

The misclassification of patients could be as a result of an imbalanced dataset; the majority of the diagnosis of the patients is negative. The model might not be getting enough information about the minority (positive) diagnosis; the model is biased towards the negative diagnosis. 

To balance the dataset, ROSS package has been used.

![balancing dataset](https://user-images.githubusercontent.com/2644463/33799221-cc580f8a-dce4-11e7-93ec-fbfde9349239.PNG)

Using the oversampling technique, ROSE replicated the positive diagnosis examples to balance the dataset. Now, the proportion of the dataset is 51% positive and 49% negative.

![balance proportion](https://user-images.githubusercontent.com/2644463/33799224-de54c232-dce4-11e7-89d2-5cb231f7311d.PNG)

The performance of an ANN model using the balanced dataset is the same as the original ANN model; balancing the dataset didn’t improve the performance. 

![balance ANN perf](https://user-images.githubusercontent.com/2644463/33799239-13e00308-dce5-11e7-8e90-5cc1b492b52d.PNG)

<h3>ANN Model using cross-validation</h3>

Can cross-validation improve the performance of the ANN model? Using a 10-fold cross-validation, an ANN model was developed. The model produced a 100% accuracy rate with sensitivity, accuracy, and Kappa rates of 100%. Cross-validation improved the accuracy of the ANN model.

![crossvalidation ANN perf](https://user-images.githubusercontent.com/2644463/33799244-2cd43b86-dce5-11e7-8d42-9d7fd84d8e9e.PNG)

<h3>Feature Selection</h3>

Can the performance of the ANN model be improved using feature selection? Feature selection method helps to identify subset of features that are required to build a model; not all features are equally important in model building. A recursive feature elimination function from the caret package has been used to eliminate those features not necessary required to develop a model. The function has selected only one feature – diagnosis method, as the only important feature. 

![selected feature](https://user-images.githubusercontent.com/2644463/33799256-506ddbc4-dce5-11e7-9a93-3da11073fe7b.PNG)

![plot selected feature](https://user-images.githubusercontent.com/2644463/33799271-908fe882-dce5-11e7-87a3-599923cb31de.PNG)

<h3>ANN model using the selected feature</h3>

An ANN model was developed using the selected feature. The accuracy rate of the ANN model using the selected feature generated an accuracy rate of 100% - no patient is misdiagnosed. The sensitivity rate, the specificity rate, and the Kappa are all 100%. Feature selection improved the accuracy of the ANN model. 

![ANN selected feature perf](https://user-images.githubusercontent.com/2644463/33799279-a715dc4c-dce5-11e7-9deb-2f4530adeea7.PNG)

<h3>Deep Learning Classifier</h3>

Another classifier was developed using a deep learning algorithm using the H2O package. The model has two hidden layers with 25 nodes each and 100 epochs. 

![deeplearning model](https://user-images.githubusercontent.com/2644463/33799284-c279ce3a-dce5-11e7-95c7-b67bd2d3c150.PNG)

<h3>Variable Importance</h3>

The following list shows the importance of the features in building the deep learning classifier.

![variable imp](https://user-images.githubusercontent.com/2644463/33799301-095f7a98-dce6-11e7-879a-597e65e0e054.PNG)

The deep learning models has an accuracy rate of 100% with sensitivity, specificity, AUC, and Kappa rate of 100%. 

![deeplearning model perf](https://user-images.githubusercontent.com/2644463/33799302-10b211fc-dce6-11e7-8359-b1f84c4a315d.PNG)

<h3>Random Forest Model</h3>

Finally, a random forest classifier was developed. 

![randomforest model](https://user-images.githubusercontent.com/2644463/33799340-bf74e0f2-dce6-11e7-895a-ab28cedac8cd.PNG)

The accuracy of a random forest model is 100% with sensitivity, specificity, and Kappa rate of 100%. 

![randomforest model perf](https://user-images.githubusercontent.com/2644463/33799314-6380cac2-dce6-11e7-9ea2-4a7515d24a48.PNG)

<h3>Model Comparison</h3>

The first ANN model has a very poor performance with 69% accuracy rate and 0% sensitivity rate. Balancing the dataset didn’t improve the ANN model. However, a 10-fold cross-validation improved the ANN model tremendously with an accuracy rate of 100%. Also, feature selection has improved to ANN model to produce a 100% accuracy rate. Moreover, both deep learning and random forest classifiers generated a 100% accuracy rate.

![model comparison](https://user-images.githubusercontent.com/2644463/33799330-8fc712e4-dce6-11e7-8c37-f29c077db2b1.PNG )

<h3>Model Selection</h3>

Either a deep learning classifier, or a random forest classifier, or an ANN model with 10-fold cross-validation can be used as a final model for diagnosis of mesothelioma patients. 

<h3> Summary </h3>

Early detection of Mesothelioma is very important. Machine learning models can help in accurately predicting the diagnosis of mesothelioma patients. In this project, a deep learning classifier, a random forest learner, and an artificial neural network model predicted the diagnosis of mesothelioma patients at 100% accuracy rate. At this rate of accuracy, these models can be used as expert decision support tools to aid medical professionals in diagnosing mesothelioma patients accurately. 

<h3> Reference </h3>

Er, O., Tanrikulu, C., & Abakay, A. (2015). Use of artificial intelligence techniques for diagnosis of malignant pleural mesothelioma. Dicle Medical Journal, 42 (1): 5-11. doi: 10.5798/diclemedj.0921.2015.01.0521 

Mazurek, J. M., Syamlal, G., Wood, J. M., Hendricks, S. A. & Weston, A. (2017, March 3). Malignant Mesothelioma Mortality — United States, 1999–2015. Centers for Disease Control and Prevention (CDC). Weekly / 66(8);214–218. Retrieved from https://www.cdc.gov/mmwr/volumes/66/wr/mm6608a3.htm

Ostroff, R. M., Mehan, M. R., Stewart, A., Ayers, D., Brody, E. N., Williams, S. A., Levin, S., Black, B., Harbut, M., Carbone, M., Goparaju, C., & Pass, H. I. (2012). Early detection of malignant pleural mesothelioma in asbestos-exposed individuals with a noninvasive proteomics-based surveillance tool. PLOS ONE7(10): e46091. https://doi.org/10.1371/journal.pone.0046091

UCI Machine Learning Repository (n.d). Mesothelioma disease dataset. Retrieved from https://archive.ics.uci.edu/ml/datasets/Mesothelioma%C3%A2%E2%82%AC%E2%84%A2s+disease+data+set+

Yu-Wei, C. (2016). Machine learning with R cookbook. Birmingham, UK. Packt Publishing Ltd.

