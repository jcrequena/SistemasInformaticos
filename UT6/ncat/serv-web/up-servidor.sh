#!/bin/bash
#Usamos el puerto 12000 para poner a la escucha el servidor
while true; do ncat -v -l -p 12000 -c ./serv-web.sh; done
