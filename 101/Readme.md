# Predict Titanic Survivors

*Machine Learning 101 Lab Exercises*

![alt text](http://upload.wikimedia.org/wikipedia/commons/6/6e/St%C3%B6wer_Titanic.jpg)

## Introduction

In these lab exercises, you will learn how to create machine learning models in a notebook, via model builder wizard, and using SPSS Modeler Flow. You will also learn how to use open source technologies to visualize data and automatically select the best algorithm. All the tools and technologies used in the exercises are readily available on IBM Data Science Experience (DSX).

IBM Data Science Experience (DSX) is a comprehensive Data Science development framework. You can find more details and sign up for 30 day trial at https://datascience.ibm.com/.

### Exercise Summary

- [Exercise 1: Creating a model using a notebook (for programmer)](https://github.com/mlhubca/lab/blob/master/101/Readme.md#exercise-1-creating-a-model-using-a-notebook)
- [Exercise 2: Creating a flow using SPSS Modeler (for non-programmer)](https://github.com/mlhubca/lab/blob/master/101/Readme.md#exercise-2-creating-a-flow-using-spss-modeler)
- [Exercise 3: Creating a model using model builder (automation)](https://github.com/mlhubca/lab/blob/master/101/Readme.md#exercise-3-creating-a-model-using-model-builder)


### Story

The sinking of the Titanic is one of the most infamous shipwrecks in history. On April 15, 1912, during her maiden voyage, the Titanic sank after colliding with an iceberg, killing 1502 out of 2224 passengers and crew. This sensational tragedy shocked the international community and led to better safety regulations for ships.

One of the reasons that the shipwreck led to such loss of life was that there were not enough lifeboats for the passengers and crew. Although there was some element of luck involved in surviving the sinking, some groups of people were more likely to survive than others, such as women, children, and the upper-class.

In this lab exercise, we will analyze what sorts of people were likely to survive. In particular, we will apply the tools of machine learning to predict which passengers survived the tragedy.


### Prerequisites

- Sign up and login to DSX: https://datascience.ibm.com/
- Create a new DSX project "Titanic"
- Download file `titanic.csv` to your local machine (Right click and select `Save Link as...`)
    - [titanic.csv](https://raw.githubusercontent.com/mlhubca/lab/master/101/titanic.csv)
- Upload file `titanic.csv` to the DSX project



## Exercise 1: Creating a model using a notebook


1) Add a new notebook in language Python 3.x with Spark 2.x
2) Add code to access file `titanic.csv` from the notebook
    - Open Find and Add Data pane from the Notebook Toolbar
    - Find `titanic.csv` file, select "Insert Pandas DataFrame" from "Insert to code" dropdown
    - The code will be inserted to the first cell of the notebook, as:
    
In [1]
```python
import sys
import types
import pandas as pd
from botocore.client import Config
import ibm_boto3

def __iter__(self): return 0

# @hidden_cell
# The following code accesses a file in your IBM Cloud Object Storage. It includes your credentials.
# You might want to remove those credentials before you share your notebook.
client_4d0a1baf7c2d4528be3a7696716f4836 = ibm_boto3.client(service_name='s3',
    ibm_api_key_id='-cNeD8bYaZl_hW1OofQRjanOhDUXZ-jViUTATOFWu0Yq*',
    ibm_auth_endpoint="https://iam.ng.bluemix.net/oidc/token",
    config=Config(signature_version='oauth'),
    endpoint_url='https://s3-api.us-geo.objectstorage.service.networklayer.com')

body = client_4d0a1baf7c2d4528be3a7696716f4836.get_object(Bucket='titanicc901411227974723b98e915e35dbb583',Key='titanic.csv')['Body']
# add missing __iter__ method, so pandas accepts body as file-like object
if not hasattr(body, "__iter__"): body.__iter__ = types.MethodType( __iter__, body )

df_data_1 = pd.read_csv(body)
df_data_1.head()
```
3) Execute the cell 

3) Execute the cell by pressing Ctrl + Enter or going to Notebook toolbar and selecting `Run -> Run Cells`.

4) Add the following cells and execute them in order. Almost each cell is accompanied by a short description in comment format. At any time during the exercise, feel free to ask a workshop host further clarification or questions. 

