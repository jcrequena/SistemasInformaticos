#!/bin/bash
> tcp.tcp
while read l
do
    if [[ $(echo $l | cut -d" " -f1) == '0x0000:' ]]
    then
        bits=$(BC_LINE_LENGTH=0 bc <<< "ibase=16;obase=2;F$bytes" | cut -c5-)
        bytes=""
           echo $bits | fold -32 | sed -r "s/([01]{8})/\1 /g" | sed -n '6,$p' >> tcp.tcp
                echo '' >> tcp.tcp
    fi
    bytes=$bytes$(echo $l | cut -d" " -f2- | tr -d " " | tr "a-f" "A-F")
done <<< "$(cat paquetes.txt | grep '0x' | tr -d "\t" | tr -s " ")$(echo -e "\n0x0000:")"
