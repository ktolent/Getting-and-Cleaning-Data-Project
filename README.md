# Getting and Cleaning Data Project
This is the final project required to complete the Getting and Cleaning Data course on Coursera. The purpose of this project is to demonstrate the student's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The student is expected to use the UCI HAR Dataset and produce an independent, tidy dataset by merging certain datasets, using descriptive variable names, subsetting the required variables, and manipulating these variables. 
## Getting Started
These instructions will provide a step-by-step guide so that you could either reproduce the project on your local machine or get a clear understanding of the code that I used to clean up the data and produce a tidy dataset.
### Prerequisite
You will need R or R Studio to run the code. Instructions to download and install R and R Studio are discussed in Week 2 of the The Data Scientist's Toolbox course. You may also consult this page.
[link](https://www.r-project.org/)
## The Analysis
The following section describes the dataset from which my project is based on, as well as the code used to generate the tidy dataset.
### Dataset
For this project, I used the Human Activity Recognition Using Smartphones Dataset which can be found here:
[link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
This dataset was put together following experiments performed by researchers at Smartlab - Non Linear Complex Systems Laboratory.  
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. These volunteers were divided into 2 groups:
* 70% were selected to generate the *training dataset*.
* 30% were selected to generate the *test dataset*.
Each person performed six activities which include:
* walking,
* walking_upstairs,
* walking_downstairs,
* sitting,
* standing, and
* laying.
Each activity was performed by the volunteers while wearing a smartphone (Samsung Galaxy S2) on the waist. Using the smartphone's embedded accelerometer and gyroscope, they were able to capture a total of 561 different vital measurements.  
### Code
My analysis rests within the run_analysis.R file. All scripts are contained within this file.  
The goal is to merge the training data and the test data into one dataset, provide a descriptive label to the 6 activities performed by each subject, select variables that describe the mean and standard deviation of each measurement
The code is divided into 5 parts.
Part 1 merges the training 
