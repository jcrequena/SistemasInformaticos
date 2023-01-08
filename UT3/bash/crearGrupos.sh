#!/bin/bash
while IFS=, nombre Descripcion  
do
  echo "nombre      -> [${nombre}]"
  echo "Descripcion      -> [${Descripcion}]"
 
done < <(tail -n +2 grupos.csv)
