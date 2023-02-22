#!/bin/bash
#El script se ejcutará como sudo: sudo exec-scripts-impresora.sh

clear
echo `date +'%A %d de %B del %Y. Hora: %H:%M'`
echo "Creaciones Caminàs"
echo "-----------------"
echo " Se ejecutan los scripts de impresión...."
/bin/bash ./imprime-modo-normal.sh
/bin/bash ./imprime-en-3d.sh

exit 0