In [2]
```python
from pyspark.ml.feature import OneHotEncoder, StringIndexer, IndexToString
from pyspark.ml.linalg import Vectors
from pyspark.ml.feature import VectorAssembler
from pyspark.ml.classification import RandomForestClassifier
from pyspark.ml.evaluation import BinaryClassificationEvaluator
from pyspark.ml import Pipeline, Model
```
In [3]
```python
df_data_1.info()
```
In [4]
```python
df_data_1 = df_data_1.drop(['PassengerId', 'Name', 'Ticket', 'Cabin', 'Embarked'], axis=1)
```
In [5]
```python
from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()
spark_df = spark.createDataFrame(df_data_1)

# Randomly split the data into train and test datasets.
splitted_data = spark_df.randomSplit([0.85, 0.15], 48)
train_data = splitted_data[0]
test_data = splitted_data[1]
```
In [6]
```python
# Encode string predictors using StringIndexer
sex_indexer = StringIndexer(inputCol="Sex", outputCol="sex_code")

# Combine the list of input columns into a single vector column.
features_assembler = VectorAssembler(inputCols=["sex_code", "Pclass", "Age", "SibSp", "Parch", "Fare"], outputCol="features")

## Create a decision tree estimator/classifier. The constructor takes two input columns: the feature vector and the label to predict.
estimator = RandomForestClassifier(labelCol="Survived", featuresCol="features")
```
In [7]
```python
# Create a pipeline, a series of algorithms that transform a dataset.
pipeline = Pipeline(stages=[sex_indexer, features_assembler, estimator])
```
In [8]
```python
# Fit the pipeline to the training dataset.
model = pipeline_.fit(train_data)
```
In [9]
```python
# Make predictions on the testing dataset.
predictions = model.transform(test_data)
```

In [10]
```python
# Evaluate the performance of the decision tree classifier.
evaluator = BinaryClassificationEvaluator(labelCol="label", rawPredictionCol="rawPrediction", metricName="areaUnderROC")
accuracy = evaluator.evaluate(predictions)

print("Accuracy = %g" % accuracy)
```

In [11]
```python
# Create two unseen instances of passengers.
new_data = [{'Pclass':1, 'Sex':'female', 'Age':26, 'SibSp':0, 'Parch':0, 'Fare':20},
            {'Pclass':3,'Sex': 'male', 'Age':26, 'SibSp':0, 'Parch':0, 'Fare':20}]

new_df = spark.createDataFrame(new_data)
new_df.show()
```

In [12]
```python
# Make a new prediction on the unseen instance.
new_predictions = model.transform(new_df)
new_predictions.select("predictedLabel").show()
```
## Exercise 2: Creating a flow using SPSS Modeler

![](https://github.com/mlhubca/lab/blob/master/101/titanic-flow.png)

1) Add a new flow using "add flows" button or from the "Add to project" dropdown, select "Flow"
2) On the Create Flow page,
    - Specify a name, e.g. "Predict Survival"
    - Select "IBM SPSS Modeler" Runtime
    - Click "Create Flow"
3) Drag and drop node "titanic.csv" from the Files list to the flow
4) Click the big plus "+" icon to show node palette
5) Select node "Type" from "Field Operations", drag and drop the node to the flow
6) Connect node "titanic.csv" to node "Type"
7) Righ click node "Type", select "Open",
    - Add all fields to the Types list
    - Select field `Survived`, modify the Role as Target
8) Select node "Partition" from "Field Opartions", drag and drop the node to the flow
9) Connect node "Type" to node "Partition"
10) Righ click node "Partition", select "Open" 
    - Specify 85 for the Training partition size (%)
    - Specify 15 for the Testing partition size (%)
11) Select node "Random Trees" from Modeling, drag and drop the node to the flow
13) Righ click node "Random Trees", select "Run"
14) Select node "Analysis" from "Outputs", drag and drop the node to the flow
15) Connect the generated node "Servived" to node "Analysis"
16) Righ click node "Analysis", select "Run".
17) Open "Analysis of [Survived]" to view the results
18) Back to "Predict Survivial", right click the generated node "Survived", select View Model
19) View the model details
    - Model Information
    - Predictor Importance
    - Top Decision Rules
    - Tree Diagram


## Exercise 3: Creating a model using model builder

![](https://github.com/mlhubca/lab/blob/master/101/titanic-model.png)

1) Add a new model using "add models" button or from the "Add to project" dropdown, select "Model"
2) On the "New model" page
    - Specify the model name, e.g. Titanic Model
    - Select a Machine Learning Service. If you don't have a machine learning service, follow the instructions to provision a machine learning service
     - Select a Spark Service or use the default service
     - Use the default "Automatic" method
     - Click "Create" button
3) In the Select Data stage, select data asset `titanic.csv`
4) In the Train stage, 
     - Select "Survived (Integer)" as the label col
     - Use default "All (default) as the feature columns
     - Use suggested "Binary Classification"
     - Use default validation split
5) In the Evaluate stage, save the model
6) Review the model details
7) On the Deploayments tab, add an Online deployment, specify a name as "Titanic Online"
8) View the details of the online deployment
9) On "Test API" tab, specify the input data, and predict the value of `Survived`



