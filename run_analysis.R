tidyData <- function () {
    
    # Read x and y test files into data-frames.
    x_test <- read.table("test\\X_test.txt")
    y_test <- read.table("test\\y_test.txt")

    # Read x and y train files into data-frames.    
    x_train <- read.table("train\\X_train.txt")
    y_train <- read.table("train\\y_train.txt")
    
    # Read features and activity_labels files into data-frames.
    features <- read.table("features.txt")
    activity_labels <- read.table("activity_labels.txt")
    
    # Set the Heading values according to values found in 'features'.
    columnNames <- features$V2
    names(x_test) <- columnNames
    names(x_train) <- columnNames
    
    # Find the descriptive 'activity_labels' values based on 'y_test' numbers.
    # Append those descriptive values to 'x_test'.
    y_test_descriptive <- activity_labels$V2[match(y_test$V1,activity_labels$V1)]
    data_frame_test <- cbind(Activity=y_test_descriptive,x_test)
    
    # Find the descriptive 'activity_labels' values based on 'y_train' numbers.
    # Append those descriptive values to 'x_train'.
    y_train_descriptive <- activity_labels$V2[match(y_train$V1,activity_labels$V1)]
    data_frame_train <- cbind(Activity=y_train_descriptive,x_train)
    
    # Combine the 'test' and 'train' data-frames.
    data_frame_combined <- rbind(data_frame_test, data_frame_train)
    
    # Filter the data-frame to include ONLY the 'mean' and 'std' columns
    # (plus the left-most 'Activity' column).
    meanAndStdColumns <- grep("(mean\\(\\)|std\\(\\)|Activity)",colnames(data_frame_combined))
    data_frame_filtered <- data_frame_combined[,meanAndStdColumns]
    
    # Write the filtered data-frame to an output file.
    write.table(data_frame_filtered, file = "output.txt", row.names = FALSE)
}

