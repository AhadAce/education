#!/bin/bash

# Define variables
REPO_NAME="education"
GITHUB_USER="AhadAce"  # Your GitHub username
GITHUB_REPO_URL="https://github.com/$GITHUB_USER/$REPO_NAME.git"

# Create the main directory and navigate into it
mkdir $REPO_NAME
cd $REPO_NAME

# Initialize a new Git repository
git init

# Create subdirectories
mkdir HTML CSS JavaScript

# Create a README file
touch README.md

# Add all files to staging
git add .

# Commit the changes
git commit -m "Initial commit: Created education folder with HTML, CSS, JavaScript directories and README.md"

# Check the status
git status

# Create the files in respective directories
touch HTML/index.html
touch CSS/style.css
touch JavaScript/example.js

# Add all files to staging
git add .

# Commit the changes
git commit -m "Added index.html, style.css, and example.js"

# Add the remote repository
git remote add origin $GITHUB_REPO_URL

# Push the changes to GitHub
git branch -M main
git push -u origin main

# Add JavaScript function to example.js
echo 'function findMax(arr) {
    return Math.max(...arr);
}

// Example usage
console.log(findMax([1, 3, 7, 2, 5])); // Output: 7' > JavaScript/example.js

# Add the modified file to staging
git add JavaScript/example.js

# Commit the changes
git commit -m "Added findMax function to example.js"

# Push the changes to GitHub
git push
