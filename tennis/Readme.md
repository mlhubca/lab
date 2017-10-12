# Machine Learning Lab Exercises - Play Tennis

## Introduction

In these lab exercises, you will learn how to create machine learning models in a notebook, via model builder wizard, and using Flow. You will also learn how to use open source technologies to visualize data and automatically select the best algorithm. All the tools and technologies used in the exercises are readily available on IBM Data Science Experience (DSX).

IBM Data Science Experience (DSX) is a comprehensive Data Science development framework. You can find more details and sign up for 30 day trail at https://datascience.ibm.com/.

### Exercise Summary

- [Exercise 1: Creating a model using a notebook](https://github.com/mlhubca/lab/blob/master/tennis/Readme.md#exercise-1-creating-a-model-using-a-notebook)
- [Exercise 2: Creating a model using model builder](https://github.com/mlhubca/lab/blob/master/tennis/Readme.md#exercise-2-creating-a-model-using-model-builder)
- [Exercise 3: Creating a flow using Canvas](https://github.com/mlhubca/lab/blob/master/tennis/Readme.md#exercise-3-creating-a-flow-using-canvas)
- [Exercise 4: Adding visualizations to the notebook](https://github.com/mlhubca/lab/blob/master/tennis/Readme.md#exercise-4-adding-visualizations-to-the-notebook)
- [Exercise 5: Automating algnorthm selection using CADS (IBM Cognitive Assistant for Data Scientists)](https://github.com/mlhubca/lab/blob/master/tennis/Readme.md#exercise-5-automating-algnorthm-selection-using-cads-ibm-cognitive-assistant-for-data-scientists)

It's suggested that you go through these exercises in order.


### Story

You and a friend generally meet up in the morning at a local tennis court to play. However, whether you play or not depends on the weather (Outlook, Temperature, Humidity, Wind). So you'd like to write a program that, depending on the weather, can help you decide whether you should go to the courts or just call in and say that you probably won't play. This data set can be used for many supervised learning algorithms, which can help visualize the concepts. 


| Outlook|Temperature|Humidity|  Wind|Play|
|--------|-----------|--------|------|----|
|   sunny|        hot|    high|strong|  no|
|   sunny|        hot|    high|  weak|  no|
|overcast|        hot|    high|  weak| yes|
|    rain|       mild|    high|  weak| yes|
|    rain|       cool|  normal|  weak| yes|
|    rain|       cool|  normal|strong|  no|
|overcast|       cool|  normal|strong| yes|
|   sunny|       mild|    high|  weak|  no|
|   sunny|       cool|  normal|  weak| yes|
|    rain|       mild|  normal|  weak| yes|
|   sunny|       mild|  normal|strong| yes|
|overcast|       mild|    high|strong| yes|
|overcast|        hot|  normal|  weak| yes|
|    rain|       mild|    high|strong|  no|


### Basic concepts

- A dataset from which the model is to be built.
- Each column is an attribute.
- Each row is an example (instance)
- The attribute Play is the variable to be learned. 
- The possible labels of each example are yes and no.
- Goal: building a model to predict unseen instances, e.g.: {rain, hot, normal, strong}


### Prerequisites

- Sign up and login to DSX: https://datascience.ibm.com/
- Create a new project "Play Tennis"
- Download file "tennis.csc" to your local machine
    - Go to <https://github.com/mlhubca/lab/blob/master/tennis/tennis.csv>
    - In the top right, righ click the Raw button
    - Save as...
- Upload file "tennis.csv" to project "Play Tennis"



## Exercise 1: Creating a model using a notebook

1) Add a new notebook using language Python 2 with Spark 2.0
2) Add code to access file "tennis.csc" from the notebook
    - Open Find and Add Data pane from the Notebook Toolbar
    - Find tennis.csv file, select "Insert SparkSession DataFrame" from "Insert to code" dropdown
    - The code will be inserted to the first cell of the notebook, as:
    
In [1]
```
import ibmos2spark

# @hidden_cell
credentials = {
    'auth_url': 'https://identity.open.softlayer.com',
    'project_id': 'f2a24a66cdc341609d1981c7a9f59ff1',
    'region': 'dallas',
    'user_id': 'f42600a2d0434be5b2467f29dacb1c80',
    'username': 'member_717dbec4da36c47dbc67250b4877af401786b4d3',
    'password': '********'
}

configuration_name = 'os_5f070ff2bf8948378f720eb9b94c28e2_configs'
bmos = ibmos2spark.bluemix(sc, credentials, configuration_name)

from pyspark.sql import SparkSession
spark = SparkSession.builder.getOrCreate()
df_data_1 = spark.read\
  .format('org.apache.spark.sql.execution.datasources.csv.CSVFileFormat')\
  .option('header', 'true')\
  .load(bmos.url('Tennis', 'tennis.csv'))
df_data_1.take(5)
```
3) Execute the cell 

4) Add the following cells and execute them in order

In [2]
```
from pyspark.ml.feature import OneHotEncoder, StringIndexer, IndexToString
from pyspark.ml.linalg import Vectors
from pyspark.ml.feature import VectorAssembler
from pyspark.ml.classification import DecisionTreeClassifier
from pyspark.ml.evaluation import MulticlassClassificationEvaluator
from pyspark.ml.evaluation import BinaryClassificationEvaluator
from pyspark.ml import Pipeline, Model
```
In [3]
```
df_data_1.show()
```
In [4]
```
df_data_1.printSchema()
```
In [5]
```
splitted_data = df_data_1.randomSplit([0.85, 0.15], 48)
train_data = splitted_data[0]
test_data = splitted_data[1]
```
In [6]
```
stringIndexer_label = StringIndexer(inputCol="Play", outputCol="label").fit(df)
stringIndexer_outlook = StringIndexer(inputCol="Outlook", outputCol="outlook_code")
stringIndexer_temp = StringIndexer(inputCol="Temperature", outputCol="temperature_code")
stringIndexer_humi = StringIndexer(inputCol="Humidity", outputCol="humidity_code")
stringIndexer_wind = StringIndexer(inputCol="Wind", outputCol="wind_code")
```
In [7]
```
vectorAssembler_features = VectorAssembler(inputCols=["outlook_code", "temperature_code", "humidity_code", "wind_code"], outputCol="features")
dt = DecisionTreeClassifier(labelCol="label", featuresCol="features")
```
In [8]
```
labelConverter = IndexToString(inputCol="prediction", outputCol="predictedLabel", labels=stringIndexer_label.labels)
```
In [9]
```
pipeline_dt = Pipeline(stages=[stringIndexer_label, stringIndexer_outlook, stringIndexer_temp, stringIndexer_humi, stringIndexer_wind, vectorAssembler_features, dt, labelConverter])
```
In [10]
```
model_dt = pipeline_dt.fit(train_data)
```
In [11]
```
predictions = model_dt.transform(test_data)
evaluatorDT = BinaryClassificationEvaluator(labelCol="label", rawPredictionCol="rawPrediction", metricName="areaUnderROC")
accuracy = evaluatorDT.evaluate(predictions)

print("Accuracy = %g" % accuracy)
```
In [12]
```
new_data = [{'Outlook': 'rain', 'Temperature': 'hot', 'Humidity': 'normal', 'Wind': 'strong'}]

new_df = sqlContext.createDataFrame(new_data)
new_df.show()
```
In [13]
```
new_predictions = model_dt.transform(new_df)
new_predictions.select("predictedLabel").show()
```

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


## Exercise 3: Creating a flow using Canvas

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

## Exercise 4: Adding visualizations to the notebook

1) Open notebook "Play Tennis" (see Exercise 1) in edit mode

