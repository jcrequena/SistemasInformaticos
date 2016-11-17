/*Las variables globales y las variables locales declaradas con el especificador static tienen duración estática. 
Se crean antes de que el programa inicie su ejecución y se destruyen cuando el programa termina.
Las variables locales no static tienen duración automática. 
Se crean al entrar al bloque en el que fueron declaradas y se destruyen al salir de ese bloque.
Los punteros, son dinámicos, la memoria que se cree hay que liberarla (heap)
*/

#include <stdio.h>
#include <stdlib.h> /*Librería para la gestión dinámica de memoria (malloc, calloc, realloc y free)*/
#include <string.h>
#include <unistd.h> /* sysconf(3) --> http://man7.org/linux/man-pages/man3/sysconf.3.html */
int c=10; //variable global
int main(void)
{
	int a=10; // Variable de la función main. Estas variables se guardan en la pila.
	int* b = malloc(sizeof(int)); // Los punteros se reservan en el heap o montículo.
	*b=10;
	static int d=10; // Variable estática.

	int pid = getpid(); 
	int page_size=sysconf(_SC_PAGESIZE); //Llamada al sistema para obtener el tamaño de página en bytes.

	printf("Mi PID es %d\n",pid);
	printf("El tamaño de página de este sistema es %d bytes.\n",page_size);
    
	FILE *infile,*pagemap;
	char ruta[25];
	snprintf(ruta, sizeof ruta,"/proc/%d/maps",pid); //construir la ruta de maps --> https://linux.die.net/man/3/snprintf
	infile = fopen(ruta,"r"); // Abrir como lectura el maps
	snprintf(ruta, sizeof ruta,"/proc/%d/pagemap",pid); //construir la ruta de pagemap
	pagemap = fopen(ruta,"rb"); // Abrir como lectura en modo binary
	// Este fichero contiene 64 bits por página lógica e informa sobre el PFN
    
 	if ( infile != NULL )
 	{
      		char line [ 128 ]; // O cualquier otro máximo de tamaño de línea
      		while ( fgets ( line, sizeof line, infile ) != NULL ) /* read a line */
      		{
           		char *p, *pf, *tipo_memoria ; // p = página inicial, pf = página final, tipo_memoria = almacenará si se usa el heap o la pila (stack)
           		p = strtok(line,"-"); // strtok guarda en p la línea hasta el  -
           		printf("\nEl segmento va de: %s ",p);
           		pf = strtok(NULL," ");
           		printf("a: %s ",pf);    
       	    		unsigned long base = strtol(p,NULL,16);
           		unsigned long base_map=(base/page_size)*8; // Ahora necesito buscar la base en el pagemap  y cada página ocupa 64 bits o 8 bytes
           		printf("primer PFN: ");
           		long long my_record;
           		fseek(pagemap,base_map,SEEK_SET);
           		fread(&my_record,sizeof(long long),1,pagemap);
           		printf("%llx",my_record); // muestra long long en hexadecimal
       	 
       			/*
            		* Bits 0-54  page frame number (PFN) if present
            		* Bits 0-4   swap type if swapped
            		* Bits 5-54  swap offset if swapped
            		* Bit  55	pte is soft-dirty (see Documentation/vm/soft-dirty.txt)
            		* Bits 56-60 zero
            		* Bit  61	page is file-page or shared-anon
            		* Bit  62	page swapped
            		* Bit  63	page present
        		* Por tanto, si la página está en memoria se puede encontrar en el PFN por el tamaño de la página
        		*/
        	  	tipo_memoria = strtok(NULL,""); // El funcionamento de strtok necesita NULL en la siguiente llamada
            		if (strstr(tipo_memoria, "stack") != NULL) { //busca stack o heap en la línea p
              			printf(" (pila)"); // como la pila crece hacia abajo, la primera página normalmente no tiene nada
            			unsigned long i = base;
   	          		unsigned long k = strtol(pf,NULL,16);
   	          		printf("\n La pila tiena un tamaño de: %lx bytes",(k-i));
				unsigned long base_pila;               		
   	          		for(i;i<=k;i=i+page_size){
   	            			//   printf("\n   %lx",i);
   	 	          		base_pila = (i/page_size)*8;
                			long long pila_record;
   	 	          		fseek(pagemap,base_pila,SEEK_SET);
                			fread(&pila_record,sizeof(long long),1,pagemap);
   	 	          		if(pila_record != 0x600000000000000)
   		 	          	printf("  %lx: %llx \n",i,pila_record); // muestra long long en hexadecimal
   	          		}//fin del for
    	      		}//fin del if --> busca stack o heap en la línea p 
        		if (strstr(tipo_memoria, "heap") != NULL) {
				printf(" (monticulo)");
				unsigned long i = base;
				unsigned long k = strtol(pf,NULL,16);
				printf("\n El monticulo tiene un tamaño de: %ld bytes",(k-i));
				int tam_heap=0; //Variable para llevar el tamaño del heap
				unsigned long base_pila;
				for(i;i<=k;i=i+page_size){
					base_pila = (i/page_size)*8;
					long long pila_record;
					fseek(pagemap,base_pila,SEEK_SET);
					fread(&pila_record,sizeof(long long),1,pagemap);
					if(pila_record != 0x600000000000000)
					tam_heap+=page_size;
					//printf("  %lx: %llx \n",i,pila_record); // muestra long long en hexadecimal
				}
				printf(" Pero realmente ocupa %d bytes ",tam_heap);
			}//fin if heap
      	  	} //fin del while read a line 
    	    	fclose (infile);
	} // Fin del if ( infile != NULL )
    	else {
    		perror ("infile");
	}
	printf("\nLa variable a está en %p\n",&a);
	printf("La variable b está en %p\n",b);
	printf("La variable c está en %p\n",&c);
	printf("La variable d está en %p\n",&d);
      	return 0;
}
