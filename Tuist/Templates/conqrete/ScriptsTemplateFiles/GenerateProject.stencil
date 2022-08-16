#!/bin/bash

# Info
echo "🔹 Running generate-project.sh..."
echo ""

# 1 Searching Tuist
echo "1️⃣  Searching for Tuist..."
export TUIST=$(which tuist)
if ! command -v $TUIST &> /dev/null; then
    echo "❌ Tuist not found"
    exit 1
else
    echo "✅ Found Tuist at $TUIST"
fi
echo ""

# 2 Fetch Dependencies
export PROJECT_DIR=.

echo "2️⃣  Fetching dependencies..."
$TUIST fetch -p $PROJECT_DIR
echo "✅ Fetching dependencies completed"
echo ""

# Get Project Version
echo "3️⃣  Getting current project version..."
export CURRENT_PROJECT_VERSION=$(cat ./.current-project-version)
echo "✅ Current project version is $CURRENT_PROJECT_VERSION"
echo ""

# 4 Generate Project
echo "4️⃣  Generating Xcode project and workspace..."
export TUIST_PROJECT_VERSION=$CURRENT_PROJECT_VERSION $TUIST generate -p $PROJECT_DIR --no-open
echo "✅ Generating Xcode project and workspace completed"
echo ""

# Completed
echo "✅ generate-project.sh completed"