2) Add new cells after cell "In [4]", and add the following code to the cells, and execute them

In [5]
```
import pandas as pd
import matplotlib.pyplot as plt

%matplotlib inline

df2 = df_data_1.toPandas()
count_play = pd.value_counts(df2['Play'], sort = True)
count_play.plot(kind = 'bar', rot=0)
plt.title("Play distribution")
plt.xticks(range(2), ["Yes", "No"])
plt.xlabel("Play")
plt.ylabel("Count");
```
Out [5]:

![](https://github.com/mlhubca/lab/blob/master/tennis/images/play5.png)


In [6]
```
# Set up a grid of plots
fig = plt.figure(figsize=(10, 10)) 
fig_dims = (3, 2)

# Plot play counts
plt.subplot2grid(fig_dims, (0, 0))
df2['Play'].value_counts().plot(kind='bar', 
                                         title='Play Counts')

# Plot Outlook counts
plt.subplot2grid(fig_dims, (0, 1))
df2['Outlook'].value_counts().plot(kind='bar', 
                                       title='Outlook Counts')

# Plot Temperature counts
plt.subplot2grid(fig_dims, (1, 0))
df2['Temperature'].value_counts().plot(kind='bar', 
                                    title='Temperature Counts')
plt.xticks(rotation=0)

# Plot Embarked counts
plt.subplot2grid(fig_dims, (1, 1))
df2['Humidity'].value_counts().plot(kind='bar', 
                                         title='Humidity Counts')

# Plot Wind counts
plt.subplot2grid(fig_dims, (2, 0))
df2['Wind'].value_counts().plot(kind='bar', 
                                         title='Wind Counts')

plt.show()
```

Out [6]:

![](https://github.com/mlhubca/lab/blob/master/tennis/images/play6.png)


3) Add a new cell after cell "In [11]" (see Exercise 1), and add the following code to the cells, and execute it
```
from sklearn.metrics import roc_curve, auc
 
fpr = dict()
tpr = dict()
roc_auc = dict()
 
y_test = [i[1] for i in results_list]
y_score = [i[0] for i in results_list]
 
fpr, tpr, _ = roc_curve(y_test, y_score)
roc_auc = auc(fpr, tpr)
 
%matplotlib inline
plt.figure()
plt.plot(fpr, tpr, label='ROC curve (area = %0.2f)' % roc_auc)
plt.plot([0, 1], [0, 1], 'k--')
plt.xlim([0.0, 1.0])
plt.ylim([0.0, 1.05])
plt.xlabel('False Positive Rate')
plt.ylabel('True Positive Rate')
plt.title('Receiver operating characteristic example')
plt.legend(loc="lower right")
plt.show()
```
Out [12]:

![](https://github.com/mlhubca/lab/blob/master/tennis/images/play12.png)


## Exercise 5: Automating algnorthm selection using CADS (IBM Cognitive Assistant for Data Scientists)

1) Open notebook "Play Tennis" in edit mode

2) Locate the following cell
```
pipeline_dt = Pipeline(stages=[stringIndexer_label, stringIndexer_outlook, stringIndexer_temp, stringIndexer_humi, stringIndexer_wind, vectorAssembler_features, dt, labelConverter])
```
3) Replace the code in this cell with the following code:
```
from pyspark.ml.classification import LogisticRegression
from pyspark.ml.classification import NaiveBayes
from com.ibm.analytics.wml.cads import CADSEstimator
from com.ibm.analytics.wml.cads import Learner, Target

lr = LogisticRegression(labelCol="label", featuresCol="features", regParam=0.01)
nb = NaiveBayes(labelCol="label", featuresCol="features", smoothing=1.0)

learners = [Learner("LR", lr), Learner("NB", nb)]
cads = CADSEstimator().setLearners(learners)\
        .setEvaluator(MulticlassClassificationEvaluator(labelCol="label", predictionCol="prediction", metricName="accuracy"))\
        .setTarget(Target("prediction", "label"))\
        .setInitialSampleSize(2)\
        .setNumSampleFolds(2)\
        .setKeepBestNLearners(2)
               
pipeline_dt = Pipeline(stages=[stringIndexer_label, stringIndexer_outlook, stringIndexer_temp, stringIndexer_humi, stringIndexer_wind, vectorAssembler_features, cads, labelConverter])
```
4) Run all cells

