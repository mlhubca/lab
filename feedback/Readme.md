# Continuous learning and model evaluation

Because model deployment is not a one-time event, you can use IBM Data Science Experience to retrain a model with new data. To do this, you use the IBM Watson™ Machine Learning continuous learning system, which provides automated monitoring of model performance, retraining, and redeployment to ensure prediction quality.

![](https://github.com/mlhubca/learn/blob/master/images/evaluate.png)


## Prerequisites
Before you begin to set up continuous learning model evaluation, depending on the type of data and model, you must have the following resources:

- a model
- an IBM Watson Machine Learning instance
- an Apache Spark service
- a Db2 Warehouse on Cloud instance to store the feedback data for batch predictions


**Procedure**

## 1. Load datasets to IBM Data Science Experiece (DSX)

1) Download the following two datasets to your local machine. (Right click and select `Save Link as...`)
    - [drug_train_data_2.csv](https://raw.githubusercontent.com/mlhubca/learn/master/data/drug_train_data_2.csv)
    - [drug_feedback_data_2.csv](https://raw.githubusercontent.com/mlhubca/learn/master/data/drug_feedback_data_2.csv)

2) Sign in to DSX, and create a new project.
3) Load dataset `drug_train_data_2.csv` to the project.

## 2. Set up feedback data store

To retrain data, you must create a feedback data store. To send new records to the feedback store you must define a data connection by using Db2® Warehouse on Cloud, which is currently supported as a feedback data store for batch predictions. If the feedback table does not exist, the service creates it. If the table exists, the schema is verified to match that of the training table.

1) Create a Db2 Warehouse on Cloud instance if you don't have one already
    - On DSX, go to top menubar `Data Services > Services`, 
    - Create a new `DB2 Warehouse` instance
    
2) Load dataset `drug_feedback_data_2.csv` to the DB2 Warehourse instance
    - From `Actions` options, select `Manage in IBM Cloud` 
    - Click Open the console to get started with Db2 Warehouse on Cloud.
    - Click Load Data and select the Desktop load type.
    - Drag file `drug_feedback_data_2.csv` to the load area and click Next.
    - Select Schema to import data and click New Table.
    - Type `drug_feedback_data` for the new table and click Next.
    - Use a semicolon (;) as the field separator.
    - Click Next to create a table with the uploaded data.

## 3. Create and deploy a model using model builder

1) On DSX, open your project.
2) To create a model, from the project overview page, click Add to project, and then click Model.
3) Name the model.
4) If you have more than one configured, you have the option to choose a machine learning service and a spark service. If you have not already configured a machine learning instance, you are prompted to assign one to this project or create one.
5) To prepare your data and create a model automatically, click Automatic and then click Create.
6) On the Select data asset step, select data asset `drug_train_data_2.csv` and click Next. If you don't see the data asset you wanted, you can add it from this window by clicking Add Data Assets.
7) After the data is loaded, select `DRUG` as the label and the rest of the colums are features, click Next.
8) After the model is done training, click Save, and then, click Save again.
9) From the model information page, click Add Deployment. Deploying the model makes it available to a wider audience. Note: You can have only one deployment per model. 


## 4. Set up continuous learning model evaluation

You can create a performance monitoring system for your predictive models. Create an evaluation instance and then define metrics and triggers for the automatic retraining and deploying of the new model.

**Optional**: While you can use the following steps, and the user interface that they explain, to upload feedback data and kick off evaluation, you can also call the available continuous learning REST API end-points directly to provide feedback data and kick off evaluation activities. For more information about the REST APIs, see REST API for Spark and Python models and REST API for SPSS models. You can integrate feedback APIs directly within your application, rather than performing model evaluation through the use of the following steps.

1) Open the project and select the model created by previous step
2) From the Evaluation tab, in the Performance Monitoring section, click Edit configuration.
3) Select a Spark service.
4) Select a prediction type `multiclass`. If the type is known, it is automatically selected, otherwise in the Prediction type box select the type.
5) In the Metric details section, select `accuracy`, input `0.8` as the threshold
6) Feedback data connection, click Select source.
7) On the Select feedback data source page, choose values for the Connection, Schema, and Table `drug_feedback_data`.
8) On New table name (optional) field, input `DRUG_FEEDBACK_DATA_NEW`
8) In the Record count required for re-evaluation box, type `20`
9) In the Auto retrain box, select one of the following options:
10) In Auto retrain, select `when model performance is below threshold`.
11) In the Auto deploy box, select `when model performance is better than previous version`.
12) Your performance monitoring configurations will look like:

![](https://github.com/mlhubca/learn/blob/master/images/feedback.png)

12) Click Save.
13) Click Add feedback data, select data file `drug_feedback_data_2.csv`, and click Open.
14) Click Begin evaluation.
15) After automatic evaluation and retraining begins, a chart appears with the updated model performance metrics. You can use the chart controls to switch metrics or to view the results as a chart or as a table.

![](https://github.com/mlhubca/learn/blob/master/images/evaluate.png)

16) You also will see a new model being deployed:

![](https://github.com/mlhubca/learn/blob/master/images/redeploy.png)


