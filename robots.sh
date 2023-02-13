#!/usr/bin/bash

echo "Root domain name please :(" 
read domain
subfinder -d $domain -all -silent -o urls.txt
httpx -l urls.txt -path /robots.txt -silent -o robots-url.txt
for url in $(cat robots-url.txt);do http -b $url | grep 'Disallow' | awk -F ' ' '{print $2}' | cut -c 2- | anew robot-words.txt;done
