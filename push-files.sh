#!/bin/bash

BRANCH="main"
REPO_DIR="$(pwd)"  # Current directory

cd "$REPO_DIR"

# Make sure you're on the correct branch
git checkout "$BRANCH"

# Stage and commit each file individually
find . -type f ! -path "./.git/*" | while read file; do
    # Skip untracked folders like archives, temp, or hidden files (optional filter)
    if [[ "$file" == *.sh ]]; then
        continue  # Skip the script itself
    fi

    git add "$file"
    git commit -m "Add file: $file"

    # Rebase in case remote has new commits
    git pull --rebase origin "$BRANCH"

    # Push the new commit
    git push origin "$BRANCH"
done
