## Read in the column names for test and train data
col<-read.table("Dataset/features.txt")

## Read in activity label names
activity_lab<-read.table("Dataset//activity_labels.txt")
## Assign activity label with colnames
colnames(activity_lab)<-c("Activity.No","Activity")

## Read in test and train data
test<-read.table("Dataset/test/X_test.txt")
train<-read.table("Dataset/train/X_train.txt")
## Assign test and train data with column names
colnames(test)<-col$V2
colnames(train)<-col$V2

## Read in test subject and activity data
subject_test<-read.table("Dataset/test/subject_test.txt")
activity_test<-read.table("Dataset/test/y_test.txt")
## Assign test subject and activity data with column names
colnames(subject_test)<-"Subject"
colnames(activity_test)<-"Activity.No"

## Read in train subject and activity data
subject_train<-read.table("Dataset//train//subject_train.txt")
activity_train<-read.table("Dataset//train//y_train.txt")
## Assign train subject and activity data with column names
colnames(subject_train)<-"Subject"
colnames(activity_train)<-"Activity.No"

## Step 2: Extract mean and std columns from test and train data
test_final<-test[,grepl("mean|std", colnames(test))]
train_final<-train[,grepl("mean|std", colnames(train))]

## Step 3: Add descriptive activity names to name the activities in the data set
activity_test<-merge(activity_test,activity_lab,by.x="Activity.No",by.y="Activity.No",all.x=TRUE)
activity_train<-merge(activity_train,activity_lab,by.x="Activity.No",by.y="Activity.No",all.x=TRUE)

## Add subject and activity to the mean and std columns of test and train data
test_final<-cbind(subject_test,Activity=activity_test$Activity,test_final)
train_final<-cbind(subject_train,Activity=activity_train$Activity,train_final)

## Step 1: merge the test and train sets to create one data set
merged<-rbind(test_final,train_final)

## Perform clean up
rm(col,activity_lab)
rm(test,test_final)
rm(train,train_final)
rm(subject_test,subject_train)
rm(activity_test,activity_train)

## Step 4: Cleaning up the variable names
## Obtain column names from dataset
merged_lab<-names(merged)
## Perform substitutes to clean up and format the column names
for (i in 1:length(merged_lab))
{
    merged_lab[i]<-gsub("\\()","",merged_lab[i])
    merged_lab[i]<-gsub("^t","time",merged_lab[i])
    merged_lab[i]<-gsub("^f","freq",merged_lab[i])
    merged_lab[i]<-gsub("BodyBody","Body",merged_lab[i])
    merged_lab[i]<-gsub("Mag","Magnitude",merged_lab[i])
    merged_lab[i]<-gsub("-std","-StdDev",merged_lab[i])
    merged_lab[i]<-gsub("-mean","-Mean",merged_lab[i])
}
## Set the formatted column names back to the dataset
names(merged)<-merged_lab
## Perform clean up
rm(merged_lab,i)

## Step 5: Create a second, tidy dataset
## 1st group by Activity then subject, then summarize each other columns
tidy <- merged %>% group_by(Activity,Subject) %>% summarise_each(funs(mean))
## Write to file
write.table(tidy, file = "./tidy_data.txt",row.names=FALSE)