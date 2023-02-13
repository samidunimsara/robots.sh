# ffuf everything


<pre><font color="#26A269"><b>samidu@sudoroot</b></font>:<font color="#12488B"><b>~</b></font>$ cat robot-words.txt
admin
dev
sys
cgi-bin
logs
*.php$
*.txt$
*.gz$

<font color="#26A269"><b>samidu@sudoroot</b></font>:<font color="#12488B"><b>~</b></font>$ ffuf -u $domain/FUZZ -w robot-words.txt -ac -c -mc all

admin             [Status: 403,Size: 0, Words: 1,..]
logs              [Status: 404,Size: 50, Words: 10,..]
cgi-bin           [Status: 301,Size: 0, Words: 1,..]
dev               [Status: 500,Size: 20, Words: 16,..]
sys               [Status: 403,Size: 0, Words: 1,..]



<font color="#26A269"><b>samidu@sudoroot</b></font>:<font color="#12488B"><b>~</b></font>$ ffuf -u $domain/admin/FUZZ  -w robot-words.txt -ac -c -D -e php,gz,txt

 admin/logs.txt     [Status: 200, Size: 117276, Words: 1719,..] $*****BOUNTY
</pre>




