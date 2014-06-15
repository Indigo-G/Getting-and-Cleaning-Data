## Time of data download
## > date()
##[1] "Wed Jun 11 21:09:10 2014"

## Script expects that in the working dir there is the data file as it appears
## when it is unzipped, in a "UCI HAR Dataset" folder

if(!file.exists("UCI HAR Dataset")) {warning("No dataset found!")}

## Reads the data

testSet <- read.table("./UCI HAR Dataset/test/X_test.txt", nrows = 2947, comment.char="", colClasses = c("numeric"))
testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt", nrows = 2947, comment.char="", colClasses = c("integer"))
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", nrows = 2947, comment.char="", colClasses = c("integer"))

trainSet <- read.table("./UCI HAR Dataset/train/X_train.txt", nrows = 7352, comment.char="", colClasses = c("numeric"))
trainLabels <- read.table("./UCI HAR Dataset/train/y_train.txt", nrows = 7352, comment.char="", colClasses = c("integer"))
trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", nrows = 7352, comment.char="", colClasses = c("integer"))

activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", colClasses = c("integer", "character"))

features <- read.table("./UCI HAR Dataset/features.txt", nrows = 561, colClasses = c("integer", "character"))

## Replaces activity labels with proper names

for(j in 1:nrow(activityLabels)){ 

testLabels[which(testLabels == j),] <- activityLabels[j,2]

trainLabels[which(trainLabels == j),] <- activityLabels[j,2]

}

## Adds the activity labels to the datasets

testFinal <- cbind(testSubjects, testLabels, testSet)

trainFinal <- cbind(trainSubjects, trainLabels, trainSet)

remove(testLabels, testSet, testSubjects, trainLabels, trainSet, trainSubjects, activityLabels)

## Merges the two datasets

wholeData <- rbind(trainFinal, testFinal)

remove(trainFinal, testFinal)

## Gives appropriate names to the variables

for (j in 1: nrow(features)) {
    
    colnames(wholeData)[[j+2]] <- features[j,2]

}

remove(features, j)

## Extracts only variables which contain means or standard deviations

meanStdData <- wholeData[, grepl("mean", names(wholeData)) | grepl("std", names(wholeData))]
meanStdData <- cbind(wholeData[,1], wholeData[,2],meanStdData)

## Performs some name-tidying

names(meanStdData) <- gsub("-", "_", names(meanStdData))
names(meanStdData) <- sub("f", "freq", names(meanStdData))
names(meanStdData) <- sub("t", "time", names(meanStdData))
names(meanStdData) <- gsub("\\(|\\)", "", names(meanStdData))

colnames(meanStdData)[[1]] <- "Participant_Code"
colnames(meanStdData)[[2]] <- "Activity"

remove(wholeData)

## Computes tidy data set containing only the average of each variable for each activity and subject

tidy <- aggregate(meanStdData[,3:ncol(meanStdData)], by = list(meanStdData[,"Participant_Code"], meanStdData$Activity), mean)

colnames(tidy)[[1]] <- "Participant_Code"
colnames(tidy)[[2]] <- "Activity"

## Writes .txt files containing the two datasets in the working directory
## "MeanStdData.txt" contains a tidy dataset with all variables concerning means and standard deviations (questions 1. through 4. of the assignment)
## "TidyData.txt" contans a tidy dataset the average of each variable for each activity and each subject (question 5. of the assignment) 
## Read with read.table("MeanStdData.txt", header = TRUE), read.table("TidyData.txt", header = TRUE)

write.table(tidy, file = "TidyData.txt", row.names = FALSE)
write.table(meanStdData, file = "MeanStdData.txt", row.names = FALSE)
