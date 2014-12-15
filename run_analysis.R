## Reading data
x_test_data<-read.table("./test/X_test.txt")
y_test_data<-read.table("./test/y_test.txt")
x_train_data<-read.table("./train/x_train.txt")
y_train_data<-read.table("./train/y_train.txt")
subject_test_data<-read.table("./test/subject_test.txt")
subject_train_data<-read.table("./train/subject_train.txt")
feature_data<-read.table("features.txt")
##Reshape

###Merges the training and the test sets to create one data set.
####mark the x_train_data and x_test_data
test_type<-c(rep(0,dim(x_train_data)[1]),rep(1,dim(x_test_data)[1]))

x_data<-rbind(x_train_data,x_test_data)



names(x_data)<-feature_data$V2

#get the positions of names which include "mean","std" seperately
pos_mean<-grep("mean",names(x_data))
pos_Mean<-grep("Mean",names(x_data))
pos_std<-grep("std",names(x_data))
pos_mean_std<-c(pos_mean,pos_Mean,pos_std)

#get the overall positions
pos_mean_std<-unique(sort(pos_mean_std))

#get the data only include mean and std
x_data_std_mean<-x_data[pos_mean_std]

#mark train data and test data seperately
active_code<-rbind(y_train_data,y_test_data)

#mark the subject of train data and test data seperately
subject_data<-rbind(subject_train_data,subject_test_data)


##produce the descriptive variable names
active_descript<-active_code
despcipt<-c("WALKING"," WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
for (i in 1:6){
        active_descript<-replace(active_descript,active_code==i,despcipt[i])
}

##produce the new merged data
all_data<-cbind(test_type,active_descript,subject_data,x_data_std_mean)

names(all_data)[3]<-"subject"
names(all_data)[2]<-"active_descript"

##independent tidy data set with the average of each variable for each activity and each subject
all_data_mean<-aggregate(all_data[,4:89],by=list(all_data$active_descript,all_data$subject), mean)
#rename the first column and second column
names(all_data_mean)[2]<-"subject"
names(all_data_mean)[1]<-"active_descript"

write.table(all_data_mean,file="tidy_data.txt",row.names=FALSE)
