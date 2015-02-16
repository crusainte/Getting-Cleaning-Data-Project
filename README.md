# Getting and Cleaning Data Project

This repository is created for [Getting and Cleaning Data course on Coursera](https://www.coursera.org/course/getdata), Feb 2015.

## Project Description
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. This is performed on a set of data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
[Original UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data set used in this project was obtained from:
[UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

## About the Dataset
The dataset obtained has information in different files:
- Activity Description - activity_labels.txt
- Dataset Column Names - features.txt
- Dataset Column Description - features_info.txt
- Subject performing the activities - subject_test.txt,subject_train.txt
- Detailed readings from the smartphone - x_test.txt,x_train.txt
- Type of Activity performed - y_test.txt,y_train.txt

## About execution of run_analysis.R and obtaining the output tidy_data.txt file
1. run_analysis.R file should be placed in a directory together with the UCI HAR Dataset.
2. Rename UCI HAR Dataset directory to "Dataset"
3. Run run_analysis.R in R
4. tidy_data.txt will be output in the directory which run_analysis.R resides.

## About the CodeBook
CodeBook.md contains the detailed description of the transformation steps performed on the UCI HAR Dataset to satisfy the following project requirements:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
