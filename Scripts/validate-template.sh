#!/bin/bash

# Info
echo "🔹 Running validate-template.sh"

# Search for Tuist
echo ""
echo "🔹 [1/3] Searching for Tuist"
export TUIST=$(which tuist)
if ! command -v $TUIST &> /dev/null; then
    echo "❌ Tuist not found"
    exit 1
else
    echo "✅ Found Tuist at $TUIST"
fi

# List Tuist templates
echo ""
echo "🔹 [2/3] Listing available Tuist templates"
export TUIST_SCAFFOLD_LIST_OUTPUT="$($TUIST scaffold list)"
if [ $? -eq 0 ]; then
    echo "✅ Got 'tuist scaffold list output':"
    echo "$TUIST_SCAFFOLD_LIST_OUTPUT"
else
    echo "❌ Failed to run 'tuist scaffold list'"
    exit 1
fi

# Check if list of templates contains word "conqrete"
echo ""
echo "🔹 [3/3] Checking if tuist scaffold list output contains 'conqrete' template..."
if [[ $TUIST_SCAFFOLD_LIST_OUTPUT == *"conqrete"* ]]; then
    echo "✅ Tuist scaffold list output contains 'conqrete' template"
else
    echo "❌ Tuist scaffold list output does not contain 'conqrete' template"
    exit 1
fi
echo ""

# Completed
echo ""
echo "✅ validate-template.sh completed"
