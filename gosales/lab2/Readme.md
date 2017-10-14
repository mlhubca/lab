
# Exercise 2 - Create resolution using DSX and R notebook with descision trees
[<img src="https://github.com/mlhubca/lab/blob/master/gosales/media/DSE2E2.png">](https://github.com/mlhubca/lab/blob/master/gosales/lab2/)

This lab we will explore how a data scientist utilizes DSX and IBM Bluemix cloud services to easily analyze data using machine learning techniques and to visualize the outcomes using DSX, R, and Brunel. This lab uses descision tree classification. Decision tree-based classification is one of the domains that allowed scientists to have direct insights into the reasoning behind classification choices.
 
 The lab shows how to use these machine learning algorithms for
 uncovering the data insights in sales data.

## Overview

1.  **Source Data Repository**: **Object Storage Service**
> NOTE: This usually is the data hosted in a secure enterprise
> environment that could be securely retrieved through a network tunnel
> using the BlueMix Secure gateway. Since getting access to a data
> hosted in an enterprise infrastructure can be a compliance and privacy
> issue for this lab, we will be using sample datasets hosted in the IBM
> Object Storage that would be used as a source data set.

2.  **Exploring sales data using Decision Tree, DSX Notebooks, Brunel, R** (for this lab, the data from IBM sample DB “GOSALES” was used):

    
    <img src="https://raw.githubusercontent.com/mlhubca/lab/master/gosales/lab2/media/Decision-Tree-Lab-Flow.jpg">
    
3. **Outlines of the procedure**

- Provision an Object Storage service and load a file with sales data (transactions.csv) for the analysis
- Provision an Apache Spark service to run notebooks on
- Load the sample notebooks with the lab (machine-learning-with-DSX-lab.ipynb) and the installation of the software packages (ml-lab-installation.ipynb) needed for the lab;
- Run the code in the notebook with the installation sequence
- Run the code in the notebook with the lab

## Lab environment setup 

Download Lab-DSX-ML.zip archive from the github.com location below and extract the data file (transactions.csv) to your local machine:

    > <https://github.com/mlhubca/lab/tree/master/gosales/lab2/archive>
    
    Here is the content of the downloaded archive:
    
    -   data/transactions.csv
    -   labs/machine-learning-with-DSX-lab.ipynb : the notebook for the machine learning lab using decision trees;
    -   labs/ml-lab-installation.ipynb : the notebook for installing software packages for the machine learning lab (decision trees) 
             

> NOTE: If the same environment is sequentially used by different users,
> then the installation procedure needs to be done once per environment
> and the user only needs to go through executing the code with the lab
> without need to spend time on the installation procedures – there is
> no need to reinstall the labs for the same environment.


> NOTE: In the instructions the sequence “Menu &gt; Submenu &gt; Final
> Item” would represent the sequence of users’ actions where they choose
> first “Menu” from the menu bar, then the “Submenu” item in the opened
> submenu list, and finally “Final Item” in the yet another opened menu
> list.


## Step 1. Adding a data asset

1. Login to DSX <http://datascience.ibm.com/>

2. Open the Default Project

2. Click "add data assets", and add "tranactions.csv" to the assets of the project.
> Note: File "tranactions.csv" is located at "Lab-DSX-ML\data"

## Step 2. Importing notebooks

1.  Click "add notebooks"

2.  On the “Create Notebook” page, switch to “From File” tab, name the notebook “Mml-lab-installation”, and choose the notebook file on your disk from the archive: ml-lab-installation.ipynb; alternatively you can switch to “From  URL” tab and use the following “Notebook URL”:
> https://github.com/mlhubca/lab/blob/master/gosales/lab2/labs/ml-lab-installation.ipynb

 >NOTE: you can get to this page from the home page of DSX by clicking on "Start", please choose the default pre-filled values in the fields (Project: Default project, Spark Service: the service that you provisioned for this lab)

3. Click on Create Notebook

4. Save the current state by clicking on File &gt; Save Version from the menu

5. Return back to the project overview page (or DSX home page)

6. Load the second notebook “machine-learning-with-DSX-lab” (from the file machine-learning-with-DSX-lab.ipynb, or from URL https://github.com/mlhubca/lab/blob/master/gosales/lab2/labs/machine-learning-with-DSX-lab.ipynb ) by following the same steps 1-5 as above

## Step 3. Inserting code

1.  From the loaded notebook “machine-learning-with-DSX-lab” click on "Find and Add data" (1001 icon): ![]

2.  The expanded "Find and add Data" would show transactions.csv under “Files” section

3.  Identify the cell with the implementation of getObjectStorageFileWithCredentials and replace the code to use your Object Storage service:

    a.  Place your cursor to the cell with the default getObjectStorageFileWithCredentials implementation
    b.  Create an empty code cell just above the code cell with the default getObjectStorageFileWithCredentials by clicking on the following menu items: “Insert” &gt; “Insert Cell Above” and place your cursor into the new cell

    ![](https://github.com/mlhubca/lab/blob/master/gosales/lab2/media/Replacing-the-object-storage-service-inserting-cell.jpg)

    c.  Clicking on “Insert to code” on Transactions.csv will show the options to insert the code: choose “insert R DataFrame” 

    d.  Here is a similar code that will be inserted into your new cell: ![](https://github.com/mlhubca/lab/blob/master/gosales/lab2/media/Replacing-the-object-storage-service-the-code-inserted.jpg)

    e.  Replace the existing implementation of getObjectStorageFileWithCredentials (starts with “&lt;- function” and finishes with the end of block “}”) with the generated code in the new cell for getObjectStorageFileWithCredentials\_&lt;unique sequence&gt;; Here is the example of the highlighted code that needs to be replaced:
     ![](https://github.com/mlhubca/ml101/blob/master/lab2/media/Replacing-the-object-storage-service-highlighted-code.jpg)

     Take the new code (highlighted with the green rectangle) and place instead of the old code (highlighted with the red rectangle):

     ![](https://github.com/mlhubca/lab/blob/master/gosales/lab2/media/Replacing-the-object-storage-service-code-replacement.jpg)

    f.  Remove the cell with the newly generated code after replacing the default implementation of getObjectStorageFileWithCredentials

    g.  Check point: after the modifications, the section code should still define a data frame variable df which is used in the notebook; the modifications should be done only for replacing  getObjectStorageFileWithCredentials with the newly generated code for the new Object Storage service


## Step 6. Installing Software Libraries and Packages

1.  Open “ml-lab-installation” notebook in the Edit mode

2.  Execute every code section in the order in which the sections appear by clicking on the button ![](https://github.com/mlhubca/lab/blob/master/gosales/lab2/media/Execute-section.png) or by using the menu Cell&gt; Run Cells

3.  Ensure that there are no installation failures before proceeding to the lab

>NOTE: the software packages installation may take a few minutes, but it
>needs to be done only once per account

## Step 7. Running Decision Tree Lab 

1.  Open “machine-learning-with-DSX-lab” notebook in the Edit Mode

2.  Execute every code section in the order in which the sections appear by clicking on the button ![](https://github.com/mlhubca/lab/blob/master/gosales/lab2/media/Execute-section.png) or by using the menu Cell&gt; Run Cells. The lab covers the following actions:

    a.  Declaring the libraries used in the lab

    b.  Loading the data from the Object Storage into a data frame

    c.  Transforming the data for using with C5.0

    d.  Training the classification model (C5.0)

    e.  Transforming the classification model to visualize it in Brunel

    f.  Using a tree map for visualizing and exploring the decision tree in Brunel

    g.  Using a tree for exploring the decision tree in Brunel

    h.  Showing the native R visualization of the decision tree for comparison

3.  \[Optional step\] Clean-up the output of all sections to prepare the lab for the next user: click on Cell&gt;All Output&gt;Clear


## End of Decision Tree

## [Next](https://github.com/mlhubca/lab/blob/master/gosales/lab3)
