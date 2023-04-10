#!/bin/bash

# Info
echo "🔹 Running validate-templates.sh"

# Search for Tuist
echo ""
echo "🔹 [1/4] Searching for Tuist"

export TUIST=$(which tuist)
if ! command -v $TUIST &> /dev/null; then
    echo "❌ Tuist not found"
    exit 1
else
    echo "✅ Found Tuist at $TUIST"
fi

# List Tuist templates
echo ""
echo "🔹 [2/4] Listing available Tuist templates"

export TUIST_SCAFFOLD_LIST_OUTPUT="$($TUIST scaffold list)"

# Check if 'conqrete-framework' template is there
echo ""
echo "🔹 [3/4] Checking if 'conqrete-framework' template is present"

if [[ $TUIST_SCAFFOLD_LIST_OUTPUT == *"conqrete-framework"* ]]; then
    echo "✅ 'conqrete-framework' template is present"
else
    echo "❌ Tuist scaffold list output does not contain 'conqrete-framework' template"
    echo "'tuist scaffold list output': $TUIST_SCAFFOLD_LIST_OUTPUT"
    exit 1
fi

# Check if 'conqrete-app' template is there
echo ""
echo "🔹 [4/4] Checking if 'conqrete-app' template is present"
if [[ $TUIST_SCAFFOLD_LIST_OUTPUT == *"conqrete-app"* ]]; then
    echo "✅ 'conqrete-app' template is present"
else
    echo "❌ Tuist scaffold list output does not contain 'conqrete-app' template"
    echo "$TUIST_SCAFFOLD_LIST_OUTPUT"
    echo "'tuist scaffold list output': $TUIST_SCAFFOLD_LIST_OUTPUT"
    exit 1
fi

# Completed
echo ""
echo "✅ validate-templates.sh completed"
