#!/bin/bash

#@jcrequena:  Script "Trabajos de impresión"
#@jcrequena: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#@jcrequena: Objetivo: Enviar trabajos de impresión 3D.
#@jcrequena: By:
#@jcrequena: 	
#@jcrequena: Curso:
#@jcrequena: 	1º DAM
#@jcrequena: Versión:
#@jcrequena: 	1.0
#@jcrequena: Script probado y testeado en

#@jcrequena: ---------------------------------------------------------------
#@jcrequena:  Funciones
#@jcrequena: ---------------------------------------------------------------

#@jcrequena: Función fn_fn_ConsultarProcesos(): Consultar los PID y prioridad de los procesos
fn_ConsultarProcesos() {
	echo "Consultar los procesos de impresión: PID y prioridades "
	echo "------------------------------"
	echo ""
}

#@jcrequena: Función fn_Cambiar_Prioridades(): Cambia la prioridad de los procesos
fn_Cambiar_Prioridades() {
	echo "Cambio de prioridades de los procesos de impresión: "
	echo "------------------------------"
	echo ""
	echo "Operación en curso..."
	
	#Ejemplo de if para consultar el valor de una variable de tipo texto
  #ejemplo="dato"
  if [[ $dato = "10" ]]; then
		
	fi
}
#@jcrequena: Función fn_EliminarProcesos(): Elimina los procesos de impresión
fn_EliminarProcesos() {
	echo "Eliminar los procesos de impresión: "
	echo "------------------------------"
	echo ""
	echo "Operación en curso..."

}


#@jcrequena: ---------------------------------------------------------------
#@jcrequena:  Menú principal
#@jcrequena: ---------------------------------------------------------------

while :
do
  clear
  echo ""
  echo ""
  echo "************************************************"
  echo "*           Trabajos de impresión 3D           *"
  echo "************************************************"
  echo ""
  echo "Selecciona la opción deseada"
  echo "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _"
  echo ""
  echo "1) Consultar procesos de impresión"
  echo "2) Cambiar prioridades de los procesos"
  echo "3) Eliminar procesos de impresión"
  echo "4) Salir"
  echo "_________________________________________"
  echo ""
  read -p "Selecciona la opción a realizar [1-4]: " opcion
	case $opcion in
    	1) #@jcrequena: 'Consultar procesos de impresión.
			clear
			fn_ConsultarProcesos
			read -p "Presione [Enter] para volver al menu" varNull
      ;;
      2) #@jcrequena: 'Cambio de prioridades' seleccionado.
			clear			
			fn_Cambiar_Prioridades_N5		
			read -p "Presione [Enter] para volver al menu" varNull
			;;
      3) #@jcrequena: 'Eliminación de procesos' seleccionado.
			 clear
			 fn_EliminarProcesos
		     read -p "Presione [Enter] para volver al menu" varNull
			 ;;
	 4) #@jcrequena: Salida del script mostrando créditos antes de abandonarlo.
			clear
			read -p "Presione [Enter] para salir" varNull
			clear
			exit
			 ;;
	*) #@jcrequena: No se ha elegido una opción correcta.
			 echo "Error: Seleccione una opcion valida [1-4]!"
			 read -p "Presione [Enter] para volver al menu" varNull
			 ;;
	esac
done
