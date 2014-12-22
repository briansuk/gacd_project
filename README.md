gacd_project
============

Getting and Cleaning Data Course Project

This R script assumes that the "UCI HAR Dataset" folder and all of its sub-folders are
intact within the working home directory.

The pseudocode for the run_analysis.R program is as follows:

- Read in the features file data.
- Create logical vectors that identify column names with "mean" or "std" in them. This is
to aid the file reading process later.
- Read in the activity label data.
- Read in the subject ID data
- Read the y* files, and replace the ID numbers for activities with the actual string
literals so it can be understood easily.
- Read in the X* files, but use the logical vectors from earlier to narrow down the
number of columns being read in.
- Merge in the subjectID and activity data into the X* files.
- Create a master dataframe that merges the two X* files.
- Aggregate the data columns by ID and activity.
- Write and view the data.
