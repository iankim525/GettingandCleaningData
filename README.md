## README for Peer-graded Assignment for Getting and Cleaning Data class

### Explanation of run_analysis.R script methods
* Goal: As stated in the assignment instruction, the script is to read datasets provided in "UCI HAR Dataset" folder (contained in a zip file), merge two groups of data and created a new data set which contains mean values of each measurement, as grouped in subjects and activities.

The script has 5 steps of data processing
* STEP 1 - first downloads the data set zip file and unpack in the working directory. Then it reads each txt file to construct two data frames: "data_test" and "data_train". Lastly, it combines those two to create "merge_data" that contains all the measurement values of both test and train groups of subjects.

* STEP 2 - the script reads "features.txt" to find feature names (i.e. tBodyAcc-mean()-X), and using 'grepl' function it filters "merge_data" to create "extract_data", which only contains mean and standard deviation values of the features. After this step previous data sets are removed from the memory for efficient processing.

* STEP 3 - it reads "activity_labels.txt" to find activity names (i.e. WALKING). Those names replace the activity label codes on "extract_data"

* STEP 4 - extract_data column names are replaced with "subject", "activity", and feature names as identified earlier on STEP 2

* STEP 5 - using 'aggregate' function, calculate means on the measurements section of "extract_data", by each subject and each activity. This aggregated data is saved as "tidy_data". Column names are added on the first two. Lastly, a new txt file is written from "tidy_data" on the working directory, as "tidy_data.txt"


### Files
For this assignment four items (files) have been uploaded onto this repository.

* README.md - this markdown document file.

* run_analysis.R - this R script reads the data files provided by the course and writes a new text file, "tidy_data.txt" which contains average of each measurement variable 
for each activity and each subject.

* tidy_data.txt - result data set created by run_analysis.R script. 

* CodeBook.md - a markdown document that explains data sets, variables, and methods used to output "tidy_data.txt" file.


