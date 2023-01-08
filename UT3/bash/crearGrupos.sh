#!/bin/bash
while IFS=, read nombre Descripcion  
do
  echo "nombre      -> [${nombre}]"
  echo "Descripcion      -> [${Descripcion}]"
 
done < <(tail -n +2 grupos.csv)
