# README
## By Weiyu Wan, 2014/12/15
## 1.Read data
### In the first step, we read all the required data by using the function"read.table". These data includes "x_test.txt","y_test.txt","x_train.txt","y_train.txt","subject_test.txt", "subject_train.txt", "features.txt"

## 2.Merge the training and the test sets 
### Taking advantage of the function "rbind", we can easily merge the raw data from the training and the test sets.

## 3. Extract only the measurements on the mean and standard deviation for each measurement.

### 3.1 We named the column names of the merged  sets by the features storaged in "features.txt".
### 3.2 We can access the names of various of the measurements from "features.txt"
### 3.3 We define the names which include "mean", "Mean" and "std" as the measurements on the mean and standard deviation.
### 3.3 We can get the positions of names which include "mean","std" separately by using the function "grep"
### 3.4 We can extracts the data we want by these positions.

## 4.Uses descriptive activity names to name the activities in the data set 
### 4.1 we can achieve the descriptive activity names in  "activity_labels.txt" file. There are 6 labels which are "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING". 
### 4.2 And then we can replace the active code(1~6) in "y_test.txt","y_train.txt" by these names.
### 4.3 finally, we can name the activities in the data set by "rbind"

## 5.Appropriately labels the data set with descriptive variable names
### We only need to rename the first column and second column. Other columns have already had the correct name.

## 6. Create a second independent tidy data set with the average of each variable for each activity and each subject

### we can solve these problems easily by function "aggregate"
### REMEMBER:after using the  function "aggregate", the first column of the data changed, we should rename them.
### Finally we output these new data set by write.table
