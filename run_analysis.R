library(dplyr)
## Getting the data set
dataset_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataset_zip <- "getdata_projectfiles_UCI HAR Dataset.zip"
download.file(dataset_URL,dataset_zip)
unzip(dataset_zip)

## Reading the files into R and adding their appropriate labels
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("activityId", "activityLabel")

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

colnames(X_train) <- features[,2] 
colnames(Y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

colnames(X_test) <- features[,2] 
colnames(Y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

## Merging the data sets into one
train <- cbind(Y_train, subject_train, X_train)
test <- cbind(Y_test, subject_test, X_test)
all <- rbind(train, test)

## Extracting the mean and standard deviation for each measurement
mean_std <- grepl("activityId|subjectId|mean|std", colnames(all))
all <- all[, mean_std]

## Naming activities in the data set
all$activityId <- factor(all$activityId, levels = activity_labels[, 1], labels = activity_labels[, 2])

## Labeling the data set with descriptive variable names
all_colnames <- colnames(all)
all_colnames <- gsub("[\\(\\)-]", "", all_colnames)
all_colnames <- gsub("^f", "freq", all_colnames)
all_colnames <- gsub("^t", "time", all_colnames)
colnames(all) <- all_colnames

write.table(all, "tidy_data.txt", row.names = FALSE)

## Creating a new data set with the average of each variable for each activity and each subject
all_averages <- aggregate(. ~subjectId + activityId, all, mean)
write.table(all_averages, "second_tidy_data.txt", row.names = FALSE)



