httpx -l urls.txt -paths /robots.txt -silent -o robots-url.txt
for url in $(cat robots-url.txt);do http -b $url | grep 'Disallow' | awk -F ' ' '{print $2}' | cut -c 2- | anew robot-words.txt;done
