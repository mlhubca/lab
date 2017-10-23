# Lab Exercise - Natural Language Processing

This lab exercise uses IBM Watson Natural Language Understanding service to analyze semantic features of any text.

### Preparation

1) Create a NLU service instance in Bluemix [Getting started tutorial](https://console.bluemix.net/docs/services/natural-language-understanding/getting-started.html#getting-started-tutorial)
2) Obtain the NLU service credentials (username, password, version) from Bluemix services dashboard

### Step 1. Login to DSX (https://datascience.ibm.com/)
### Step 2. Select the Default Project or create a new project
### Step 3. Add a notebook to the project from URL

- Notebook name: Waston-NLU-Demo
- Notebook URL: https://raw.githubusercontent.com/mlhubca/lab/master/nlp/Waston-NLU-Demo.ipynb
- Default Spark instance

### Step 4. Replace the username/password in the following cell with yours in your credentials
```
import json
from watson_developer_cloud import NaturalLanguageUnderstandingV1
import watson_developer_cloud.natural_language_understanding.features.v1 as Features

natural_language_understanding = NaturalLanguageUnderstandingV1(
  username="************************",
  password="************",
  version="2017-02-27")
```
### Step 5. Run the notebook

- You can run the notebook document step-by-step (one cell a time) by pressing shift + enter.
- You can run the whole notebook in a single step by clicking on the menu Cell -> Run All.

--- 
