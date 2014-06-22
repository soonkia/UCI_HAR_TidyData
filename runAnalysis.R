## This function does the loading and converting of the 
## initial datasets to tidy datasets.
loadfiles <-function() {
  #Read and merge the test and train data
  x<-read.table("Data/test/X_test.txt",header=FALSE)
  y<-read.table("Data/train/X_train.txt",header=FALSE)
  myData<-rbind(x,y)
  
  #Grab the column names and rename the columns
  features<-read.table("Data/features.txt",header=FALSE)
  names(myData)<-features$V2
  
  #Filter the dataset to only have columns with std() or mean() in the name
  myData<-myData[,grep("std\\(\\)|mean\\(\\)",names(myData))]
  
  #Replace the () in the column names to make the variable more friendly
  names(myData)<-sub("\\(\\)","",names(myData))
  
  #Load the subjects and activities and bind to dataset
  act<-read.table("Data/test/y_test.txt")
  act<-rbind(act,read.table("Data/train/y_train.txt"))
  names(act)[1]<-"Activity"
  
  sub<-read.table("Data/test/subject_test.txt")
  sub<-rbind(sub,read.table("Data/train/subject_train.txt"))
  names(sub)[1]<-"SubjectID"
  myData<-cbind(sub,act,myData)
  
  #replace the activity numbers with labels
  actnames <- read.table("Data/activity_labels.txt")
  myData$Activity<- actnames[match(myData$Activity,actnames[,1]),2]
  
  #return the data
  myData
}

## load the datasets and write them to tidy dataset files 
mainfunc <- function() {
  tidydata<-loadfiles()
  
  #work out the average of all the data by Subject and Activity
  tidyavg<-aggregate(tidydata[,3:length(tidydata)],by=list(tidydata$SubjectID,tidydata$Activity),mean)
  
  #write it to the as tab delimeted files
  
  write.table(tidydata,"Data/tidydata.txt",sep="\t",row.names=FALSE)
  write.table(tidyavg,"Data/tidyavg.txt",sep="\t",row.names=FALSE)
}
