Codebook for Data Transform
===========================

The original dataset contained measure data in disparate files of 30 subjects doing 6 activities.


###The following has been done to the original dataset

1. Joined the Training Data and the Test data

2. Subset the dataset to contain on the Mean and Standard Deviation columns

3. Add the associated Activity field to the dataset

4. Add the associated SubjectID to the dataset

5. Get the average of all the data grouped by SubjectID and Activity

6. Write the resulting dataset to the file tidyavg.txt as a tab delimited text file.

### The Variables

**SubjectID** : The ID of the subject to whom the data belongs

**Activity** : The type of activity done

**Columns 3:64** : The averages of each activty by subjectID of all the measurements taken by the
Samsung devices in mean and standard(std) deviatian.



