##loading neccessary library

if (!require("reshape2")) {
  install.packages("reshape2")
}

library("reshape2")

## Reading test  Data

testLabel<-read.table('getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset//test//y_test.txt')
testSubject<-read.table('getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset//test//subject_test.txt')
testSet<-read.table('getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset//test//X_test.txt')

## Reading train  Data
trainLabel<-read.table('getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset//train//y_train.txt')
trainSubject<-read.table('getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset//train//subject_train.txt')
trainSet<-read.table('getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset//train/X_train.txt')

## Merging train and test data
dataLabel<-rbind(testLabel,trainLabel)
dataSubject<-rbind(testSubject,trainSubject)
dataSet<-rbind(testSet,trainSet)

##Reading miscelleneaus data

#extract features names and activity labels
features<-read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset//features.txt")
features_names<-as.vector(features[,2])
activity_labeles<-read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset//activity_labels.txt")

##Match Activity digitals with actual String Activities
activity_numbers<-dataLabel$V1
activity_labels_string<-activity_labeles[match(activity_numbers,activity_labeles[,1]),2]

##Creating Merged Dataset
dataMerged<-cbind(activity_labels_string,dataSubject,dataSet)


#extract features names
features<-read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset//features.txt")
features_names<-as.vector(features[,2])

#assign row names
names(dataMerged)<-c("Activity","SubjectID",features_names)

#Creating final Dataset with only the measurements on the mean and standard deviation
colNames<-colnames(dataMerged)
logicalVector = (grepl("Activity",colNames) | grepl("Subject",colNames) | grepl("-mean..",colNames) | grepl("-std..",colNames))
dataFinal<-dataMerged[logicalVector==TRUE]

##Create a second, independent tidy data set with the average of each variable for each activity and each subject

#Reshaping
dataFinal_melted<-melt(dataFinal,id=c("Activity","SubjectID"))

#Dcasting
meanData<-dcast(dataFinal_melted, Subject + Activity ~ variable, mean)

##Writing into a file

write.table(meanData,file="Tidy_DataSet.txt",row.names=FALSE)


