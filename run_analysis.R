#All the required files from the data set are unzipped and kept in folder
#"E:/Learning/Data Science/Course 3 - Getting and Cleaning Data/Final Assignment/UCI HAR Dataset"

#cleanup all the variables
rm(list=ls())

#1. Read all the data sets
folderPath = "E:/Learning/Data Science/Course 3 - Getting and Cleaning Data/Final Assignment/UCI HAR Dataset"

setwd(folderPath)

subjectTrain <- read.table("./train/subject_train.txt")
xTrain <- read.table("./train/X_train.txt")
yTrain <- read.table("./train/Y_train.txt")

subjectTest <- read.table("./test/subject_test.txt")
xTest <- read.table("./test/X_test.txt")
yTest <- read.table("./test/Y_test.txt")

features <- read.table("./features.txt")
activityLabels <- read.table("./activity_labels.txt")
colnames(activityLabels) <- c("activity", "activityName")

#2.a Merge training and test datasets

xData <- rbind(xTrain, xTest)
yData <- rbind(yTrain, yTest)
subjectData <- rbind(subjectTrain, subjectTest) 

#2.b Label columns appropriately
meanNstd <- grepl("(mean|std)\\(\\)", features[,2])
xData <- xData[,meanNstd]
names(xData) <- features[meanNstd, 2]

names(yData) <- "activity"
names(subjectData) <- "subject"

#2.c Merge x data, y data and subject
allData <- cbind(subjectData, yData, xData)

allData <- merge(allData, activityLabels, by="activity")

#Reorder the columns to bring activity and activity name together
allData <- allData[c(1,69,2:69)]

#3 Create second tidy dataset with mean of all the columns
tidyDataSet <- aggregate(allData[4:69], by=list(allData$subject,allData$activityName), mean)

write.table(tidyDataSet, "./TidyData.txt", row.name = FALSE)

