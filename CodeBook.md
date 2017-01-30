# Code Book
## This Code Book describes major variables used in run_analysis.R script.

### Variables
* data_test: subject, activity, and measurement data from test group
* data_train: subject, activity, and measurement data from train group
* merge_data: combined data set from data_test and data_train (30 subjects, 6 activities, 561 measurements)
* feature_names: descriptive names of each measurement feature
* extract_data: shrunken data set from merge_data, only containing "mean" or "std" in the feature names
* activity_labels: descriptive names of activities (i.e. WALKING)
* measure_data: column 3 to 563 of extract_data, containing only measurement values
* tidy_data: a new data set with mean values calculated from measure_data, by each subject and each activity.



