#Code Book
##Coursera Getting and cleaning data Course Project
###author: Pablo O Rodriguez


**Tidy dataset:**

*summary_dataset*

The run_analysis resulting 'summary_dataset' is a dplyr tbl objets that holds 6 variables and 5940 rows. Variables (columns) are:

  1) 'subject': this is de subject number. Its range is from 1 to 30.
  
  2) 'activities': this has the type of activity registerd while measurement is recorded during the experiment. It has 6 possible values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
  
  3) 'measurement': this is a character vector containing the measurement name:
  
        1) frequencyBodyLinearAcceleration   
             
        2) frequencyBodyLinearAccelerationJerk  
          
        3) frequencyBodyLinearAccelerationJerkMagnitude  
 
        4) frequencyBodyLinearAccelerationMagnitude      
 
        5) frequencyBodyLinearAngularVelocity             

        6) frequencyBodyLinearAngularVelocityJerkMagnitude

        7) frequencyBodyLinearAngularVelocityMagnitude    

        8) timeBodyLinearAcceleration                     

        9) timeBodyLinearAccelerationJerk                 

        10) timeBodyLinearAccelerationJerkMagnitude        

        11) timeBodyLinearAccelerationMagnitude            

        12) timeBodyLinearAngularVelocity                  

        13) timeBodyLinearAngularVelocityJerk              

        14) timeBodyLinearAngularVelocityJerkMagnitude     

        15) timeBodyLinearAngularVelocityMagnitude         

        16) timeGravityAcceleration                        

        17) timeGravityAccelerationMagnitude 
        
  4) 'axis': this is the axis that correspond to the measurement registered in each row. It can have 4 values= X, Y, Z or XYZ (in the case of magnitude)
  
  5) 'mean': this one contains the mean by patient and activity of raw data measurements mean(); values are unitless, they were normalized with a range from -1 to 1.
  
  6) 'std': this one contain the mean by patient and activity of raw data measurements std(); values are unitless, they were normalized with a range from -1 to 1.



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