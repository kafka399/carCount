##Description

The goal of this project is to estime number of car in the city by utilising machine learning technique. It uses images from public surveillence cameras as an input, learns to identify the cars and counts the number of cars in a given image.

##How to use it

img/collect.sh script stores images from surveillence cameras. I use crontab to call this script every minute.

test directory is used to train algorithm to recognize the cars. First of all, copy a set of images from img directory into test directory and run a script test/slide.sh This script will select all jpg images in test directory, it will create test/out directory, where it will save converted jpg images. In the next step, the script will select image by image from test/out directory and it will slice into 100x100 images each. 
Once you have test/out/slide populated, then you need manually select all images with a car in a given directory(test/out/slide) and copy it to test/pos and the rest of images to test/neg.
Now the data is ready for training. 

To have cross validation data, copy unseen images from img directory to crossval directory and run crossval/slide.sh script. 

Now you are ready to run carRecognition.R script

##Contact
If you have problems or questions - please contact me at twitter [@dzidorius](twitter.com/dzidorius) or by [mail](https://github.com/kafka399)
