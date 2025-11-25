#!/bin/bash

# Timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Main folder for Reddit news
BASE_FOLDER="/mnt/c/Users/USER/Desktop/REDDIT-NEWS"

# Create main folder if it doesn't exist
mkdir -p "$BASE_FOLDER"

# Create timestamped subfolder
FOLDER="$BASE_FOLDER/$TIMESTAMP"
mkdir -p "$FOLDER"

# Fetch Reddit posts from r/technology
/usr/bin/curl -s "https://www.reddit.com/r/technology/.rss" \
| /usr/bin/grep -oP '(?<=<title>).*?(?=</title>)' \
| tail -n +2 \
| /usr/bin/sed 's/<!\[CDATA\[//; s/\]\]>//' \
> "$FOLDER/reddit_technology.txt"

echo "Reddit technology news saved to $FOLDER"
