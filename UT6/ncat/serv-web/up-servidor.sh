#!/bin/bash
#Usamos el puerto 1200 para poner a la escucha el servidor
while true; do ncat -v -l -p 12000 -c ./servidor-web.sh; done
