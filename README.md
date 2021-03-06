##Getting and Cleaning Data

This repo explains how all of the scripts work and how they are connected for the Getting and Cleaning Data Coursera course.

###Course Project

* Unzip the data from source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into a folder on your local drive, example: C:\Users\xxx\Desktop\coursera.  

* After unzip, you will see a folder: UCI HAR Dataset.

* Put run_analysis.R into C:\Users\xxx\Desktop\coursera. Do not put run_analysis.R into the unzip folder(UCI HAR Dataset), run_analysis.R should be in the same directory as folder(UCI HAR Dataset).

* In RStudio: setwd("C:\\Users\\xxx\\Desktop\\coursera\\"), followed by: source("run_analysis.R").
 
  * run_analysis.R that does the following. 
    * Merges the training and the test sets to create one data set.
    * Extracts only the measurements on the mean and standard deviation for each measurement. 
    * Uses descriptive activity names to name the activities in the data set
    * Appropriately labels the data set with descriptive variable names. 
    * Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


* You will see two additional files: "data_set_with_averages_of_each_variable.txt" and "merged_tidy_data.txt" in C:\Users\xxx\Desktop\coursera.
