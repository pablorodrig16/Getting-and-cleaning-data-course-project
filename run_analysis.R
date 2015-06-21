##This script creates 2 data.table datasets with tidy data from UCI HAR Dataset
##required in the course project from Getting and cleaning data course


require (dplyr)
require (tidyr)

##get data from url and save it in ./Data directory
##curl library is loaded for allowing https handling with curl_download function
##Download data.zip in ./Data directory

if (!file.exists ("data.zip")){
        require (curl)
        url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
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
variables_with_mean<-grep(pattern = "mean()",
                                   fixed = TRUE,
                                   x = data_variables_names)
variables_with_std<-grep(pattern = "std()",
                                  fixed = TRUE,
                                  x = data_variables_names)
variables_with_mean_and_std<-sort(c(variables_with_mean,
                                             variables_with_std))

##creates variables_labels to improve description: first labels are 
##subset from variables_with_mean_and_std, then I split the labels and select
##the descriptive elements of them. Then I correct an error in some of the last 
##variables names  (BobyBody), and finally I replace the text with more descriptive
##names.

variables_labels<-data_variables_names[variables_with_mean_and_std]

variables_labels<-strsplit (x = variables_labels,split = " ")

variables_labels<-sapply (X = variables_labels,
                                    FUN = function (x) x[2])

variables_labels<-gsub ("BodyBody",replacement = "Body",
                                  x = variables_labels)
variables_labels<-gsub ("tBody",replacement = "timeBodyLinear",
                                  x = variables_labels)
variables_labels<-gsub ("tGravity",replacement = "timeGravity",
                                  x = variables_labels)
variables_labels<-gsub ("fBody",replacement = "frequencyBodyLinear",
                                  x = variables_labels)
variables_labels<-gsub ("Acc",replacement = "Acceleration",
                                  x = variables_labels)
variables_labels<-gsub ("Gyro",replacement = "AngularVelocity",
                                  x = variables_labels)
variables_labels<-gsub ("Mag",replacement = "Magnitude",
                                  x = variables_labels)
variables_labels<-gsub ("-",replacement = "_",
                                  x = variables_labels)
variables_labels<-gsub ("\\()",replacement = "",
                                  x = variables_labels)


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

##creates a dplyr table object from test_data and select columns which contains
##mean() and std()

tbl_test_data<-tbl_df(test_data)%>%
        select (variables_with_mean_and_std)

##changes variables names to improve legibility
names (tbl_test_data)<-variables_labels

##binds subjects and activity columns
tbl_test_data<-mutate (tbl_test_data,
                       subject=test_subjects, 
                       activities=test_activities)

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

##creates a dplyr table object from train_data and select columns which contains
##mean and std 

tbl_train_data<-tbl_df(train_data)%>%
        select (variables_with_mean_and_std)

##binds subjects and activity columns
names (tbl_train_data)<-variables_labels

##binds subjects and activity columns
tbl_train_data<-mutate (tbl_train_data,
                       subject=train_subjects, 
                       activities=train_activities)


##merge test and train dataset dplyr tables
##this gives the 1st data set required in the course project 
mean_std_dataset<- bind_rows (tbl_test_data,tbl_train_data)


##the previous dataset is grouped by subject and activities and the functions
##dplyr::summarise_each (fun="mean") and gather from tidyr packages
##create the second data set required in the
##course project

summary_dataset<-group_by(mean_std_dataset, subject, activities)%>%
        summarise_each (funs = "mean")


summary_dataset<-gather (data = summary_dataset,
                         key = measurement,
                         value = mean,
                         -(subject:activities))

##Erase all objects except 
##the required dataset

rm (list = ls()[-which (ls()=="summary_dataset")])

##save the 2nd table in 'new_dataset.txt' in the working directory
write.table(x = summary_dataset, sep = "\t", 
            file = "summary_dataset.txt", 
            row.names = FALSE)
