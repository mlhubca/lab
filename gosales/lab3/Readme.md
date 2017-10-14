
# Exercise 3 - Create resolution using DSX and RStudio with associate rules

This lab we will explore how a data scientist utilizes DSX and RStudio to easily analyze data using Association rules algorithms and to visualize the outcomes. Association rules algorithms support market basket analysis.

[<img src="https://github.com/mlhubca/lab/blob/master/gosales/images/DSE2E2.png">](https://github.com/mlhubca/ml101/blob/master/lab2/)

 
## Overview

<img src="https://raw.githubusercontent.com/mlhubca/lab/master/gosales/lab2/images/Association-Rules-Lab-Flow.jpg">

### Outlines
1) Start RStudio
2) Load the data file into RStudio (transactions.csv into ~/data)
3) Load the R-code with the lab (RStudio-apriori-demo.R) and the installation R-code for the software packages (RStudio-4) apriori-demo-installation.R) needed for the lab
4) Run the R-code with the installation sequence
5) Run the R-code with the lab


## Lab environment setup 

Note that the Lab-DSX-ML.zip archive downloaded from Exercise 3 includes the files used in this exercise
- data/transactions.csv
- labs/RStudio-apriori-demo-installation.R (R code for installing software packages)
- labs/RStudio-apriori-demo.R (R code for the machine learning lab using association rules)


## Step 1. Association Rules Lab Installation

1. On the DSX home page, navigate to Tools > RStudio


## Step 2. Importing Source Code and Data for Machine Learning Lab in RStudio

1.  In “Files” tab use “New folder” to create 2 folders in the user’s home directory - data and demo (please do not mix it with the “File” menu item in the main menu and locate “Files” in the frame depicted here):
> ![](https://github.com/mlhubca/lab/blob/master/gosales/lab2/images/RStudio-Files-tab.jpg)

2.  Using “Upload” button upload transactions.csv into the data folder and RStudio-apriori-demo-installation.R, RStudio-apriori-demo.R into the demo folder


## Step 3. Installing Software Libraries and Packages

1.  Double-click on the name of the file RStudio-apriori-demo-installation.R: RStudio will open the source code:
 > ![](https://github.com/mlhubca/lab/blob/master/gosales/lab2/images/RStudio-Source-code.jpg)

2.  Rename ~/.Rprofile to ~/old.Rprofile: check the file .Rprofile and click "Rename", change the name to old.Rprofile
 > ![](https://github.com/mlhubca/lab/blob/master/gosales/lab2/images/Renaming-rprofile.png)

3.  Quit the current session and start the new one:

    a. Select Session>Quit Session:
    
 > ![](https://github.com/mlhubca/lab/blob/master/gosales/lab2/images/Session-menu.png)
 
    b. Select "Don't Save": 
    
 > ![](https://github.com/mlhubca/lab/blob/master/gosales/lab2/images/Quitting-R-session.png)

    c. After the old session has been finished, start a new session:
    
 > ![](https://github.com/mlhubca/lab/blob/master/gosales/lab2/images/Starting-a-new-R-session.png)
    
4.  Run the code in RStudio-apriori-demo-installation.R using the Run button ![](https://github.com/mlhubca/lab/blob/master/gosales/lab2/images/RStudio-running-source-code.png): please decline the options to update any packages while installing the new packages

5.  Check point: ensure that all packages install without errors

6.  Close the source code editor window for RStudio-apriori-demo-installation.R

 >NOTE: the software packages installation may take a few minutes, but it  
 >needs to be done only once per account
7.  Rename ~/old.Rprofile back to ~/.Rprofile (see the supporting images in the item 2 above)

8.   Quit the current session and start the new one (see the supporting images in the item 3 above)

## Step 4. Running Association Rules Lab 

1.  Click on the name of the file RStudio-apriori-demo.R: RStudio will open the source code

2.  Execute every code section in the order in which the sections appear by clicking on the button ![](https://github.com/mlhubca/lab/blob/master/gosales/lab2/images/RStudio-running-source-code.png) . The lab covers the following actions:

    a.  Declaring the libraries used in the lab

    b.  Loading the sales data into a data frame

    c.  Data wrangling with R: transforming data to the form required by arules package for Apriori algorithm

    d.  Applying Apriori algorithm

    e.  Reviewing the generated rules in the console window

    f.  Visualizing the rules with arulesViz package

3.  \[Optional step\] Quit RStudio

***End of Lab: Association Rules***
