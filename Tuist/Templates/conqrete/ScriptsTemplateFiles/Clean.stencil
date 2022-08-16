#!/bin/bash

# Info
echo "🔹 Running clean.sh..."
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

# 2 Clean Ttuist caches
echo "2️⃣  Cleaning Tuist caches..."
$TUIST clean
echo "✅ Completed cleaning Tuist caches"

# 3 Clean Xcode caches
echo "3️⃣  Cleaninig Xcode workspace, project and caches..."
rm -rf -f ./Derived ./DerivedData ./ConqreteNamespace.xcodeproj ./ConqreteNamespace.xcworkspace
echo "✅ Completed cleaninig Xcode workspace, project and caches"
echo ""

# Completed
echo "✅ clean.sh completed"
