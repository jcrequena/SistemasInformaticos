#!/bin/bash
I=0

while read RAWINPUT; do
        if [ ${#RAWINPUT} -le 1 ]
        then
                break
        fi
        INPUT[$I]=$RAWINPUT
        I=$(($I+1))
done

read -a FIRSTLINE <<< ${INPUT[0]}
METHOD=${FIRSTLINE[0]}
REQUEST=${FIRSTLINE[1]}
HTTPVER=${FIRSTLINE[2]}

#echo $HTTPVER 503 Service Unavailable
#echo "Retry-After: 3600"
#echo "Server: Bash-Maintenance"
echo $HTTPVER $METHOD
echo $REQUEST 


case "$REQUEST" in
        "/")
                FILE="daw1-hello.html"
		echo "HTTP/1.1 200 OK"
                echo "Content-Type: text/html; charset=utf-8"
                echo "Content-Length: "$(stat -c%s "$FILE")
                echo
                cat `pwd`/$FILE
        ;;
		
esac
