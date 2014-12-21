gacd_project
============

Getting and Cleaning Data Course Project

This R script assumes that the "UCI HAR Dataset" folder and all of its sub-folders are
intact within the working home directory.

The pseudocode for the run_analysis.R program is as follows:

- Read in the features file data.
- Create logical vectors that identify column names with "mean" or "std" in them. This is
to aid the file reading process later.
- test.