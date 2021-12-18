#Getting and Cleaning Data Course Project

# Download file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, 
  "C:/Users/Admin/Documents/R Projects/Getting and Cleaning Data Project/file.zip")
zipfile <- unzip("C:/Users/Admin/Documents/R Projects/Getting and Cleaning Data Project/file.zip")

#Part 1: Merge training and test data sets into one data set
#Read test data
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names=("activity"))
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=("subject"))
test_df <- cbind(test_set, test_labels, subject_test)

#Read train data
train_set <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names=("activity"))
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=("subject"))
train_df <- cbind(train_set, train_labels, subject_train)

#Merge test and train
merged_df <- rbind(test_df, train_df)

#Part 2: Extract only the measurements on the mean and st.dev. for each measurement.
feature <- read.table("./UCI HAR Dataset/features.txt")
index <- grep("mean()|std()", feature$V2)
mean_std_data <- merged_df[,c(index, 562:563)]

#Part 3: Use descriptive activity names to name the activities in the data set
library(dplyr)
mean_std_data <- mutate(mean_std_data, activity = factor(1*activity, labels = c("walking", "walking_upstairs",
                "walking_downstairs", "sitting", "standing", "laying")))
head(select(mean_std_data, activity), 20)

#Part 4: Label the dataset with descriptive variable names
desc_var_name <- grep("mean()|std()", feature$V2, value=TRUE)
colnames(mean_std_data) <- c(desc_var_name, "activity", "subject")

#Part 5: From the dataset in step 4, create a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
independent_tidy_df <- mean_std_data %>%
  group_by(activity, subject) %>%
  summarise_at(vars(1:79), mean)
write.table(independent_tidy_df, "TidyData.txt", row.names = FALSE)