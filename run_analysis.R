# Getting and Cleaning Data
# Week 4
# Date: 16.December.2017
# Author: Hercules Neves Hamanaka

library(plyr)

# --------------------------------------------------------------------- #
# Step 1 - Merges the training and the test sets to create one data set #
# --------------------------------------------------------------------- #

      # Reading trains
      x_train <- read.table("train/X_train.txt")
      y_train <- read.table("train/y_train.txt")

      subject_xy_train <- read.table("train/subject_train.txt")

      # Reading tests
      x_test <- read.table("test/X_test.txt")
      y_test <- read.table("test/y_test.txt")

      subject_xy_test <- read.table("test/subject_test.txt")

      # Merging trains and tests
      x_train_test <- rbind(x_train, x_test)
      y_train_test <- rbind(y_train, y_test)

      subject_xy_train_test <- rbind(subject_xy_train, subject_xy_test)

# ----------------------------------------------------------------------------------------------- #
# Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement #
# ----------------------------------------------------------------------------------------------- #

      features <- read.table("features.txt")
      names(features) <- c('id', 'description')

      # Get only 'mean' and 'std' features
      mean_std_feat <- grep("-(mean|std)\\(\\)", features$description)

      # Get only the desired columns
      x_train_test <- x_train_test[, mean_std_feat]

      # Changing column names
      names(x_train_test) <- features[mean_std_feat, 2]

# ------------------------------------------------------------------------------- #
# Step 3 - Uses descriptive activity names to name the activities in the data set #
# ------------------------------------------------------------------------------- #

      activities <- read.table("activity_labels.txt")

      # Changing activities labels name
      y_train_test[, 1] <- activities[y_train_test[, 1], 2]


# -------------------------------------------------------------------------- #
# Step 4 - Appropriately labels the data set with descriptive variable names
# -------------------------------------------------------------------------- #

      # Updating column name
      names(y_train_test) <- "activity"
      names(subject_xy_train_test) <- "subject"

# --------------------------------------------------------------------------------- #
# Step 5 - From the data set in step 4, creates a second, independent tidy data set 
#          with the average of each variable for each activity and each subject
# --------------------------------------------------------------------------------- #

      tidy_data_set <- cbind(x_train_test, y_train_test, subject_xy_train_test)


      # The last two columns are 'subject' and 'activity' they are put in the first two
      average_data <- ddply(tidy_data_set, .(subject, activity), function(x) colMeans(x[, 1:66]))

      # Writing the file 'averages_data.txt'
      write.table(average_data, "averages_data.txt", row.name=FALSE)
