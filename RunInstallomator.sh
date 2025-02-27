#!/bin/bash

InstallomatorPath=$1

# Get a list of labels and run them all in Installomator.
fileItemString=$(cat ./Labels.txt |tr "\n" " ")
labels=($fileItemString)

for label in "${labels[@]}"
do
    $InstallomatorPath/Installomator.sh $label
done