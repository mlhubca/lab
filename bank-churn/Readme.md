# Predicting Banking Customer Churn by Unlocking Big Data
 
 ![](https://github.com/mlhubca/lab/blob/master/bank-churn/images/churn.jpeg)

 ## Introduction
 
Customer churn and engagement has become one of the top issues for most banks. It costs significantly more to acquire new customers than retain existing ones, and it costs far more to reacquire deflected customers. In fact, several studies have proven that churn remains one of the biggest destructors of enterprise values.
 
To identify early signs of potential churn and take actions to avoid losing customers, organizations start getting a holistic view of the customers including their interactions across multiple channels such as bank visits, calls to customer service departments, web-based transactions, mobile banking and social media interactions. 
 
By leveraging the holistic customer information, organizations can build a viable churn prediction model. The churn prediction model with high predictive score will arm organizations with the insights to identify customers with high-risk churn so they can take specific proactive actions to prevent churn.
 
In a nutshell, the use of Big Data and sophisticated machine learning models give banks a distinct competitive advantage to predict and prevent churn, drive cross-sell and build customer loyalty.
 
In this workshop, you will learn how to use IBM's industry leading Data Science Experience to create churn prediction models using notebooks and visual Model Builder, and deploy the models to a live system, and monitor and evaluate the model performance over time. 

### Data 

Data set `bank-churn.csv` has the following schema:

|No.| Name | Data Type|
|---|------|----------|
|1| CUST_ID | integer |
|2| SEX |  string |
|3| AGE |  integer|
|4| EDUCATION |  integer |
|5| INVESTMENT |  integer |
|6| INCOME |  integer |
|7| ACTIVITY |  integer |
|8| CHURN |  integer |
|9| YRLY_AMT |  double |
|10| AVG_DAILY_TX |  double |
|11| YRLY_TX |  integer |
|12| AVG_TX_AMT |  double |
|13| NEGTWEETS |  integer |
|14| STATE |  string |
|15| EDUCATION_GROUP |  string |
|16| TwitterID |  double |
|17| CHURN_LABEL |  string |

The data set has 6001 rows of data. 

What are we trying to predict?
 - Whether a customer has a high probability of churn or not
 - CHURN is the Label: 1 (True) or 0 (False)

What are the properties that we can use to make predictions?
 - Customer demographics, activities, social data, etc.
 - To build a classifier model, you extract the features of interest that most contribute to the classification.

### Exercise Summary

This tutorial takes you step-by-step through the process of creating machine learning models using notebooks, machine learning flow and the model builder.

- [Exercise 1: Creating a model using a notebook](https://github.com/mlhubca/lab/blob/master/bank-churn/Readme.md#exercise-1-creating-a-model-using-a-notebook)

  This notebook guides you through the common machine learning workflow:
   - Data acquisition
   - Data exploration & visualization
   - Data preparation
   - Model training
   - Model evaluation
   - Model application
  
  **Technology:** Python, Apache Spark, Jupyter notebook, Scikit-learn, TensorFlow, Pandas, matplotlib, Brunel

- [Exercise 2: Creating a model using machine learning flow](https://github.com/mlhubca/lab/blob/master/bank-churn/Readme.md#exercise-2-creating-a-model-using-machine-learning-flow)

   *Machine learning flow is a graphical representation of data, by using the Flow Editor to prepare or shape data, train or deploy a model, or transform data and export it back to a database table or file in object storage.*
   
   **Technology:** SPSS Modeler, feature selection, auto classifier, data audit, field operations, data visualization 

- [Exercise 3: Creating a model using model builder](https://github.com/mlhubca/lab/blob/master/bank-churn/Readme.md#exercise-3-creating-a-model-using-model-builder)

   *The model builder uses the power of Watson Machine Learning to automatically prepare data and build models.*
   
   **Technology:** Watson Machine Learning, Auto data preparation (ADP), Cognitive Assistant for Data Scientists (CADS)

- [Exercise 4 (Optional): Creating a model using model builder in manual mode](https://github.com/mlhubca/lab/blob/master/bank-churn/Readme.md#exercise-4-optional-creating-a-model-using-model-builder-in-manual-mode)
  
  *The model builder in manual model allows you to select and evaluate multiple machine learning models*


### Prerequisites

1. Sign up to IBM Data Science Experience (DSX): https://datascience.ibm.com/
2. Sign in to DSX
3. On DSX, create a new project
    - Click `Projects`, and select `View All Projects`
    - Click the `New` button to create a new project
    - On the `New Project` page, input `Bank Churn` as the project name
    - In the `Target container` field, input `churn` as the container name
    - Click the `Create` button
4. Download dataset `bank-churn.csv` from Github
    - Use a new browser tab to access dataset: https://github.com/mlhubca/lab/blob/master/bank-churn/bank-churn.csv
    - Right-click the `Raw` button on the toolbar, and select `Save Link As...` or `Save Content As...` (depending on your browser)
5. Upload dataset `bank-churn.csv` to your project
    - On DSX, open your project
    - Click the `Add to project` dropdown and select `Data asset` from the dropdown menu
    - On your right-hand panel, select the `Load` tab
    - Drop file `bank-churn.csv` to the box or browse file `bank-churn.csv` and add the file to the project


## Exercise 1: Creating a model using a notebook

*Notebook is an interactive web application that allows you to create and share documents that contain live code, equations, visualizations and narrative text.* 

![](https://github.com/mlhubca/lab/blob/master/bank-churn/images/notebook.png)

**Technology**

Python, Apache Spark, Jupyter notebook, Scikit-learn, TensorFlow, Pandas, matplotlib, Brunel


**Steps**

1. Import a new notebook from a URL to the project
    - On DSX, open your project
    - Click the `Add to project` dropdown and select `Notebook` from the dropdown menu
    - On the `New Notebook` page, select `From URL` tab
    - In the `Name` field, input `Churn Prediction` as the notebook name
    - In the `Notebook URL` field, input this URL: `https://raw.githubusercontent.com/mlhubca/lab/master/bank-churn/bank-churn-prediction-with-scikit-learn-TensorFlow.ipynb`
    - Click the `Create Notebook` button
  
2. Execute code in the notebook cells
   - Place cursor in cell and press `Ctrl + Enter`, or selecting menu `Run -> Run Cells` from the notebook toolbar.


## Exercise 2: Creating a model using machine learning flow

*Machine learning flow is a graphical representation of data, by using the Flow Editor to prepare or shape data, train or deploy a model, or transform data and export it back to a database table or file in object storage.*

![](https://github.com/mlhubca/lab/blob/master/bank-churn/images/bank-churn-flow.png)

**Technology**

SPSS Modeler, feature selection, auto classifier, data audit, field operations, data visualization 

**Steps**

#### Creating a new flow
1) Add a new flow using `New flow` button or from the "Add to project" dropdown, select "SPSS Modeler flow"
2) On the Create Flow page,
    - Specify a name, e.g. `Bank Churn Flow`
    - **Select `IBM SPSS Modeler` Runtime**
    - Click "Create Flow"

#### Loading data
3) Drag and drop node `bank-churn.csv` from the Files list to the flow
4) Click Palette icon (first icon on the toolbar) to show node palette

#### Checking data quality
5) Add `Data Audit` node from the `Outputs` list on the palette
6) Connect file `bank-churn.csv` node to `Data Audit` node
7) Run `Data Audit` node to generate output

