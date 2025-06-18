#!/bin/bash

# Set the branch name
BRANCH="main"  # or "master" if that's your default

# Change to your project directory
cd /path/to/your/project

# Loop through all files (excluding .git folder)
find . -type f ! -path "./.git/*" | while read file; do
    # Add the file
    git add "$file"

    # Commit the file with its path as the message
    git commit -m "Add file: $file"

    # Push to the repository
    git push origin "$BRANCH"
done
