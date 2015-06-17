##This script creates 2 data.table datasets with tidy data from UCI HAR Dataset
##required in the course project from Getting and cleaning data course


require (dplyr)

##get data from url and save it in ./Data directory
##curl library is loaded for allowing https handling with curl_download function
##Download data.zip in ./Data directory

if (!file.exists ("data.zip")){
        require (curl)
        url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        curl_download (url, destfile = "./data.zip")       
}



##get zip directories and unzip files in the working directory (if it has not 
##been done before)

zip_files<-unzip ("data.zip",list = TRUE)[[1]]
if (!file.exists("./UCI HAR Dataset")){
        unzip ("data.zip")
}


##get dataset variables names

data_variables_names<-readLines (zip_files[2])



##get activities names
activity_labels<-read.table (zip_files[1],
                             col.names = c("code", "activity"))
activity_variables_with_mean<-grep(pattern = "mean",x = data_variables_names)
activity_variables_with_std<-grep(pattern = "std",x = data_variables_names)
activity_variables_with_mean_and_std<-sort(c(activity_variables_with_mean,
                                             activity_variables_with_std))

##get dataset from test patients
##1) subjects number
test_subjects<-as.numeric(readLines (zip_files[16]))
##2) activities code and assign their label as factor 
test_activities<-readLines (zip_files[18])
test_activities<-factor (test_activities,levels = activity_labels[,1], 
                         labels = activity_labels[,2])
##3) data from sensors
test_data<-read.table (zip_files[17], colClasses = "numeric",
                       col.names = data_variables_names)

test_data<-cbind (subject=test_subjects,
                  activities=test_activities,
                  test_data)

##creates a dplyr table object from test_data
tbl_test_data<-tbl_df(test_data)


##get dataset from train patients
##1) subjects number
train_subjects<-as.numeric(readLines (zip_files[30]))
##2) activities code and assign their label as factor 
train_activities<-readLines (zip_files[32])
train_activities<-factor (train_activities,levels = activity_labels[,1], 
                          labels = activity_labels[,2])
##3) data from sensors

train_data<-read.table (zip_files[31],colClasses = "numeric",
                        col.names = data_variables_names)

train_data<-cbind (subject=train_subjects,
                   activities=train_activities, 
                   train_data)

##creates a dplyr table from train_data
tbl_train_data<-tbl_df (train_data)

##merge test and train dataset dplyr tables and select columns which contains
##mean and std
##this gives the 1st data set required in the course project
mean_std_dataset<- bind_rows (tbl_test_data,tbl_train_data)%>%
        select (activity_variables_with_mean_and_std)


##the previous dataset is grouped by subject and activities and the function
##dplyr::summarise_each (fun="mean") creates the second data set required in the
##course project

summary_dataset<-group_by(mean_std_dataset, subject, activities)%>%
        summarise_each (funs = "mean")

##The following reset the working directory and erase all objects except 
##the 2 required datasets
setwd (oldwd)

write.table(x = summary_dataset, file = "new_dataset.txt", row.names = FALSE)

rm (list = ls()[-c(which(ls()=="mean_std_dataset"), which (ls()=="summary_dataset"))])
