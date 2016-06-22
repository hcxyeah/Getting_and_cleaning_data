setwd("/Users/Caixia/Downloads/Coursera/Data_Science/Getting_cleaning_data/project")
features_name <- as.vector(read.table("features.txt")$V2)
train_x <- read.table("./train/X_train.txt")
colnames(train_x) <- features_name
train_y <- read.table("./train/y_train.txt", col.names = c("activity_id"))
test_x <- read.table("./test/X_test.txt")
colnames(test_x) <- features_name
test_y <- read.table("./test/y_test.txt", col.names = c("activity_id"))
subject_test <- read.table("./test/subject_test.txt", col.names = c("subject"))
subject_train <- read.table("./train/subject_train.txt", col.names = c("subject"))

## Merge the training and test sets into dt
train <- cbind(train_x, train_y, subject_train)
test <- cbind(test_x, test_y, subject_test)
dt <- rbind(train, test)

## Use descriptive activity name
activity_label <- read.table("activity_labels.txt", col.names = c("activity_id", "activity"))
final <- merge(dt, activity_label, by = "activity_id", all.x = TRUE)
names(final)

## Extract mean and std measurement
extract <- (grepl("(mean|std|activity|subject)", names(final)) & !grepl("meanFreq", names(final)))
meanstd <- final[,extract]
head(meanstd)
## Appropriately labels the data set with descriptive variable names
names(meanstd) <- gsub("Acc", "Accelerometer", names(meanstd))
names(meanstd) <- gsub("Gyro", "Gyroscope", names(meanstd))
names(meanstd) <- gsub("Mag", "Magnitude", names(meanstd))
names(meanstd) <- gsub("^t", "time", names(meanstd))
names(meanstd) <- gsub("^f", "frequency", names(meanstd))
names(meanstd) <- gsub("BodyBody", "Body", names(meanstd))

## Creates a second, independent tidy data set with the average of each variable for each 
## activity and each subject.
library(plyr)
tidy_data <- ddply(meanstd, c("activity", "subject"), numcolwise(mean))
tidy_data <- select(tidy_data, -activity_id)
write.csv(tidy_data, file = "submit.csv")

