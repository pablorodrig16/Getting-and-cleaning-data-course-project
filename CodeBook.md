#Code Book
##Coursera Getting and cleaning data Course Project
###author: Pablo O Rodriguez


**Tidy dataset:**

*summary_dataset*

This dplyr tbl objets holds 68 variables and 180 rows:

  * column 1: subject number. Its range is from 1 to 30.
  * column 2: activities. It has 6 values ((WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING))
  * columns 3 to 68: mean per subject and activity type of mean () and standard deviation () from  measurements from train and test data set:
  
        - time domain body linear acceleration on the 3 axis (X,Y,Z)
        - time domain gravity acceleration on the 3 axis (X,Y,Z)
        - time domain body linear acceleration (Jerk signal) on the 3 axis (X,Y,Z)
        - time domain body linear angular velocity on the 3 axis (X,Y,Z)
        - time domain body linear angular velocity (Jerk signal) on the 3 axis (X,Y,Z)
        - magnitudes (Euclidean norm) of the all the previous 3 dimensional variables (one variable for each)
        - frequency domain body linear acceleration on the 3 axis (X,Y,Z)
        - frequency domain body linear acceleration (Jerk signal) on the 3 axis (X,Y,Z)
        - frequency domain body linear angular velocity on the 3 axis (X,Y,Z)
        - frequency domain body linear acceleration magnitude
        - frequency domain body linear acceleration (Jerk signal) magnitude
        - frequency domain linear angular velocity magnitude
        - frequency domain linear angular velocity (Jerk signal) magnitude
        
X, Y and Z axis measurements are included in separated variables. I used grep function to find those variables names containing 'mean()' and 'std()' in the original test and train data set. All measurements values are unitless, they are normalized with a range from -1 to 1.
To improve the legibility of these complex variables names I changed them from the raw data files as follows:

3       timeBodyLinearAcceleration_mean_X
4	timeBodyLinearAcceleration_mean_Y
5	timeBodyLinearAcceleration_mean_Z
6	timeBodyLinearAcceleration_std_X
7	timeBodyLinearAcceleration_std_Y
8	timeBodyLinearAcceleration_std_Z
9	timeGravityAcceleration_mean_X
10	timeGravityAcceleration_mean_Y
11	timeGravityAcceleration_mean_Z
12	timeGravityAcceleration_std_X
13	timeGravityAcceleration_std_Y
14	timeGravityAcceleration_std_Z
15	timeBodyLinearAccelerationJerk_mean_X
16	timeBodyLinearAccelerationJerk_mean_Y
17	timeBodyLinearAccelerationJerk_mean_Z
18	timeBodyLinearAccelerationJerk_std_X
19	timeBodyLinearAccelerationJerk_std_Y
20	timeBodyLinearAccelerationJerk_std_Z
21	timeBodyLinearAngularVelocity_mean_X
22	timeBodyLinearAngularVelocity_mean_Y
23	timeBodyLinearAngularVelocity_mean_Z
24	timeBodyLinearAngularVelocity_std_X
25	timeBodyLinearAngularVelocity_std_Y
26	timeBodyLinearAngularVelocity_std_Z
27	timeBodyLinearAngularVelocityJerk_mean_X
28	timeBodyLinearAngularVelocityJerk_mean_Y
29	timeBodyLinearAngularVelocityJerk_mean_Z
30	timeBodyLinearAngularVelocityJerk_std_X
31	timeBodyLinearAngularVelocityJerk_std_Y
32	timeBodyLinearAngularVelocityJerk_std_Z
33	timeBodyLinearAccelerationMagnitude_mean
34	timeBodyLinearAccelerationMagnitude_std
35	timeGravityAccelerationMagnitude_mean
36	timeGravityAccelerationMagnitude_std
37	timeBodyLinearAccelerationJerkMagnitude_mean
38	timeBodyLinearAccelerationJerkMagnitude_std
39	timeBodyLinearAngularVelocityMagnitude_mean
40	timeBodyLinearAngularVelocityMagnitude_std
41	timeBodyLinearAngularVelocityJerkMagnitude_mean
42	timeBodyLinearAngularVelocityJerkMagnitude_std
43	frequencyBodyLinearAcceleration_mean_X
44	frequencyBodyLinearAcceleration_mean_Y
45	frequencyBodyLinearAcceleration_mean_Z
46	frequencyBodyLinearAcceleration_std_X
47	frequencyBodyLinearAcceleration_std_Y
48	frequencyBodyLinearAcceleration_std_Z
49	frequencyBodyLinearAccelerationJerk_mean_X
50	frequencyBodyLinearAccelerationJerk_mean_Y
51	frequencyBodyLinearAccelerationJerk_mean_Z
52	frequencyBodyLinearAccelerationJerk_std_X
53	frequencyBodyLinearAccelerationJerk_std_Y
54	frequencyBodyLinearAccelerationJerk_std_Z
55	frequencyBodyLinearAngularVelocity_mean_X
56	frequencyBodyLinearAngularVelocity_mean_Y
57	frequencyBodyLinearAngularVelocity_mean_Z
58	frequencyBodyLinearAngularVelocity_std_X
59	frequencyBodyLinearAngularVelocity_std_Y
60	frequencyBodyLinearAngularVelocity_std_Z
61	frequencyBodyLinearAccelerationMagnitude_mean
62	frequencyBodyLinearAccelerationMagnitude_std
63	frequencyBodyLinearAccelerationJerkMagnitude_mean
64	frequencyBodyLinearAccelerationJerkMagnitude_std
65	frequencyBodyLinearAngularVelocityMagnitude_mean
66	frequencyBodyLinearAngularVelocityMagnitude_std
67	frequencyBodyLinearAngularVelocityJerkMagnitude_mean
68	frequencyBodyLinearAngularVelocityJerkMagnitude_std  


**Study design**

These experiments were carried out in a group of 30 volunteers within an age bracket of 19-48 years [1]. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions:

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

**Raw data**

Processed signals are accesibles in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This compressed file is downloaded in run_analysis.R as 'data.zip' in the working directory. This is the raw data file. This file contains 32 files:

1) "UCI HAR Dataset/activity_labels.txt"                         
2) "UCI HAR Dataset/features.txt"                                
3) "UCI HAR Dataset/features_info.txt"                           
4) "UCI HAR Dataset/README.txt"                                  
5) "UCI HAR Dataset/test/"                                       
6) "UCI HAR Dataset/test/Inertial Signals/"                       
7) "UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt"   
8) "UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt"   
9) "UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt"   
10) "UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt"  
11) "UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt"  
12) "UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt"  
13) "UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt"  
14) "UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt"  
15) "UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt"  
16) "UCI HAR Dataset/test/subject_test.txt"                       
17) "UCI HAR Dataset/test/X_test.txt"                             
18) "UCI HAR Dataset/test/y_test.txt"                             
19) "UCI HAR Dataset/train/"                                      
20) "UCI HAR Dataset/train/Inertial Signals/"                     
21) "UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt"  
22) "UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt"     
23) "UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt"     
24) "UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt"       
25) "UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt"      
26) "UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt"      
27) "UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt"      
28) "UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt"      
29) "UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt"      
30) "UCI HAR Dataset/train/subject_train.txt"                     
31) "UCI HAR Dataset/train/X_train.txt"                           
32) "UCI HAR Dataset/train/y_train.txt"    

These compressed files hold the following data (used to get tidy data):

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

Additionally other files are available for the train and test data (not used in 'run_analysis.R' script). Their descriptions are equivalent: 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


*Reference:*

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012