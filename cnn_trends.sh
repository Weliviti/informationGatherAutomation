curl -s "https://feeds.bbci.co.uk/news/technology/rss.xml" \
| grep -oP '(?<=<title>).*?(?=</title>)' \
| grep -i "AI\|Artificial Intelligence\|ChatGPT"