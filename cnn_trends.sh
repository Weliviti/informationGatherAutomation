#!/bin/bash

# Get current timestamp (YYYY-MM-DD_HH-MM-SS)
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Main folder for BBC news
BASE_FOLDER="/mnt/c/Users/USER/Desktop/BBC-NEWS"

# Create the main folder if it doesn't exist
mkdir -p "$BASE_FOLDER"

# Create a new timestamped subfolder
FOLDER="$BASE_FOLDER/$TIMESTAMP"
mkdir -p "$FOLDER"

# Fetch BBC news headlines
/usr/bin/curl -s "https://feeds.bbci.co.uk/news/rss.xml" \
| /usr/bin/grep -oP '(?<=<title>).*?(?=</title>)' \
| /usr/bin/tail -n +2 \
| /usr/bin/sed 's/<!\[CDATA\[//; s/\]\]>//' \
> "$FOLDER/bbc_news.txt"

echo "BBC news saved to $FOLDER"
