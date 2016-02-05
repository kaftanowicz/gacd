# Michal Kaftanowicz
# February 2016
# An assignment for the Coursera's "Getting and Cleaning Data" course

library(downloader)
library(dplyr)

file_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download(file_url, dest="dataset.zip", mode="wb") 
unzip ("dataset.zip", exdir = ".")

train <- read.table('UCI HAR Dataset/train/X_train.txt')
train_labels <- read.table('UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')

test <- read.table('UCI HAR Dataset/test/X_test.txt')
test_labels <- read.table('UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')

features <- read.table('UCI HAR Dataset/features.txt')
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt')

make_var_readable <- function(cv){
  cv <- gsub("^t", 'time', cv)
  cv <- gsub("^f", 'frequency', cv)
  cv <- gsub("Acc", 'acceleration', cv)
  cv <- gsub("\\(", '', cv)
  cv <- gsub("\\)", '', cv)
  cv <- gsub("-", '_', cv)
  cv <- gsub(",", '.', cv)
  cv <- tolower(cv)
  cv <- make.names(cv, unique=TRUE)
  return(cv)
}

colnames(train_labels) <- 'activitynumber'
colnames(test_labels) <- 'activitynumber'
colnames(activity_labels) <- c('activitynumber', 'activitylabel')
activity_labels$activitylabel <- tolower(activity_labels$activitylabel)

features <- as.character(features$V2)
features_readable <- make_var_readable(features)

# Appropriately labels the data set with descriptive variable names.

colnames(train) <- features_readable
colnames(test) <- features_readable

###

train$subjectnumber <- subject_train$V1
test$subjectnumber <- subject_test$V1

train$activitynumber <- train_labels$activitynumber
test$activitynumber <- test_labels$activitynumber

# Merges the training and the test sets to create one data set.
dataset <- rbind(train, test)
names(dataset)

# Uses descriptive activity names to name the activities in the data set
dataset <- left_join(dataset, activity_labels, by = 'activitynumber')

# Extracts only the measurements on the mean and standard deviation
# for each measurement.

dataset_ext <- select(dataset, matches('mean|std|activitylabel|subject'))

# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

dataset_ext <- tbl_df(dataset_ext)

avgset <- dataset_ext %>% group_by(subjectnumber, activitylabel) %>% 
  summarise_each(funs(mean))

write.table(avgset, file = 'tidydataset.txt', row.name=FALSE)

# Check

# check_df <- read.table('tidydataset.csv')
# head(check_df)
# names(check_df)