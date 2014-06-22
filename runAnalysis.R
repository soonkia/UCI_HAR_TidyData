## Check if data exits
checkfiles <- function () {
  if (!(file.exists("Data//UCI HAR Dataset//train/X_train.txt") )) {
    print("Data not found - downloading")
    ## The base files don't exist, redownload the dataset and unzip it
    fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileurl,destfile="UCIData.zip")
    unzip(zipfile="UCIData.zip",exdir="Data/.")
  }
  
}


## This function does the loading and converting of the 
## initial datasets to tidy datasets.
loadfiles <-function() {
  
  #Read and merge the test and train data
  x<-read.table("Data/UCI HAR Dataset/test/X_test.txt",header=FALSE)
  y<-read.table("Data/UCI HAR Dataset/train/X_train.txt",header=FALSE)
  myData<-rbind(x,y)
  
  #Grab the column names and rename the columns
  features<-read.table("Data/UCI HAR Dataset/features.txt",header=FALSE)
  names(myData)<-features$V2
  
  #Filter the dataset to only have columns with std() or mean() in the name
  myData<-myData[,grep("std\\(\\)|mean\\(\\)",names(myData))]
  
  #Replace the () in the column names to make the variable more friendly
  names(myData)<-sub("\\(\\)","",names(myData))
  
  #Load the subjects and activities and bind to dataset
  act<-read.table("Data/UCI HAR Dataset/test/y_test.txt")
  act<-rbind(act,read.table("Data/UCI HAR Dataset/train/y_train.txt"))
  names(act)[1]<-"Activity"
  
  sub<-read.table("Data/UCI HAR Dataset/test/subject_test.txt")
  sub<-rbind(sub,read.table("Data/UCI HAR Dataset/train/subject_train.txt"))
  names(sub)[1]<-"SubjectID"
  myData<-cbind(sub,act,myData)
  
  #replace the activity numbers with labels
  actnames <- read.table("Data/UCI HAR Dataset/activity_labels.txt")
  myData$Activity<- actnames[match(myData$Activity,actnames[,1]),2]
  
  #return the data
  myData
}

## load the datasets and write them to tidy dataset files 
mainfunc <- function() {
  checkfiles()
  tidydata<-loadfiles()
  
  #work out the average of all the data by Subject and Activity
  tidyavg<-aggregate(tidydata[,3:length(tidydata)],by=list(tidydata$SubjectID,tidydata$Activity),mean)
  names(tidyavg)[1]<-"SubjectID"
  names(tidyavg)[2]<-"Activity"
  #write it to the as tab delimeted files
  
  write.table(tidyavg,"Data/tidyavg.txt",sep="\t",row.names=FALSE)
}
