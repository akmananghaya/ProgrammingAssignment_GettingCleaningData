# Codebook for the Data Sets
This code book gives information about the variables found in `tidy_data.txt` and `second_tidy_data.txt`.

## Datasets
The original data is the Human Activity Recognition Using Smartphones Data Set which was downloaded [HERE](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). A full description can be found [HERE](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The `run_analysis.R` was used to generate two tidy data sets: `tidy_data.txt` which contains 10299 observations and 81 variables and `second_tidy_data.txt` which contains 180 observations and 81 variables.

## Variables
* `subjectID`
 The ID given to each person (1-30).
* `activityID`
The ID given to six activities, namely, WALKING(1), WALKING_UPSTAIRS(2), WALKING_DOWNSTAIRS(3),
SITTING(4),
STANDING(5), and
LAYING(6).
* 79 measurement variables

## Transformations
* For `tidy_data.txt`, the mean and standard deviation for each measurement from the original data with 561 variables were obtained
to come up with the resulting 79 measurement variables.
* For `second_tidy_data.txt`, the average of each variable for each activity and each subject from `tidy_data.txt` were obtained to come up with 180 observations from the original 10299 observations.
