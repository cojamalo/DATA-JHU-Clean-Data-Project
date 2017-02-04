
PART I: SUMMARY OF EXPERIMENTAL SETUP AND SOURCE DATASET (From UCI HAR Dataset Readme)
==================================================================
###If you are familiar with the Human Activity Recognition Study, please skip to PART II for variable explanation.

The following are excerpts from the source dataset that explain the experimental setup and where the variables come from:

##Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

- Features are normalized and bounded within [-1,1].

##Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

1. List of Features
  *tBodyAcc-XYZ
  *tGravityAcc-XYZ
  *tBodyAccJerk-XYZ
  *tBodyGyro-XYZ
  *tBodyGyroJerk-XYZ
  *tBodyAccMag
  *tGravityAccMag
  *tBodyAccJerkMag
  *tBodyGyroMag
  *tBodyGyroJerkMag
  *fBodyAcc-XYZ
  *fBodyAccJerk-XYZ
  *fBodyGyro-XYZ
  *fBodyAccMag
  *fBodyAccJerkMag
  *fBodyGyroMag
  *fBodyGyroJerkMag
  *(abridged).....
More info can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


PART II: SUMMARY OF VARIABLES PRESENT IN THE OUTPUT TABLE AFTER RUN_ANALYSIS.R IS EXECUTED 
=================
| Variable Name  |  Position   | Values or Explanation 													       |
| -------------- |:-----------:| -----------------------------------------------------------------------------:|
| subject_id	 |	 	1	   |  The code represents which subject out of the 30 possible in the experiment 					 				  was being observed. The nine subjects with subject_id 2,4,9,10,12,13,18,20,24 are from the "test" group. The twenty-one subjects with subject_id 1,3,5-8,11,14-17,19,21-23,25-30 are from the "training" group. | 
| activity 		 |	    2	   |  Which of the six possible activities that were being observed: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, or STANDING LAYING   |
|tBodyAcc-mean()-X, tBodyAcc-mean()-Y, etc |  3-66	 | The remaining variables refer to the features of the sensors that were measured. The variable names are coded in parts such as FIRST-SECOND()-THIRD. The FIRST part refers to which specific feature of the sensors was measured such as tBodyAcc. The SECOND part refers to the type of statistic applied to the value for that feature, either mean() or std(), since my script only selected the mean value or standard deviation of the value. The THIRD part refers what plane in 3D space the sensor measured, either X, Y or Z. The actual numbers in these columns are derived from normalized and bounded displacement values from -1 to 1 (unitless). After running my script, both the -mean() and -std() values where grouped by activity type and subject id and then averaged together. Thus, the numbers in the output data table represent the mean value of the original displacement values over all instances for that subject-activity pairing.|




