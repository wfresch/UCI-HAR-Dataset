tidyData <- function () {
    x_test <- read.table("test\\X_test.txt")
    y_test <- read.table("test\\y_test.txt")
    
    x_train <- read.table("train\\X_train.txt")
    y_train <- read.table("train\\y_train.txt")
    
    features <- read.table("features.txt")
    activity_labels <- read.table("activity_labels.txt")
    
    columnNames <- features$V2
    names(x_test) <- columnNames
    names(x_train) <- columnNames
    
    y_test_descriptive <- activity_labels$V2[match(y_test$V1,activity_labels$V1)]
    data_frame_test <- cbind(Activity=y_test_descriptive,x_test)
    
    y_train_descriptive <- activity_labels$V2[match(y_train$V1,activity_labels$V1)]
    data_frame_train <- cbind(Activity=y_train_descriptive,x_train)
    
    data_frame_combined <- rbind(data_frame_test, data_frame_train)
    
    meanAndStdColumns <- grep("(mean\\(\\)|std\\(\\)|Activity)",colnames(data_frame_combined))
    data_frame_filtered <- data_frame_combined[,meanAndStdColumns]
    
    write.table(data_frame_filtered, file = "output.txt", row.names = FALSE)
}

