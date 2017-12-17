# General Info

The script run_analysis.R performs the steps below:

   1. Merges the training and the test sets to create one data set

      - Here the data from the downloaded files are extracted and then merged

   2. Extracts only the measurements on the mean and standard deviation for each measurement

      - From the features data only the columns with 'mean' or 'std' are used and stored in the variable `mean_std_feat`
      - The subset of data is made and saved on `x_train_test`

   3. Uses descriptive activity names to name the activities in the data set

      - The IDs from the activities file are read and used in the dataset `y_train_test`

   4. Appropriately labels the data set with descriptive variable names

      - The columns 'subject' and 'activity' are added to the datasets

   5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

      - The `tidy_data_set` is created based on the merge of the previous datasets `x_train_test`, `y_train_test` and `subject_xy_train_test`. Then the mean of columns is made.

      - The file `average_data.txt` is created

# Variables

These contains the data from the downloaded files:
   - `x_train` : training set
   - `y_train` : training labels
   - `x_test` : test set
   - `y_test` : test labels
   - `subject_xy_train` : each row identifies the subject who performed the activity for each window sample
   - `subject_xy_test` : ach row identifies the subject who performed the test
   - `features` : list of all features
   - `activities` : links the class labels with their activity name

These contains the merged data from the previous variables:
   - `x_train_test` : contais the merge of X train and test
   - `y_train_test` : contains the merge of y train and test
   - `subject_xy_train_test` : contains the merge of subject train and test

These contains the final results:
   - `tidy_data_set` : contains the merge of `x_train_test`, `y_train_test` and `subject_xy_train_test`
   - `average_data` : contains the average of each variable for each activity and subject
