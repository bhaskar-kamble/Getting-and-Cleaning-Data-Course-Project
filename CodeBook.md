# Introduction

The `run_analysis.R` performs the 5 steps of the assignment in the following 5 steps.

* In step 1, the test and train sets are combined using the `rbind()` function.
* In step 2, only the measurements on the mean and standard deviation for each measurement are extracted. The features are then given the correct names from `features.txt`.
* In step 3, the activity labels are correctly assigned based on the activity names and IDs given in `activity_labels.txt`.
* In step 4, the remaining column names are correctly assigned, and the columns for variables, activity and subject are collected into a singe data set using the `cbind()` function.
* In step 5, the final step, a new data set with all the average measures for each subject and activity is created using the `dplyr` package. Since there are 30 subjects and 6 activities, a total of 30*6 = 180 rows are present in this data set. This data set is saved as `data_mean.txt` and is included in this repository and was also uploaded during the submission process.

# Variables used in `run_analysis.R`

* `X_train`, `y_train`, `X_test`, `y_test`, `subject_train` and `subject_test` contain the data downloaded from the repository.
* `X_all`, `y_all` and `subject_all` are the datasets obtained by combining the test and train sets.
* `features` is obtained from `features.txt` and contains the correct names for the variables in the `X_all` dataset.
* `mean_or_std` returns the columns of `X_all` which measure either a mean or a standard deviation.
* `activities` contains the correct activity names obtained from `activity_labels.txt`.
* `all_data` combines `X_all`, `y_all` and `subject_all` into a single big dataset.
* `data_mean` contains the relevant averages grouped by both activity and subject. This file is stored in a `.txt` file and is included in this repository and was uploaded during the submission process. The `group_by()` followed by `summarize_each()` functions from the `dplyr` package were used to facilitate the calcuation.

