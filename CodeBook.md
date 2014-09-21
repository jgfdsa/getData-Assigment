Getting and Cleaning Data Course Project CodeBook
=======================================================================================
This file describes the variables, the data, and the transformations/ process followed to
clean up the data available for this project.
After unzip the data in the same working directory the script run_analysis.R script performs
the following stepsaccording to the project requirements:
1- Read X_train.txt, y_train.txt and subject_train.txt 
2- Read X_test.txt, y_test.txt and subject_test.txt
3- Concatenate Data_test to Data_train to generate the necessary data frame,data-set called "Data"
  3.1- Concatenate Label_test to Label_train, to create "Label" with the labels for "Data"
  3.2- Concatenate Subject to Subject_train to generate a "Subject".
4- Read the features.txt, and store the data in a variable called "features".
 It is only required to only extract the measurements on the mean and standard deviation.
 4.1- This results in a 66 indices list. 
5- Re-formating the original Labels
6- Read the activity_labels.txt, and store the data in a variable called "activity".
7- Clean and re-format the activity names in the second column of activity.
8- Transform the values of "Label" according to the activity data frame.
9- Combine the "Subject", "Label" and "Data" by column to get the "TidyData". 
  9.1- Properly name the first two columns, "subject" and "activity". 
10- Write the TidyData out to "TidyData.txt" file in current working directory.
Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject
Write the result out to "TidyData2_means.txt" file in current working directory.

© JG Ferreira 2014 All Rights reserved.
