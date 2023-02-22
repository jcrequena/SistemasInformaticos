  GNU nano 2.9.3             exec-scripts-impresora.sh                          

#!/bin/bash
#El script se ejcutará como sudo: sudo exec-scripts-impresora.sh

clear
echo `date +'%A %d de %B del %Y. Hora: %H:%M'`
echo "Creaciones Caminàs"
echo "-----------------"
echo " Se ejecutan los scripts de impresión...."
echo " Ejecución de impresión en modo normal...."
./imprime-modo-normal.sh &
echo " Ejecución de impresión en modo 3d...."
./imprime-en-3d.sh &

exit 0
