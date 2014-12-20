features <- read.table("~/UCI HAR Dataset/features.txt", col.names = c("id", "featureName"))
activity_labels <- read.table("~/UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activityName"))
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt", col.names = "subjectId")
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", col.names = "subjectId")

X_test <- read.table("~/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt")
X_train <- read.table("~/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt")

