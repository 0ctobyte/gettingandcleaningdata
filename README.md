# Getting and Cleaning Data Final Project

There is a single R script called run_analysis.R. This script will perform the following operations:

1. Download the UCI data set to the current working directory
2. Unzip the UCI data set
3. Load the training and test data sets from the following files: subject_train, x_train.txt, y_train.txt, subject_test.txt, x_test.txt, y_test.txt
4. Merge all the data into one dataframe
5. Read the feature names from the file: features.txt. And then apply the feature names to the dataframe columns. It will also add the "subject" and "activity" names to the subject and activity columns in the data set.
6. Read the activity labels from the file: activity_labels.txt. Uses match to convert the labels in the data set with the descriptive names provided by the activity labels file.
7. Extract only the variables that measure the mean and standard deviation of each variable
8. Finally, it will get the average of each of the variables in the data set grouped by activity and then subject

The variable names and descriptions can be found in the features_info.txt file in the downloaded UCI data. Updates and additions are found in CodeBook.md in this repo.

The run_analysis.R script will produce a data frame called `data_mean_std` which contains the mean and standard deviation data.
It will also produce a data frame called `data_avg_per_activity_subject` which is the average of each of the variables in `data_mean_std` grouped by activity and subject.
