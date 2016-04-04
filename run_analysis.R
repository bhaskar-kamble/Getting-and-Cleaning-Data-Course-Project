###############################################################
#                                                             #
#      G E T T I N G   A N D   C L E A N I N G   D A T A      #
#                                                             #
#         Data Science Specialization series, Coursera        #
#                                                             #
#                 C O U R S E   P R O J E C T                 #
#                                                             #
#                        solution by                          #
#                                                             #
#                B H A S K A R   K A M B L E                  #
#                                                             #
###############################################################


run_analysis_v2 <- function() {

library(dplyr)

###############################################################################
# Step 1                                                                      #
# Combine the training and test sets to create one data set                   #
###############################################################################
#                                                                             #
# Read the data sets                                                          #
X_train <- read.table("train/X_train.txt")                                    #
y_train <- read.table("train/y_train.txt")                                    #
subject_train <- read.table("train/subject_train.txt")                        #
#                                                                             #
X_test <- read.table("test/X_test.txt")                                       #
y_test <- read.table("test/y_test.txt")                                       #
subject_test <- read.table("test/subject_test.txt")                           #
#                                                                             #
# combine X_train and X_test                                                  #
X_all <- rbind(X_train, X_test)                                               #
#                                                                             #
# combine y_train and y_test                                                  #
y_all <- rbind(y_train, y_test)                                               #
#                                                                             #
# combine subject_train and subject_test                                      #
subject_all <- rbind(subject_train, subject_test)                             #
###############################################################################



###############################################################################
# Step 2                                                                      #
# Extract only the measurements on the mean and standard deviation for each   #
# measurement                                                                 #
###############################################################################
#                                                                             #
features <- read.table("features.txt")                                        #
#                                                                             #
# search all columns whose names contain -mean() or -std()                    #
mean_or_std <- grep("-(mean|std)\\(\\)", features[,2])                        #
#                                                                             #
# subset the desired columns                                                  #
X_all <- X_all[,mean_or_std]                                                  #
#                                                                             #
# assign the correct names                                                    #
names(X_all) <- features[mean_or_std,2]                                       #
###############################################################################



###############################################################################
# Step 3                                                                      #
# Use descriptive activity names to name the activities in the data set       #
###############################################################################
# Read the numbers and corresponding activity labels:                         #
activities <- read.table("activity_labels.txt")                               #
#                                                                             #
# Replace numbers with correct activity names                                 #
y_all[,1] <- activities[y_all[,1], 2]                                         #
#                                                                             #
# Assign the correct column name                                              #
names(y_all) <- "activity"                                                    #
###############################################################################


###############################################################################
# Step 4                                                                      #
# Appropriately label the data set with descriptive variable names            #
###############################################################################
# Assign column-name to subject data                                          #
# (The variable names to X_all have already been assigned in step 2)          #
names(subject_all) <- "subject" # subject data                                #
#                                                                             #
# Collect X_all, y_all and subject_all into a single data set:                #
all_data <- cbind(X_all,y_all,subject_all)                                    #
###############################################################################


###############################################################################
# Step 5                                                                      #
# Create a second, independent tidy data set with the average of each variable#
# for each subject and each activity                                          #
###############################################################################
by_subj_act <- group_by(all_data,subject,activity)                            #
data_mean <- summarize_each(by_subj_act,funs(mean))                           #
#                                                                             #
write.table(data_mean, "data_mean.txt", row.name=FALSE)                       #
###############################################################################
}
