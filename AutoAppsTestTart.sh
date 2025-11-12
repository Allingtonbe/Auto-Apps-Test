#!/bin/zsh

if [ -z "$1" ]; then
    printf "Installomator label: "
    read label
else
    label="$1"
fi

# brew install cirruslabs/cli/tart
# tart clone ghcr.io/cirruslabs/macos-tahoe-base:latest tahoe-base

echo "Starting installomator guest"
tart clone tahoe-base installomator
tart run installomator --no-graphics &

echo "Waiting for installomator guest to be ready"
until tart exec installomator echo "Guest is ready"; do
    sleep 2
done

echo "Cloning repositories"
tart exec installomator git clone https://github.com/Allingtonbe/Installomator.git -b Allington-Release
tart exec installomator git clone https://github.com/Allingtonbe/Auto-Apps-Test.git

echo "Running Installomator with label: $label"
tart exec installomator sudo ./Installomator/Installomator.sh $label DEBUG=0

echo "Running AutoAppsTest with label: $label"
tart exec installomator ./Auto-Apps-Test/AutoAppsTest.sh $label

echo "Stopping and deleting installomator guest"
tart stop installomator
sleep 1
tart delete installomator
