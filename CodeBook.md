##Code Book

Data source is from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description is available at the site where the data was obtained:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The R script called run_analysis.R performs the following:

* Merges the training and test data sets into one data set. 
...  Merging UCI HAR Dataset/train/X_train.txt with UCI HAR Dataset/test/X_test.txt result in 10299 obs. of 561 variables. 
...  Merging UCI HAR Dataset/train/subject_train.txt with UCI HAR Dataset/test/subject_test.txt result in 10299 obs. of 1 variables.
...  Merging UCI HAR Dataset/train/y_train.txt with UCI HAR Dataset/test/y_test.txt result in 10299 obs of 1 variables.

* Read UCI HAR Dataset/features.txt and extracts only the measurements on the mean and standard deviation for each measurement result in 10299 obs. in 66 variables.

* Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set.

* The script appropriately labels the data set with descriptive variable names and create a tidy data set name: merged_tidy_data.txt. The data set have 10299 obs. of 68 variables. 

* Last but not least, the script creates a second, independent tidy data set with the average of each variable for each activity and each subject name: data_set_with_averages_of_each_variable.txt. This data set have 180 obs. of 68 variables.
