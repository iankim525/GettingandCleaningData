## Getting and Cleaning Data Peer-graded Assignment

## STEP 1
## download data zip file and unpack in the working directory
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, dest = "dataset.zip")
unzip("dataset.zip", exdir = "./")
## read test data sets
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
measure_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
activities_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
## merge test data by rows
data_test <- cbind(subject_test, activities_test, measure_test)

## read train data sets
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
measure_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
activities_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
## merge train data by rows
data_train <- cbind(subject_train, activities_train, measure_train)

## merge test and train data by columns
merge_data <- rbind(data_test, data_train)


## STEP 2
## extract mean and standard devitation columns of measurements and make a subset data frame
feature_names <- read.table("./UCI HAR Dataset/features.txt")[,2]
## create a logical vector of TRUE/FALSE containing "mean" or "std"
extractLogical <- grepl("mean|std", feature_names)
## using the logical vector, create a subset of data showing only mean and std.
extract_data <- merge_data[, extractLogical]

## clear previous data sets from the memory
rm(subject_test); rm(measure_test); rm(activities_test); rm(data_test);
rm(subject_train); rm(measure_train); rm(activities_train); rm(data_train);


## STEP 3
## assign descriptive activity names
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
extract_data[,2] <- as.factor(extract_data[,2])
levels(extract_data[,2]) <- activity_labels


## STEP 4
## assign descriptive variable names as listed in features.txt
## the first two columns of extract_data is subject and activity label
names(extract_data)[3:ncol(extract_data)] <- as.character(feature_names[extractLogical])
names(extract_data)[1:2] <- c("subject", "activity")

## STEP 5
## create a separate tidy data set containing the average of each variable 
## for each activity and each subject.
## calculate mean by each factor level using aggregate function
measure_data <- extract_data[, -c(1,2)]
tidy_data <- aggregate(measure_data, list(extract_data$subject, extract_data$activity), mean)
## assign missing column names
names(tidy_data)[1:2] <- c("subject", "activity")

## write a .txt file with the tidy data set.
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)
