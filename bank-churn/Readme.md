# Predicting Banking Customer Churn by Unlocking Big Data
 
 ## Introduction
 
Customer churn and engagement has become one of the top issues for most banks. It costs significantly more to acquire new customers than retain existing ones, and it costs far more to reacquire deflected customers. In fact, several studies have proven that churn remains one of the biggest destructors of enterprise values.
 
In order to identify early signs of potential churn and take actions to avoid losing customers, organizations start getting a holistic view of the customers including their interactions across multiple channels such as bank visits, calls to customer service departments, web-based transactions, mobile banking and social media interactions. 
 
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

The data set has 6001 rows of data. CHURN is the label (target variable).

### Exercise Summary

- [Exercise 1: Creating a model using a notebook](https://github.com/mlhubca/lab/blob/master/bank-churn/Readme.md#exercise-1-creating-a-model-using-a-notebook)
- [Exercise 2: Creating a model using machine learning flow](https://github.com/mlhubca/lab/blob/master/bank-churn/Readme.md#exercise-2-creating-a-model-using-machine-learning-flow)
- [Exercise 3: Creating a model using model builder](https://github.com/mlhubca/lab/blob/master/bank-churn/Readme.md#exercise-3-creating-a-model-using-model-builder)

It's suggested that you go through these exercises in order.

### Prerequisites

1. Sign up to IBM Data Science Experience (DSX): https://datascience.ibm.com/
2. Sign in to DSX
3. On DSX, create a new project
  - Click `Projects`, and select `View All Projects`
  - Click the `New` button to creata a new project
  - On the `New Project` page, input `Bank Churn` as the project name
  - In the `Target container` field, input `churn` as the container name
  - Click the `Create` button
4. Download dataset `bank-churn.csv` from Github
  - Use a new brower tab to access dataset: https://github.com/mlhubca/lab/blob/master/churn/bank-churn.csv
  - Right-click the `Raw` button on the toolbar, and select `Save Link As...` or `Save Content As...` (depending on your browser)
5. Upload dataset `bank-churn.csv` to your project
  - On DSX, open your project
  - Click the `Add to project` dropdown and select `Data asset` from the dropdown menu
  - On your right-hand panel, select the `Load` tab
  - Drop file `bank-churn.csv` to the box or browse file `bank-churn.csv` to add the file to the project


## Exercise 1: Creating a model using a notebook
  
1. Import a new notebook from a URL to the project
  - On DSX, open your project
  - Click the `Add to project` dropdown and select `Notebook` from the dropdown menu
  - On the `New Notebook` page, select `From URL` tab
  - In the `Name` field, input `Churn Prediction` as the notebook name
  - In the `Notebook URL` field, input this URL: `https://raw.githubusercontent.com/mlhubca/lab/master/churn/bank-churn-prediction-with-scikit-learn-TensorFlow.ipynb`
  - Click the `Create Notebook` button
  
2. Execute the cell one by one by pressing Ctrl + Enter or selecting `Run -> Run Cells` from the notebook toolbar.

This notebook guides you throught the common machine learning workflow:

- Data acquisition
- Data exploration & visualization
- Data preparation
- Model training
- Model evaulation
- Model application

## Exercise 2: Creating a model using machine learning flow

![](https://github.com/mlhubca/lab/blob/master/tennis/images/PlayTennisFlow.png)

1) Add a new flow using "add flows" button or from the "Add to project" dropdown, select "Flow"
2) On the Create Flow page,
    - Specify a name, e.g. "Play Tennis Flow"
    - Select "IBM SPSS Modeler" Runtime
    - Click "Create Flow"
3) Drag and drop node "tennis.csv" from the Files list to the flow
4) Click the big plus "+" icon to show node palette
5) Select node "Type" from "Field Operations", drag and drop the node to the flow
6) Connect node "tennis.csc" to node "Type"
7) Righ click node "Type", select "Open",
    - Add all fields to the Types list
    - Select field Play, modify the Role as Target
8) Select node "Partition" from "Field Opartions", drag and drop the node to the flow
9) Connect node "Type" to node "Partition"
10) Righ click node "Partition", select "Open" 
    - Specify 85 for the Training partition size (%)
    - Specify 15 for the Testing partition size (%)
11) Select node "C5.0" from Modeling, drag and drop the node to the flow
12) Righ click node "C5.0", select "Open",
    - Select Play for the Target
    - Select the rest of the fields for Input
13) Righ click node "C5.0", select "Run"
14) Select node "Analysis" from "Outputs", drag and drop the node to the flow
15) Connect the generated node "Play" to node "Analysis"
16) Righ click node "Analysis", select "Run".
17) Open "Analysis of [Play]" to view the results
18) Back to "Play Tennis Flow", right click the generated node "Play", select View Model
19) View the model details
    - Model Information
    - Predictor Importance
    - Top Decision Rules
    - Tree Diagram

## Exercise 2: Creating a model using model builder

![](https://github.com/mlhubca/lab/blob/master/tennis/images/ModelBuilder.png)

1) Add a new model using "add models" button or from the "Add to project" dropdown, select "Model"
2) On the "New model" page
    - Specify the model name, e.g. Play Tennis
    - Select a Machine Learning Service. If you don't have a machine learning service, follow the instructions to provision a machine learning service
     - Select a Spark Service or use the default service
     - Use the default "Automatic" method
     - Click "Create" button
3) In the Select Data stage, select data asset "tennis.csv"
4) In the Train stage, 
     - Select "Play (String)" as the label col
     - Use default "All (default) as the feature columns
     - Use suggested "Binary Classification"
     - Use default validation split
5) In the Evaluate stage, save the model
6) Review the model details
7) On the Deploayments tab, add an Online deployment, specify a name as "Play Tennis Online"
8) View the details of the online deployment
9) On "Test API" tab, specify the input data, and predict the value of Play
     - Outlook: rain
     - Temperature: hot
     - Humidity: normal
     - Wind: strong

