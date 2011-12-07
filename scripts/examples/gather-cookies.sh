#!/bin/sh
# gather-cookies.sh

while [ 1 ]
do 
echo -e "GET /drm/ HTTP/1.0\n\n" |  \
nc -vv $1 80 | \
#grep ASPSESSIONID
grep JSESSIONID
done
