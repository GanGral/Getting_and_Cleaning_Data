# Getting and Cleaning Data with R

##Programming Assignemnt for Week 3 Coursera "Getting and Cleaning Data" Course

Here lies R script called run_analysis.R that does the following:

1.Merges the training and the test sets to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement. 

3.Uses descriptive activity names to name the activities in the data set

4.Appropriately labels the data set with descriptive variable names. 

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Steps to check this course project power

1.Download the data source and put into a folder on your local drive. You'll have a "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset" folder.

2.Put run_analysis.R in the parent folder of "getdata-projectfiles-UCI HAR Dataset", then set it as your working directory using setwd() function in RStudio.

3.Run source("run_analysis.R"), then it will generate a new file tiny_data.txt in your working directory.

###Requirements
"reshape2" package. 

run_analysis.R script will install it automatically, if not already installed.
