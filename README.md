# UCI-HAR-Dataset

##In order to extract Tidy data, use R-Studio and:
1. Set the working directory to UCI-HAR-Dataset.
2. Use 'source("run_analysis.R")' to load the run_analysis.R file.
3. Type "tidyData()" to extract Tidy data from the files.
4. Tidy data will be output to 'output.txt'

##The tidyData function performs the following steps:
1. Read the x and y test files into data-frames.
2. Read the x and y train files into data-frames.    
3. Read the features and activity_labels files into data-frames.
4. For the 'test' and 'train' data-frames, set the Heading values according to values found in 'features'.
5. Find the descriptive 'activity_labels' values based on 'y_test' numbers.  Then, append those descriptive values to 'x_test'.
6. Repeat step 5, for 'y_train' and 'x_train'.
7. Combine the 'test' and 'train' data-frames into a single data-frame.
8. Filter the data-frame to include ONLY the 'mean' and 'std' columns (plus the left-most 'Activity' column).
9. Write the filtered data-frame to an output file.

