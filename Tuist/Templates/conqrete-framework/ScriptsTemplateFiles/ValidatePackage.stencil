#!/bin/bash

# Info
echo "🔹 Running validate-package.sh..."
echo ""

# 1 Searching Tuist
echo "  Searching for Swift..."
export SWIFT=$(which swift)
if ! command -v $SWIFT &> /dev/null; then
    echo "❌ Swift not found"
    exit 1
else
    echo "✅ Found Swift at $SWIFT"
fi
echo ""

# 2 Dump package as json
echo "2️⃣  Dumping Package.swift..."
$SWIFT package dump-package
if [ $? -eq 0 ]; then
    echo "✅ Got Package.swift's valid dump"
else
    echo "❌ Failed to dump Package.swift - it is invalid"
    exit 1
fi
echo ""

# Completed
echo "✅ validate-package.sh completed"
