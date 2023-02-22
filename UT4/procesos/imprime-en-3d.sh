#!/bin/bash
clear
echo `date +'%A %d de %B del %Y. Hora: %H:%M'`
echo " Creaciones Caminàs"
echo " -----------------"
echo " Comienza la impresión en 3D...."
#Sale del bucle cuando sean las 08:00 de la mañana.
while [ "$hora" != "08:00" ];do
    hora=$(date +"%R")
done
exit 0
