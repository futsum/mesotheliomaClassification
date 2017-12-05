 <h1 align = 'Center'>Prediction Model for Malignant Mesothelioma </h1>
 
According to Centers for Disease Control and Prevention (CDC), a Malignant mesothelioma “is a neoplasm associated with occupational and environmental inhalation exposure to asbestos fibers and other elongate mineral particles (EMPs); it is a highly aggressive tumor of the serous membranes.  The median survival of patients with malignant mesothelioma is about 1 year from the time they are diagnosed. Between 1999 to 2015, a total of 45,221 mesothelioma related deaths were recorded in the Unites States (Mazurek, Syamlal, Wood, Hendricks, & Weston, 2017; Er, Tanrikulu, & Abakay, 2015).

It takes 20 to 40 years to develop a malignant mesothelioma from the time of exposure (Mazurek et al., 2017). As a result, mesothelioma is rare, and it is difficult to diagnosis; most patients diagnosed with mesothelioma when it is in advanced stage where treatment is less effective. Hence, early detection using patients’ clinical data is important (Ostroff et al., 2012). 

In this project, machine learning techniques will be used to predict patients with mesothelium. If patients with mesothelioma are identified early enough, medical experts can design proper treatment that can save the lives of their patients. 
R programming will be used for this project. Since the project is trying to predict patients with malignant mesothelioma, a classification method will be used. A learner will be trained using a patients’ clinical dataset. The first part of the project will focus on exploratory data analysis; in the second part, machine learning model will be built to predict patients with malignant mesothelioma. Both visual and non-visual analytical methods will be used to demonstrate the project. 

<h3> Required Libraries </h3>
To conduct the data analysis, the following R packages will be used:

<h3> Data Collection </h3>

A clinical dataset from UC Irvine Machine Learning Repository will be used for this project. The dataset was prepared by Abdullah Cetin Tanrikulu from Dicle University Faculty of Medicine in Turkey, and it was donated to UCI in 2016. It has 324 observations and 35 variables. All the variables are numeric type. The dataset is available as excel spreadsheet; an R package “readxl “was used to upload it to R studio. 

<h3> Exploratory Data Analysis </h3>

The variable of interest is “class of diagnosis’; the goal is to accurately predict mesothelioma patients using patient’s clinical test results that could support the diagnosis capability of medical experts. There are no missing values in the dataset. 

![dataset structure](https://user-images.githubusercontent.com/2644463/33036907-1f4a3bd4-cded-11e7-9263-802975735898.PNG)

The response variable is converted to categorical variable to describe the diagnosis of mesothelioma as positive or negative. The following table summarizes the dataset. Out of 324 patients, only 96 are found to test positive for malignant mesothelioma. 

![summary1](https://user-images.githubusercontent.com/2644463/33045213-5956e5b8-ce09-11e7-8bf8-29030ae0cf32.PNG)

The median age of the patients is 55. The age distribution looks roughly normal. 

![age histogram](https://user-images.githubusercontent.com/2644463/33622904-7583ffa6-d9ac-11e7-98a1-3de72c27edae.PNG)

The median age for female patients is 56 and the median age for male patients is 54. 

![age boxplot](https://user-images.githubusercontent.com/2644463/33052953-7991208a-ce2e-11e7-90c9-700bd642de6b.PNG)

Majority of the patients are male; 59% male vs 41% female.

![genderproportion](https://user-images.githubusercontent.com/2644463/33044415-1c03e934-ce06-11e7-811a-f87eec382666.PNG)

![genderpropplot1](https://user-images.githubusercontent.com/2644463/33051695-86b48c44-ce28-11e7-9d2c-a30db4d575fd.PNG)

Out of 134 female subjects, 51 patients (38%) diagnosed positive; and out of 190 male subjects 45 patients (24%) diagnosed positive. Looking at those patients diagnosed with mesothelioma, 53% are female and 47% are male; more female patients diagnosed positive to mesothelioma than male. 

![genderplot2](https://user-images.githubusercontent.com/2644463/33051838-21e0e384-ce29-11e7-81ef-8b096d4772b8.PNG)

<h3> Data Analysis </h3>

Preparing the data for model building

<h3> Summary </h3>

<h3> Reference </h3>

Er, O., Tanrikulu, C., & Abakay, A. (2015). Use of artificial intelligence techniques for diagnosis of malignant pleural mesothelioma. Dicle Medical Journal, 42 (1): 5-11. doi: 10.5798/diclemedj.0921.2015.01.0521 

Mazurek, J. M., Syamlal, G., Wood, J. M., Hendricks, S. A. & Weston, A. (2017, March 3). Malignant Mesothelioma Mortality — United States, 1999–2015. Centers for Disease Control and Prevention (CDC). Weekly / 66(8);214–218. Retrieved from https://www.cdc.gov/mmwr/volumes/66/wr/mm6608a3.htm

Ostroff, R. M., Mehan, M. R., Stewart, A., Ayers, D., Brody, E. N., Williams, S. A., Levin, S., Black, B., Harbut, M., Carbone, M., Goparaju, C., & Pass, H. I. (2012). Early detection of malignant pleural mesothelioma in asbestos-exposed individuals with a noninvasive proteomics-based surveillance tool. PLOS ONE7(10): e46091. https://doi.org/10.1371/journal.pone.0046091

UCI Machine Learning Repository (n.d). Mesothelioma disease dataset. Retrieved from https://archive.ics.uci.edu/ml/datasets/Mesothelioma%C3%A2%E2%82%AC%E2%84%A2s+disease+data+set+


