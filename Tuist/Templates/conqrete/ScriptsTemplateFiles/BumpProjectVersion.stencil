#!/bin/bash

# Constants
CURRENT_VERSION_PATH=./.current-project-version

# Info
echo "🔹 Running bump-project-version.sh..."
echo ""

# 1 Getting version
echo "1️⃣  Getting current project version..."
export version=$( cat $CURRENT_VERSION_PATH )
echo "✅ Current project version is '$version'"
echo ""

# Bump & Save version
echo "2️⃣  Bumping and saving project version..."
export version=$((version+1))
printf $version > $CURRENT_VERSION_PATH
echo "✅ Bumped & saved project version, so it is '$version' now"
echo ""

# Completed
echo "✅ bump-project-version.sh completed"
