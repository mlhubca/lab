### Prerequisites and steps

1. Sign up to IBM Data Science Experience (DSX): https://datascience.ibm.com/
2. Sign in to DSX
3. On DSX, create a new project
  - Click `Projects`, and select `View All Projects`
  - Click the `New` button to creata a new project
  - On the `New Project` page, input `Customer Churn` as the project name
  - In the `Target container` field, input `churn` as the container name
  - Click the `Create` button
4. Download dataset `churn-all.csv` from Github
  - Use a new brower tab to access dataset: https://github.com/mlhubca/lab/blob/master/churn/churn-all.csv
  - Right-click the `Raw` button on the toolbar, and select `Save Link As...` or `Save Content As...` (depending on your browser)
5. Upload dataset `churn-all.csv` to your project
  - On DSX, open your project
  - Click the `Add to project` dropdown and select `Data asset` from the dropdown menu
  - On your right-hand panel, select the `Load` tab
  - Drop file `churn-all.csv` to the box or browse file `churn-all.csv` to add the file to the project
  
6. Import a new notebook from a URL to the project
  - On DSX, open your project
  - Click the `Add to project` dropdown and select `Notebook` from the dropdown menu
  - On the `New Notebook` page, select `From URL` tab
  - In the `Name` field, input `Churn Prediction` as the notebook name
  - In the `Notebook URL` field, input this URL: `https://raw.githubusercontent.com/mlhubca/lab/master/churn/churn-prediction-with-scikit-learn-TensorFlow.ipynb`
  - Click the `Create Notebook` button
  
