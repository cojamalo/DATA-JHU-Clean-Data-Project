library(data.table)
library(plyr)
library(dplyr)
library(stringr)
library(stats)


#The following function generates a complete table for each subject grouping dataset in Human Activity
## Recognition Using Smartphones Dataset
generateDataset <- function(subject_id_path, Y_test_path, X_test_path, subject_group_label) {
  ##Import subject codes as a factor vector
  subject_id <- scan(subject_id_path, what = numeric()) %>% as.factor
  
  ##Import activity codes as a factor vector with the proper names instead of codes using 
  ##./activity_labels.txt as reference (plyr)
  ##Satisfies homework requirement 3: Use descriptive activity names to name the activities in the data set
  activity_names <- c("1" = "WALKING", "2" = "WALKING_UPSTAIRS", "3" = "WALKING_DOWNSTAIRS", "4" = "SITTING", "5" = "STANDING", "6" = "LAYING")
  activity <- scan(Y_test_path, what = numeric()) %>% as.factor %>% revalue(activity_names)
  
  ##Import main dataset using features table to rename columns of the dataset (data.table)
  ##Satisfies homework requirement 4: Appropriately label the data set with descriptive variable names.
  dataset <- fread(X_test_path, header= FALSE)
  features <- fread("./features.txt", header= FALSE)
  colnames(dataset) <- features$V2
 
  ##Create complete table for all test values
  return(cbind(subject_id,activity,dataset)) 
}

#Generate a complete table for the 9 subjects of the "Test" data.
test <- generateDataset("./test/subject_test.txt","./test/Y_test.txt","./test/X_test.txt", "TEST")

#Generate a complete table for the 21 subjects of the "Train" data.
train <- generateDataset("./train/subject_train.txt","./train/Y_train.txt","./train/X_train.txt", "TRAINING")

#Combine both tables into complete dataset with all 30 subjects
##Satisfies homework requirement 1: Merge the training and the test sets to create one data set.
all_data <- rbind(train,test)

#Extract only the measurements on the mean and standard deviation for each measurement (stringr)
##Find the indexes of the column names that include either mean or std and include id columns
extract_locales <- which(str_detect(names(all_data),"-mean\\(\\)|-std\\(\\)"))
extract_locales <- c(1:2, extract_locales)

##Complete the extraction using subsetting (data.table)
##Satifies homework requirement 2: Extract only the measurements on the mean and standard deviation for each measurement.
selected_data <- all_data[,extract_locales, with=FALSE] %>% tbl_df

##Group the data by the subject_id and activity columns (dplyr)
grouped <- group_by(selected_data, subject_id, activity)

##Collapse the rows such that, for each subject_id and each activity, there is a single mean value for each variable
####Satifies homework requirement 5: From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject.
summed <- summarize_each(grouped, "mean")

##Write this final file to a txt file using write.table() with row.name = FALSE
write.table(summed, file = "output.txt", row.name = FALSE)

#Remove extra variables so only the desired ones still remain in the workspace
rm(test)
rm(train)
rm(extract_locales)
rm(grouped)


