#include <stdlib.h>
#include <stdio.h>
#include <dirent.h> //libreria para el manejo de directorios.  
#include <string.h>
#include <sys/types.h> //En está libreria estan definidos algunos tipos de datos utilizados en las anteriores librerias (dirent.h).
//
//Cuerpo del programa
//
int main(int argc, char **argv){

	DIR *directorio;
  struct dirent *entradaDirectorio;

  if(argc != 2)
  {
  	  printf("Número de argumentos incorrectos.\n");
      printf("Uso %s <directorio>.\n",argv[0]);
  }

  directorio = opendir (argv[1]);	//Abrimos el directorio que se le ha pasado en el primer parámetro de la llamada
  if (directorio == NULL) printf("Error: No es posible abrir el directorio %s",argv[1]);
  //
	// En esta fase se recorre el directorio buscando los archivos que se contienen para dar información relativa a nombre y nºinodo	
	//
  printf("nodo-1: \t Fichero:  \n");
	printf("---------\t ----------------  \n"); //El \t es para poner un tabulador
	
	while ((entradaDirectorio = readdir (directorio)) != NULL)
  {    
	    //Comprobamos que las entradas . y .. no se leen
      if ( (strcmp(entradaDirectorio->d_name, ".") != 0) && (strcmp(entradaDirectorio->d_name, "..") != 0) )
      { 
	    	printf("%lu \t%s\n",entradaDirectorio->d_ino, entradaDirectorio->d_name);//El tipo de datos de d_ino es unsigned long. El \t es para poner un tabulador
	    }
	}//fin while
	  
	closedir (directorio); //Se cierra el directorio abierto.
	return 0;
}//fin main
