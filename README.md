UCI_HAR_TidyData
================

This project converts the Human Activity Recognition Using Smartphones Data Set to a tidy dateset where we just pull the averages.

###Dependancies

We make use of the R programming languange to do the transform, and you will require to load the code and run from R. No additional R libraries are required.


###Original Dataset
For more information on the original dataset visit:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The Data can be Downloaded from 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Unzip this into the Data directory before running the code.

###Files included

**codebook.md** : Describes the transformation on the original dataset, and a description of the
variable

**runAnalysis.R** : R file that does the transform on the dataset

###Running the code

1. The Dataset gets downloaded and unzipped to the Data folder.
2. Load the runAnlysis.R file - ensuring that your working directory is set to the location of
where runAnalyis.R is located
3. Run the mainfunc() function in R
4. The resulting dataset will be written to Data/tidyavg.txt as a Tab (\t) delimited file



