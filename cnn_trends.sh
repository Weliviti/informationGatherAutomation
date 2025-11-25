curl -s "https://feeds.bbci.co.uk/news/rss.xml" \
| grep -oP '(?<=<title>).*?(?=</title>)' \
| tail -n +2 \
| sed 's/<!\[CDATA\[//; s/\]\]>//' \
> /mnt/c/Users/USER/Desktop/bbc_news.txt

echo "BBC news saved to Windows Desktop!"