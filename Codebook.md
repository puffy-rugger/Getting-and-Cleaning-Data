##Codebook.md

### Assumptions

Code written for this project assumes that you have already downloaded and unzipped all the required files from [this] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)location.
run_analysis.R script needs to be initialized with the parent folder of unzipped project files.

### Project Summary

run_analysis.r script will process the files and create tidy data set. This script performs following steps

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

###Variables

'subjectData', 'xTrain', 'yTrain', 'subjectTest', 'xTest', 'yTest', 'features', 'activityLabels' contain the data read from the files
'xData', 'yData', 'subjectData' contain the data after it is merged
'allData' contain the data after merging training and testing datasets and contains only 'mean' and 'std' columns

