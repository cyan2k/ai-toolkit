#!/bin/bash

# Check if requirements.txt exists in the current directory
if [ ! -f requirements.txt ]; then
    echo "requirements.txt not found!"
    exit 1
fi

# Read each line of requirements.txt and install the package
while IFS= read -r line; do
    # Skip empty lines and comments
    if [[ -n "$line" && ! "$line" =~ ^# ]]; then
        echo "Installing $line..."
        pip install "$line"
    fi
done < requirements.txt

echo "All packages installed."