#### Filtering data
8) Add `Filter` node from the `Field Operations` list on the palette
9) Connect file `bank-churn.csv` node to `Filter` node
10) Open `Filter` node, select columns `CUST_ID`, `TwitterID` and `CHURN_LABLE` (to be filtered)

#### Setting metadata
11) Add node `Type` node from the `Field Operations` list on the palette
12) Connect file `Filter` node to `Type` node
13) Open `Type` node, add all columns to the Types list
14) Locate `CHURN` field, and
     - Change Measure from `Range` to `Flag`
     - Change Role from `Input` to `Target`

#### Selecting features
15) Add `Feature Selection` node from the `Modeling` list on the palette
16) Connect `Feature Selection` node to node "Type" (note that the Feature Selection node name is being changed to CHURN)
17) Run node `CHURN` (Feature Selection). When the execution completes, a new model node `CHURN` is created 
18) Add `Data Audit` node from the `Outputs` list on the palette
19) Connect the new model node `CHURN` to `Data Audit` node
20) Run `Data Audit` node to generate output

#### Splitting data
21) Add `Partition` node from the `Field Operations` list on the palette
22) Connect the new model node `CHURN` to `Partition` node
23) Open `Partition` node, change the Training and Test partition to the ratio of 80/20.

#### Building model - Auto classifier
24) Add `Auto Classifier` node from the `Modeling` list on the palette
25) Connect `Auto Classifier` to node `Partition`(note that the Auto Classifier node name is being changed to CHURN automatically)
26) Run node `CHURN` (Auto Classifier). When the execution completes, a new model node `CHURN` is created automatically. 

