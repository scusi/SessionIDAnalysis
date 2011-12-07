#!/bin/sh
# gather-cookies-ssl.sh

while [ 1 ];
do
echo -e "GET / HTTP/1.0\n\n" | \
openssl s_client -quiet -no_tls1 -connect $1:443 2>/dev/null | \
grep JSESSIONID
done
