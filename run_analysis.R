# Data source of this script: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# A full description is available at the site where the data was obtained:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# 1. Merges the training and the test sets to create one data set.

temp1 <- read.table("UCI HAR Dataset/train/X_train.txt")
temp2 <- read.table("UCI HAR Dataset/test/X_test.txt")
X <- rbind(temp1, temp2)

temp1 <- read.table("UCI HAR Dataset/train/subject_train.txt")
temp2 <- read.table("UCI HAR Dataset/test/subject_test.txt")
S <- rbind(temp1, temp2)

tmp1 <- read.table("UCI HAR Dataset/train/y_train.txt")
tmp2 <- read.table("UCI HAR Dataset/test/y_test.txt")
Y <- rbind(tmp1, tmp2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("UCI HAR Dataset/features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, indices_of_good_features]
names(X) <- features[indices_of_good_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# 3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names.  

names(S) <- "subject"

# Create a tidy data set name: merged_tidy_data.txt
tidy <- cbind(S, Y, X)
write.table(tidy, "merged_tidy_data.txt")

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(tidy)[2]
result = tidy[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
    for (a in 1:numActivities) {
        result[row, 1] = uniqueSubjects[s]
        result[row, 2] = activities[a, 2]
        tmp <- tidy[tidy$subject==s & tidy$activity==activities[a, 2], ]
        result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
        row = row+1
    }
}
write.table(result, "data_set_with_averages_of_each_variable.txt")