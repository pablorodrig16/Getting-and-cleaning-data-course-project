#README
##Coursera Getting and cleaning data Course Project
###Author: Pablo O Rodriguez



This repository holds a script ('run_analysis.R') to get two tidy dataset from the Human Activity Recognition Using Smartphones Dataset. This script is the response to the Coursera Getting and cleaning data course project. Also a 'CodeBook.md' where details about study design, raw data and tidy datasets produced by the script can be found.

Raw data is a compressed zip file that holds data from experiments carried out in a group of 30 volunteers within an age bracket of 19-48 years [1]. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured. Processed signals are accesibles in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.


**Intructions**

Once downloaded, the 'run_analysis.R' can be sourced. It will download a copy of the dataset described above (it is called 'data.zip' by the script), unzip it and it will create 2 datasets as it was asked in the Coursera Getting and Cleaning data course project instructions.

 

**run_analysis.R script** 

It produces 2 tidy dataset:

        - The first one holds those variables with the mean and standard deviation (std) for each measurement ('mean_std_dataset').
        - The second holds the average of each variable for each activity and each subject from the first dataset ('summary_dataset'). The latter is saved in the working directory (named 'new_dataset.txt'). 

The script requires dplyr and curl packages and works as follows:

1) if data files ('data.zip' and unzip files) are not found in the working directory 'data.zip' it is downloaded and unzip. This creates a directory called 'UCI HAR Dataset'.

2) Data activities labels are get from 'UCI HAR Dataset/activity_labels.txt'.

3) Variables names are get from 'UCI HAR Dataset/features.txt', and those with containing 'mean()' or 'std()' were selected using grep function. To improve legibility of these complex variables I modified the original name. The result is explained in 'CodeBook.md', but briefly I removed the number of variable from the original name with the strsplit and sapply functions keeping the description. Then I corrected the name of some variables that contained 'BodyBody'. Then I edited (actually expanded) the description as it is expressed in the Code Book.

4) Data from test dataset were obtained (subject number, activities and data sensor measurementes) from: 
        
        a. "UCI HAR Dataset/test/subject_test.txt"  (subject number)                       
        b. "UCI HAR Dataset/test/X_test.txt" (activity)                              
        c. "UCI HAR Dataset/test/y_test.txt" (data sensor measurements) 

5) Data from train dataset were obtained (subject number, activities and data sensor measurementes) from: 
        
        a. "UCI HAR Dataset/train/subject_train.txt" (subject number)                      
        b. "UCI HAR Dataset/train/X_train.txt" (activity)                            
        c. "UCI HAR Dataset/train/y_train.txt" (data sensor measurements)

6) a dplyr tbl object is created with both data sensor measurements data.frames (test and train).

7) variables containing 'mean()' or 'std()' were selected using dplyr::select function.

8) subject number and activities (encoded with data activities labels) were bound to both test and train tbl objets.

9) test and train tbl are merged to produce the first tidy dataset ('mean_std_dataset').

10) mean_std_dataset tbl is grouped by both subject and activity and summarised with summarise_each function to get the second tidy dataset ('summary_dataset').

11) the latter is saved in the working directory as 'summary_dataset.txt'.






*Reference:*

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012