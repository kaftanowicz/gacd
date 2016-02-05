This codebook is based on the original codebook provided by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Changes begin after the "***" symbols.

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

***

Further transformations required by the Coursera assignment
===========================================================

Then, only the variables carrying information about mean values or standard deviations have been used:

timebodyacceleration_mean_x
timebodyacceleration_mean_y
timebodyacceleration_mean_z
timebodyacceleration_std_x
timebodyacceleration_std_y
timebodyacceleration_std_z
timegravityacceleration_mean_x
timegravityacceleration_mean_y
timegravityacceleration_mean_z
timegravityacceleration_std_x
timegravityacceleration_std_y
timegravityacceleration_std_z
timebodyaccelerationjerk_mean_x
timebodyaccelerationjerk_mean_y
timebodyaccelerationjerk_mean_z
timebodyaccelerationjerk_std_x
timebodyaccelerationjerk_std_y
timebodyaccelerationjerk_std_z
timebodygyro_mean_x
timebodygyro_mean_y
timebodygyro_mean_z
timebodygyro_std_x
timebodygyro_std_y
timebodygyro_std_z
timebodygyrojerk_mean_x
timebodygyrojerk_mean_y
timebodygyrojerk_mean_z
timebodygyrojerk_std_x
timebodygyrojerk_std_y
timebodygyrojerk_std_z
timebodyaccelerationmag_mean
timebodyaccelerationmag_std
timegravityaccelerationmag_mean
timegravityaccelerationmag_std
timebodyaccelerationjerkmag_mean
timebodyaccelerationjerkmag_std
timebodygyromag_mean
timebodygyromag_std
timebodygyrojerkmag_mean
timebodygyrojerkmag_std
frequencybodyacceleration_mean_x
frequencybodyacceleration_mean_y
frequencybodyacceleration_mean_z
frequencybodyacceleration_std_x
frequencybodyacceleration_std_y
frequencybodyacceleration_std_z
frequencybodyacceleration_meanfreq_x
frequencybodyacceleration_meanfreq_y
frequencybodyacceleration_meanfreq_z
frequencybodyaccelerationjerk_mean_x
frequencybodyaccelerationjerk_mean_y
frequencybodyaccelerationjerk_mean_z
frequencybodyaccelerationjerk_std_x
frequencybodyaccelerationjerk_std_y
frequencybodyaccelerationjerk_std_z
frequencybodyaccelerationjerk_meanfreq_x
frequencybodyaccelerationjerk_meanfreq_y
frequencybodyaccelerationjerk_meanfreq_z
frequencybodygyro_mean_x
frequencybodygyro_mean_y
frequencybodygyro_mean_z
frequencybodygyro_std_x
frequencybodygyro_std_y
frequencybodygyro_std_z
frequencybodygyro_meanfreq_x
frequencybodygyro_meanfreq_y
frequencybodygyro_meanfreq_z
frequencybodyaccelerationmag_mean
frequencybodyaccelerationmag_std
frequencybodyaccelerationmag_meanfreq
frequencybodybodyaccelerationjerkmag_mean
frequencybodybodyaccelerationjerkmag_std
frequencybodybodyaccelerationjerkmag_meanfreq
frequencybodybodygyromag_mean
frequencybodybodygyromag_std
frequencybodybodygyromag_meanfreq
frequencybodybodygyrojerkmag_mean
frequencybodybodygyrojerkmag_std
frequencybodybodygyrojerkmag_meanfreq
angletbodyaccelerationmean.gravity
angletbodyaccelerationjerkmean.gravitymean
angletbodygyromean.gravitymean
angletbodygyrojerkmean.gravitymean
anglex.gravitymean
angley.gravitymean
anglez.gravitymean

Finally, a summary data frame has been created which contains the average of each variable from the list specified above  for each activity (activitylabel) and each subject (subjectnumber). It can be found in the tidydataset.txt file.