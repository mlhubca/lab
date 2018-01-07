# Predicting Banking Customer Churn by Unlocking Big Data
 
Global Consumer Banking survey from Ernst & Young reported that in 2012, 50% of customers, globally, either changed their banks or were planning to change. In US and Canada, customers who changed their banks increased from 38% in 2011 to 45% in 2012.
 
Customer churn and engagement has become one of the top issues for most banks. It costs significantly more to acquire new customers than retain existing ones, and it costs far more to reacquire deflected customers. In fact, several studies have proven that churn remains one of the biggest destructors of enterprise values.
 
In order to identify early signs of potential churn and take actions to avoid losing customers, organizations start getting a holistic view of the customers including their interactions across multiple channels such as bank visits, calls to customer service departments, web-based transactions, mobile banking and social media interactions. 
 
By leveraging the holistic customer information, organizations can build a viable churn prediction model. The churn prediction model with high predictive score will arm organizations with the insights to identify customers with high-risk churn so they can take specific proactive actions to prevent churn.
 
In a nutshell, the use of Big Data and sophisticated machine learning models give banks a distinct competitive advantage to predict and prevent churn, drive cross-sell and build customer loyalty.
 
In this workshop, you will learn how to use IBM's industry leading Data Science Experience to create churn prediction models using notebooks and visual Model Builder, and deploy the models to a live system, and monitor and evaluate the model performance over time. 

### Prerequisites

1. Sign up to IBM Data Science Experience (DSX): https://datascience.ibm.com/
2. Sign in to DSX
3. On DSX, create a new project
  - Click `Projects`, and select `View All Projects`
  - Click the `New` button to creata a new project
  - On the `New Project` page, input `Customer Churn` as the project name
  - In the `Target container` field, input `churn` as the container name
  - Click the `Create` button
4. Download dataset `bank-churn.csv` from Github
  - Use a new brower tab to access dataset: https://github.com/mlhubca/lab/blob/master/churn/bank-churn.csv
  - Right-click the `Raw` button on the toolbar, and select `Save Link As...` or `Save Content As...` (depending on your browser)
5. Upload dataset `bank-churn.csv` to your project
  - On DSX, open your project
  - Click the `Add to project` dropdown and select `Data asset` from the dropdown menu
  - On your right-hand panel, select the `Load` tab
  - Drop file `churn-all.csv` to the box or browse file `bank-churn.csv` to add the file to the project
  
  
6. Import a new notebook from a URL to the project
  - On DSX, open your project
  - Click the `Add to project` dropdown and select `Notebook` from the dropdown menu
  - On the `New Notebook` page, select `From URL` tab
  - In the `Name` field, input `Churn Prediction` as the notebook name
  - In the `Notebook URL` field, input this URL: `https://raw.githubusercontent.com/mlhubca/lab/master/churn/bank-churn-prediction-with-scikit-learn-TensorFlow.ipynb`
  - Click the `Create Notebook` button
  
