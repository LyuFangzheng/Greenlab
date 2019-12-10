# Greenlab

### Android Lint Projects to perform the experiment and the result of data analysis

To replicate the experiment:

1. Replace "*/android-runner-master/ExperimentRunner/Experiment.py" with the file Experiment.py in the repository.
2. Replace "*/android-runner-master/examples/batterystats/config.json" with the file config.json in the repository.(also change the path of .apk files to the corresponding local path.)
3. The .apk files for energy consumption measurement is in the folder "apks" and divided into two folder. (With lints/ Withou lints).
4. Connect the device to the laptop； 
5. Use "cd" to reach the parent folder of android-runner-master and use
"python android-runner-master android-runner-master/examples/batterystats/config.json" to execte the measurement.
6. To inspect the code. Just downloads the zip files in folder "project", and open the unzipped folder in Android Studio. 

PS:
For most of the lint issues (except FloatMath), we wrote the code with or without lint inside a single project, but commented one when inspect the code and generate the .apk files. And for FloatMath, since it requires different gradle version and compileSdkVersion, we wrote the projects seperately.

### The script to preprocess the experiment data & the final preprocessed data is in 'data_preprocessing' folder (Library: pandas )
To use the program: python preprocess.py 'experiment result path' 'extract data path' 'preprocess path' 'output file path'
The final result is in '/data_preprocessing/Merged/result.csv'

### About the Data analysis using R:
In result analysis folder, we contained "test.R" for analyzing the collecting data by R studio. This script included all the used functions seperately. Details about the models that we analyzed in this script have been addressed in the report.
