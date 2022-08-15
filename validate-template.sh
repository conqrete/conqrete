#!/bin/bash

# Info
echo "🔹 Running validate-template.sh..."
echo ""

# 1 Searching Tuist
echo "1️⃣  Searching for Tuist..."
TUIST=$(which tuist)
if ! TUIST &> /dev/null; then
    echo "❌ Tuist not found"
    exit 1
else
    echo "✅ Found Tuist at $TUIST"
fi
echo ""

# 2 Tuist scaffold list
echo "2️⃣  Running 'tuist scaffold list'..."
TUIST_SCAFFOLD_LIST_OUTPUT=$($TUIST scaffold list)
if [ $? -eq 0 ]; then
    echo "✅ Got 'tuist scaffold list output':"
    echo "$TUIST_SCAFFOLD_LIST_OUTPUT"
else
    echo "❌ Failed to run 'tuist scaffold list'"
    exit 1
fi
echo ""

# 3 Check if conqrete template is present
echo "3️⃣  Checking if tuist scaffold list output contains 'conqrete' template..."
if [[ $TUIST_SCAFFOLD_LIST_OUTPUT == *"conqrete"* ]]; then
    echo "✅ Tuist scaffold list output contains 'conqrete' template"
else
    echo "❌ Tuist scaffold list output does not contain 'conqrete' template"
    exit 1
fi
echo ""

# Completed
echo "✅ validate-template.sh completed"
