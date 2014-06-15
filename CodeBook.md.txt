## Variables description

The variables (columns) in this database come from the accelerometer and gyroscope 3-axial raw signals timeAcc\_XYZ and timeGyro\_XYZ. These time domain signals (prefix _time_ to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcc\_XYZ and timeGravityAcc\_XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freqBodyAcc\_XYZ, freqBodyAccJerk\_XYZ, freqBodyGyro\_XYZ, freqBodyAccJerkMag, freqBodyGyroMag, fBodyGyroJerkMag. (Note the _freq_ to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'\_XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* timeBodyAcc\_XYZ
* timeGravityAcc\_XYZ
* timeBodyAccJerk\_XYZ
* timeBodyGyro\_XYZ
* timeBodyGyroJerk\_XYZ
* timeBodyAccMag
* timeGravityAccMag
* timeBodyAccJerkMag
* timeBodyGyroMag
* timeBodyGyroJerkMag
* timeBodyAcc-XYZ
* timeBodyAccJerk-XYZ
* timeBodyGyro-XYZ
* timeBodyAccMag
* timeBodyAccJerkMag
* timeBodyGyroMag
* timeBodyGyroJerkMag

Of these signals, it was estimated: 

* mean: Mean value
* std: Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* timeBodyAccMean
* timeBodyAccJerkMean
* timeBodyGyroMean
* timeBodyGyroJerkMean

Moreover, the average of all the variables in the "meanStdData" data frame for each activity (STANDING, WALKING, etc) and each subject was taken and stored into the "tidy" data frame and "TidyData.txt" file.

