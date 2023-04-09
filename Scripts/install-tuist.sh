#!/bin/bash

# Constants
PROJECT_DIRECTORY=$(pwd)
TEMP_TUIST_DIRECTORY="$PROJECT_DIRECTORY/.tmp-tuist/"

# Info
echo "🔹 Running install-tuist.sh"

# Create temp directory & open it
mkdir -p $TEMP_TUIST_DIRECTORY
cd $TEMP_TUIST_DIRECTORY

# Clone Tuist repo
echo ""
echo "🔹 Cloning tuist to $TEMP_TUIST_DIRECTORY"

git clone https://github.com/tuist/tuist.git

# Run Tuist install script
echo ""
echo "🔹 Installing tuist"

sh ./tuist/script/install

# Go back to project direcotry & delete temp dir
echo ""
echo "🔹 Deleting temp directory"

cd $PROJECT_DIRECTORY
rm -rf $TEMP_TUIST_DIRECTORY

# Done
echo ""
echo "✅ install-tuist.sh completed"