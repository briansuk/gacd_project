# Read feature name data
features <- read.table("~/UCI HAR Dataset/features.txt", col.names = c("id", "featureName"))
# Prep vector for skipping columns only reading "std" and "mean" columns when reading X_* files
features$logical <- grepl("(std|mean)", features$featureName, ignore.case = TRUE)
features$toRead <- features$logical
features$toRead <- replace(features$toRead, features$toRead == TRUE, NA)
features$toRead <- replace(features$toRead, features$toRead == FALSE, "NULL")

# Read activity name data
activity_labels <- read.table("~/UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activityName"))

# Read subject ID data
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt", col.names = "subjectId")
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", col.names = "subjectId")

# Read y_* data files
y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt", col.names = "activityName")
y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt", col.names = "activityName")
# Replace ID numbers with string descriptions
y_test <- within(y_test, activityName <- as.character(activity_labels$activityName[y_test$activityName]))
y_train <- within(y_train, activityName <- as.character(activity_labels$activityName[y_train$activityName]))

# Read in X_* data, but only read in columns that are "NA" in features$toRead, this is done to reduce the memory footprint
X_test <- read.table("~/UCI HAR Dataset/test/X_test.txt", col.names = features$featureName, colClasses = features$toRead)
X_train <- read.table("~/UCI HAR Dataset/train/X_train.txt", col.names = features$featureName, colClasses = features$toRead)

# Helper variable
colNames <- colnames(X_test)

# Add subject ID numbers
X_test$subject <- subject_test$subjectId
X_train$subject <- subject_train$subjectId

# Add activity labels
X_test$activity <- y_test$activityName
X_train$activity <- y_train$activityName

# Merge the two datasets together
masterDF <- rbind (X_test, X_train)

# Helper variable
groupBy <- list(subjectId = masterDF$subject, activityName = masterDF$activity)

# Aggregate the columns by subjectId and activityName
aggData <- aggregate(masterDF[,colNames], by = groupBy, FUN = mean)

# Write and view the data
write.table(aggData, "aggData.txt", row.names = FALSE)
View(aggData)

# And we're done. *mic drop*
# Safety pig has arrived to celebrate with us.
#                               _
#  _._ _..._ .-',     _.._(`))
# '-. `     '  /-._.-'    ',/
#    )         \            '.
#   / _    _    |             \
#  |  a    a    /              |
#  \   .-.                     ;  
#   '-('' ).-'       ,'       ;
#      '-;           |      .'
#         \           \    /
#         | 7  .__  _.-\   \
#         | |  |  ``/  /`  /
#        /,_|  |   /,_/   /
#           /,_/      '`-'
#