fntCrearUsuarios() {   

# read c1,c2 lee las columnas que le indicamos, c1 y c2 pueden tener otro valor, ejemplo: campo1,campo2, c1,c2, etc..
#Para acceder a las columnas se hace: ${columna}
	while IFS=, read c1,c2 
	do
   		echo "Columna 1 "${c1}
   		echo "Columna 2 "${c2}
	done < $File_Users_csv #aquí se pone el fichero csv que se quiere recorrer en el bucle
	return
} 


File_Users_csv=/home/root/usuarios.csv

if [ -f $File_Users_csv ]; then
  fnt_CrearUsuarios
else
  
  echo "Error"
fi
