#!/bin/bash

MyPath=$1
InstallomatorPath=$2

# Get a list of labels and run them all in Installomator.
fileItemString=$(cat "$MyPath/Labels.txt" | tr "\n" " ")
labels=($fileItemString)

for label in "${labels[@]}"
do
    # Only run if label doesn't start with #
    if [[ ! $label =~ ^# ]]; then
        "$InstallomatorPath/Installomator.sh" "$label" NOTIFY=success DEBUG=0
    fi
done
