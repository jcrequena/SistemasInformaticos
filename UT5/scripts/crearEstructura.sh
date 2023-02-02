#!/bin/bash

directorio=./Actividad1

if [[ ! -d "$directorio" ]]; 
then
  mkdir $directorio
else
  echo "El directorio $directorio ya existe"
fi

#Crear ficheros de alumn@s,notas y listado
for iAnyo in `seq 2006 2015`
do
        touch "$directorio/alumn@s"$iAnyo".dat"
        touch "$directorio/notas"$iAnyo".dat"
        touch "$directorio/listado"$iAnyo".dat"
done
exit
