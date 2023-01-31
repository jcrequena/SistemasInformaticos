#!/bin/bash
#autor:jcrequena


fntFuncion1() {   

if [ -f $fichUOS ]; then
	while 
	do
 		
	done 
else
     echo "ERROR:"
     return
fi
} 

fntFuncion2() {
#función 2
echo "Funcion 2"
}



#################################
#PROGRAMA PRINCIPAL
################################


#Menu principal
#Cada vez que se selecciona una opción, ejecuta su código y se pone a la
#espera que pulsemos una tecla para volver al menú principal

while [ opcion != "" ]
do
	clear
	echo "****************************"
	echo "**********MENU**************"
	echo "*****************************"
	echo

  echo "1)" "Funcion 1"
  echo "2)" "Funcion 2"
  echo "3)" "Salir"

	read -p "Introduce una opcion: " opcion
	#Comprueba si el valor recogido en opcion es 1,2 o 3, si es otra cosa, se ejecuta *)
   case $opcion in
    	1) 
			  fntFuncion1
			  read -p "Press [Enter] key to continue..."
       	;;
    	2) 
        fntFuncion2
			  read -p "Press [Enter] key to continue..."
        ;;
    	3) 
        echo "Saliendo..."
        exit 1
        ;;
    	*) 
			  echo "Error: Please try again (select 1..2)!"
        read -p "Press [Enter] key to continue..."
		    ;;
   esac
 done
   	
