#!/bin/bash

BRANCH="main"

# Make sure you're on the main branch
git checkout "$BRANCH"

# Loop through .pka files only
find . -type f -name "*.pka" ! -path "./.git/*" | while read file; do
    echo "Processing: $file"

    # Stage the file
    git add "$file"

    # Commit the file (if there's anything new)
    git commit -m "Add file: $file"

    # Pull with rebase to avoid push conflicts
    git pull --rebase origin "$BRANCH"

    # Push to remote
    git push origin "$BRANCH"
done
