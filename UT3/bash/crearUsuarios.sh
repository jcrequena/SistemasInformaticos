#!/bin/bash
while IFS=, read cuenta password descripcion nombre_apellidos grupo_departamento  
do
  echo "cuenta      -> [${cuenta}]"
  echo "password      -> [${password}]"
  echo "descripcion      -> [${descripcion}]"
  echo "nombre_apellidos      -> [${nombre_apellidos}]"
  echo "grupo_departamento      -> [${grupo_departamento}]"
 
done < <(tail -n +2 usuarios.csv)