#### Aanlyzing model performance
27) Add `Analysis` node from the `Outputs` list on the palette
28) Connect the new model nodel `CHURN` to `Analysis` node
29) Run `Analysis` node to generate output

#### Executing the flow
30) Run the whole flow by clicking the `Run` button on the toolbar

## Exercise 3: Creating a model using model builder

*The model builder uses the power of Watson Machine Learning to automatically prepare data and build models.*

**Technology**

Watson Machine Learning, Auto data preparation (ADP), Cognitive Assistant for Data Scientists (CADS)

![](https://github.com/mlhubca/lab/blob/master/bank-churn/images/bank-churn-auto-model.png)

**Steps**

1) Add a new model using `New model` button or from the `Add to project` dropdown, select `Model`
2) On the `New model` page
    - Specify a model name, e.g. Bank Churn Model
    - Select a Machine Learning Service. 
       *If you don't have a machine learning service, follow the instructions to provision a machine learning service. Press the `Reload` button after you provision a new machine learning service*
     - Select a Spark Service or use the default service
     - Use the default `Automatic` method
     - Click `Create` button
3) In the `Select Data` stage, select data asset `bank-churn.csv`
4) In the `Train` stage, 
     - Select `CHURN (Integer)` as the Label col
     - Select `All (default)` as the Feature columns
     - Select technique `Binary Classification`
     - Use the default Validation split (Train: 60, Test: 20, Holdout:20)
5) In the `Evaluate` stage, save the model
6) Review the model details
7) On the Deployments tab, add an Online deployment, specify a name as `Bank Churn Online`
8) View the details of the online deployment

## Exercise 4 (Optional): Creating a model using model builder in manual mode

*The model builder in manual model allows you to select and evaluate multiple machine learning models*

![](https://github.com/mlhubca/lab/blob/master/bank-churn/images/bank-churn-model.png)

**Steps**

1) Add a new model using `New model` button or from the `Add to project` dropdown, select `Model`
2) On the `New model` page
    - Specify a model name, e.g. Bank Churn Model
    - *Select a Machine Learning Service. If you don't have a machine learning service, follow the instructions to provision a machine learning service. Press the `Reload` button after you provision a new machine learning server*
     - Select a Spark Service or use the default service
     - Use the default `Manual` method
     - Click `Create` button
3) In the `Select Data` stage, select data asset `bank-churn.csv`
4) In the `Train` stage, 
     - Select `CHURN (Integer)` as the Label col
     - Select the following columns as the Feature columns (excluding CUST_ID, TwitterID, EDUCATION_GROUP and CHURN_LABEL columns) :
     SEX (String), 
     AGE (Integer), 
     EDUCATION (Integer), 
     INVESTMENT (Integer), 
     INCOME (Integer), 
     ACTIVITY (Integer), 
     YRLY_AMT (Decimal), 
     AVG_DAILY_TX (Decimal), 
     YRLY_TX (Integer), 
     AVG_TX_AMT (Decimal), 
     NEGTWEETS (Integer), 
     STATE (String)
     
     - Use suggested technique `Binary Classification`
     - Use default Validation split (Train: 60, Test: 20, Holdout:20)
     - Click `Add Estimators` to add following estimators (machine learning algorithms)
        - Logistic Regression
        - Decision Tree Classifier
        - Random Forest Classifier
5) In the `Evaluate` stage, select the estimator that has the best performance and save the model
6) Review the model details


