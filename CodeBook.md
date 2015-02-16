#CodeBook
This is a CodeBook for run_analysis.R that transforms the UCI HAR datasets into a single dataset with more readable labels and a second dataset of tidy data.

##Data Source and Information
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made available here:
[UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The dataset is generated from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Various sensor signals from the accelerometer and gyroscope on the smartphone were gather and pre-processed. The obtained dataset is then randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

##Attribute Information
The information from the above experiments were divided into the following files:
- Activity Description - activity_labels.txt
- Dataset Column Names - features.txt
- Dataset Column Description - features_info.txt
- Subject performing the activities - subject_test.txt,subject_train.txt
- Detailed readings from the smartphone - x_test.txt,x_train.txt
- Type of Activity performed - y_test.txt,y_train.txt

##Data Transformation
Through this project, the files listed in Attribute Information are transformed by the following steps.

### Merge training and the test datasets
Files containing the test and training subject id (subject_test.txt,subject_train.txt), readings from smartphone (x_test.txt,x_train.txt) and activity type (y_test.txt,y_train.txt) are merged. Variables are assigned with the dataset column names (features.txt) for ease of reference.

### Contain only mean and standard deviation variables
Columns containing mean (mean) and standard deviation (std) were extracted.

### Displaying descriptive activity names
The activity type column that is now part of the merged dataset is transformed from numeric to string variables by replacing the numeric activity type with its corresponding string activity description (activity_labels.txt).

### Appropriate labels with descriptive variable names
The column names provided by features.txt were not as intuitive. Hence, some of the string patterns in the column names were either removed or replaced by a more readable string. This results in labels that are more readable.

Before Transform | After Transform
--- | ---
 () | 
 Strings starting with "t" | time 
 Strings starting with "f" | freq 
 BodyBody | Body 
 Mag | Magnitude 
 "-std" | "-StdDev" 
 "-mean" | "-Mean" 

### Create an independent tidy dataset
From the properly formatted and merged training and test dataset, a separate tidy dataset is created that contains average of each variable for each activity and each subject.

The tidy dataset is groups by activity followed by subject and contains the average of each mean and standard deviation variable in the merged dataset.
