## DATA-JHU-Clean-Data-Project
### Submission by Connor Lenio. Email: cojamalo@gmail.com
Completion Date: Feb 4, 2017

The following are the instructions for implementing the run_analysis.R script with the source data.

### Working Directory
Please make sure your working directory contains the uncompressed contents from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script assumes that paths such as "./test/subject_test.txt" are valid. Please confirm this is the case for you.

### Dependecies
The script assumes the following packages are either in your base R installation or have been installed:
- data.table
- plyr
- dplyr
- stringr
- stats

### RUN
Source the run_analysis.R script in your working directory that also contains the experiment data. No other scripts are needed.

### The Process
I have also commented the code itself in run_analysis.R, so feel free to follow along by looking at its contents.

The generateDataset function creates a complete table from the subject, Y_test, and X_test files in both the test and training data by:
- Importing the subject codes from the subject file as a factor vector
- Importing the activity codes as a factor vector with the proper names instead of codes using ./activity_labels.txt as reference (plyr). This step satisfies homework requirement 3: Use descriptive activity names to name the activities in the data set
- Importing the main dataset using the features table to rename columns of the dataset (data.table). This step satisfies homework requirement 4: Appropriately label the data set with descriptive variable names.
- Creating a complete table for all test values using cbind on the imported data
  
The script calls this function for both the test and training datasets:
- Calling it with correct parameters for test data, generating a complete table for the 9 subjects of the "Test" data.
- Calling it with correct parameters for training data, generating a complete table for the 21 subjects of the "Train" data.
See lines 31 and 34 of run_analysis.R for the exact parameter values used.

The script then continues by:
- Combining both the test and training tables into complete dataset for all 30 subjects. This step satisfies homework requirement 1: Merge the training and the test sets to create one data set.
- Extracting only the measurements on the mean and standard deviation for each measurement from the complete dataset (stringr)
- Finding the indexes of the column names that include either mean or std and include the id column indexes in the vector
- Completing the extraction or subsetting using the vector of indexes from the previous step (data.table). This step satifies homework requirement 2: Extract only the measurements on the mean and standard deviation for each measurement.
- Grouping the resulting data subset by the subject_id and activity columns (dplyr)
- Collapsing the rows such that, for each subject_id and each activity, there is a single mean value for each variable. This step satifies homework requirement 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- Writing this final table to a txt file using write.table() with row.name = FALSE called output.txt
- Finally, removing extra variables so only the desired ones still remain in the workspace

### OUTPUT
When the script completes, your workspace will contain the variables to the fully combined dataset, all_data, the selected data subset based on using only those variables that are means or standard deviations, selected_data, and the final table variable with the data grouped by subject id and activity type, summed.

In addition, your workspace will now contain a file, "output.txt", which is the fully processed data equivalent to summed.

Project coded by Connor Lenio - released into the public domain for educational purposes in 2017. 



