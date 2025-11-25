#!/bin/bash

# Create a timestamp
timestamp=$(date +%F_%H-%M-%S)

# Create a folder on Windows Desktop for Tech News
folder="/mnt/c/Users/USER/Desktop/TECH-NEWS/$timestamp"
mkdir -p "$folder"

# Fetch TechCrunch headlines
curl -s "https://techcrunch.com/feed/" \
| grep -oP '(?<=<title>).*?(?=</title>)' \
| tail -n +2 \
| sed 's/<!\[CDATA\[//; s/\]\]>//' \
> "$folder/techcrunch_headlines.txt"

echo "TechCrunch news saved to $folder"
