#!/bin/bash

for j in {0..2}
do
	echo "Paquete $j"
	cat paquetes.txt | sed -n '/0x0000/,/0x0030/ p' | sed -n "$((j*4+1)),$((j*4+4))p" | head -4 > tcp.tcp
	for i in $(cat tcp.tcp | sed 's/^\t0x00..:  //g' | tr 'a-f' 'A-F')
	do
		echo "obase=2; ibase=16; F$i" | bc | cut -c5-
	done | tr -d "\n" | fold -32 |sed "s/\([01]\{8\}\)/\1 /g" | sed -n '6,15p' | cat -n
	echo
done
