# Coursera course - Data science specialization
## Peer Assessments /Getting and Cleaning Data Course Project


## The purpose of this project is to demonstrate the ability to collect, work 
## with, and clean a data set. The goal is to prepare tidy data that can be used
## for later analysis

## Step1. Merges the training and the test sets to create one data set.
setwd("D:/COURSES/Coursera/03_Getting and Cleaning Data/Assigment/UCI HAR Dataset")

### Data sets
        Data_train <- read.table("./train/X_train.txt")
        Data_test <- read.table("./test/X_test.txt")
### Labels
        Label_train <- read.table("./train/y_train.txt")
        Label_test <- read.table("./test/y_test.txt") 
### Subjects
        Subject_train <- read.table("./train/subject_train.txt")
        Subject_test <- read.table("./test/subject_test.txt")
### Combine data-sets
        Data <- rbind(Data_train, Data_test)
        Label <- rbind(Label_train, Label_test)
        Subject <- rbind(Subject_train, Subject_test)

## Step2. Extracts only the measurements on the mean and standard ## deviation 
## for each measurement. 

### Reading the data with the features extracted from the data
        features <- read.table("./features.txt")
### Index for the mean and std
        Ind_mean.std <- grep("mean\\(\\)|std\\(\\)", features[, 2])
### Adding these features to the tidy data
        Data <- Data[, Ind_mean.std]
### Text formating
        names(Data) <- gsub("\\(\\)", "", features[Ind_mean.std, 2])
        names(Data) <- gsub("-", "", names(Data)) 
        names(Data) <- gsub("mean", "Mean", names(Data))
        names(Data) <- gsub("std", "Std", names(Data))

## Step3. Uses descriptive activity names to name the activities in the data set

### Reading activity labels
        activity <- read.table("./activity_labels.txt")
### re-Formating the original labels
        activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
        substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
        substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
        Label_activity <- activity[Label[, 1], 2]
        Label[, 1] <- Label_activity
        names(Label) <- "activity"

## Step4. Appropriately labels the data set with descriptive activity names. 
        names(Subject) <- "subject"
        TidyData <- cbind(Subject, Label, Data)
### Write out the 1st dataset
        # write.table(TidyData, "TidyData.txt") 

## Step5. Creates a second, independent tidy data set with the average of each 
## variable for each activity and each subject. 

### Size of the original data
        LengthSubject <- length(table(Subject))
        DimActivity <- dim(activity)[1]
        DimColumn <- dim(TidyData)[2]
### Pre-alocating the matrix for new data-set, and row number ii
        TidyData2 <- matrix(NA, nrow=LengthSubject*DimActivity, ncol=DimColumn) 
        TidyData2 <- as.data.frame(TidyData2)
        colnames(TidyData2) <- colnames(TidyData)
        ii <- 1

for(i in 1:Length_subject) {
    for(j in 1:Dim_activity) {
        TidyData2[ii, 1] <- sort(unique(Subject)[, 1])[i]
        TidyData2[ii, 2] <- activity[j, 2]
        ind1 <- i == TidyData$subject
        ind2 <- activity[j, 2] == TidyData$activity
        TidyData2[ii, 3:DimColumn] <- colMeans(TidyData[ind1&ind2, 3:DimColumn])
        ii <- ii + 1
        }
}

### Saving new data-set with the average of each variable for each activity and 
### each subject.  
write.table(TidyData2, "TidyData2_means.txt",row.name=FALSE)