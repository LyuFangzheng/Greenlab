# Greenlab
Android Lint Projects to perform the experiment and the result of data analysis

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
