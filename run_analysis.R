# Download and unzip data
if (!file.exists("uci.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "uci.zip")
    unzip("uci.zip")
}

# Load the training and test data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
train_data <- cbind(subject_train, y_train, x_train)

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
test_data <- cbind(subject_test, y_test, x_test)

# 1. Merge the data
data <- rbind(train_data, test_data)

# 4. Add feature names for the variables
feature_names <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
names(data) <- c("subject", "activity", feature_names[[2]])

# 3. Convert activity labels to descriptive names
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
data$activity <- activity_labels[match(data$activity, activity_labels[[1]]), 2]

# 2. Extract the mean & standard deviation variables
data_mean_std <- data[, grep("subject|activity|mean()|std()", names(data))]

# 5. Get the average of each variable for each activity and each subject
data_avg_per_activity_subject <- as.data.frame(data_mean_std %>% group_by(activity, subject) %>% summarize(across(everything(), mean)))
write.table(data_avg_per_activity_subject, file = "tidy_data.txt", row.names = FALSE)
