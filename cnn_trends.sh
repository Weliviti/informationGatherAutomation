#!/bin/bash

# Get current timestamp (YYYY-MM-DD_HH-MM-SS)
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Base folder (main folder where all BBC news runs are stored)
BASE_FOLDER="/mnt/c/Users/USER/Desktop/BBC-NEWS"

# Create the main folder if it doesn't exist
mkdir -p "$BASE_FOLDER"

# Create a new timestamped subfolder inside BBC-NEWS
FOLDER="$BASE_FOLDER/$TIMESTAMP"
mkdir -p "$FOLDER"

# Fetch BBC news and save inside the new folder
curl -s "https://feeds.bbci.co.uk/news/rss.xml" \
| grep -oP '(?<=<title>).*?(?=</title>)' \
| tail -n +2 \
| sed 's/<!\[CDATA\[//; s/\]\]>//' \
> "$FOLDER/bbc_news.txt"

echo "BBC news saved to $FOLDER"
