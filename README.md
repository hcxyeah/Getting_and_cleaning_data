# Getting_and_cleaning_data
This is the assignment project for the Getting and cleaning data course from John Hopkins U.

## Overview
One of the most exciting areas in all of data science right now is wearable computing. 
The data linked to from the course website represent data collected from the accelerometers 
from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Project Summary
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps
1. Load the data: train_x, train_y, test_x, text_y, features, subject, activity list.
2. Rename the column names of train_x and test_x to the features list.
3. Row bind the train_x and trann_y, test_x and test_y.
4. Column bind train and test data into dt.
5. Merge dt and activity list on activity id into data table final.
6. Extract Mean and std measurement columns from table final into table meanstd.
7. Labels the data set with descriptive variable names.
8. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
