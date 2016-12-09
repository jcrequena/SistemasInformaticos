#include <stdio.h>
#include <fcntl.h>
#include <string.h>


int main(int argc, char **argv) 
{
int fPasswd, fCopia;
int tam_buffer; // Tamaño del buffer. Lo pedimos por teclado al usuario.
int bytesLeidos,bytesEscritos;
int resLecturaValor;
int fragmentacion = 0; //Nos permite ver cuál es la fragmentación interna en el último bloque.
    
//Comprobar que los parámetros que se pasan en la llamada son los correctos.
if(argc != 3) {
       printf("Error, número de argumentos incorrecto\n");
       printf("Usar: %s <fichero passwd> <fichero_backup>\n",argv[0]);
       return -1; //Devolvemos un -1 indicando un error de parámetros
}

//
//Pedimos al usuario que introduzca el tamaño del buffer
//
printf("Introduzca un tamaño de buffer (bloque de lectura/escritura):"); //Solicitando al usuario que introduzca un número entero
resLecturaValor = scanf("%d",&tam_buffer); //Leyendo el número solicitado
    
//
//Comprobamos que lo que introduce el usuario es un número
//
if(resLecturaValor == 0) {
        printf("Error: ¡El valor introducido NO es un número!\n");
		    return -2; //Devolvemos un -2 indicando un error de entrada dedatos no numérica.
}
    
const char* buffer[tam_buffer]; 
  
//
// Abrir el fichero de entrada en lectura
//
fPasswd = open(argv[1],O_RDONLY); 
if(fPasswd == -1) {
       printf("El fichero %s no existe o no se tiene permisos de lectura sobre él.\n",argv[1]);
       return -3; //Devolvemos un -3 indicando un error de apertura de fichero
}
// Abre el fichero, sino existe, lo crea con los permisos 0644.
fCopia = open(argv[2], O_CREAT|O_WRONLY,0644);  
if(fCopia == -1) {
       printf("El fichero %s no puede ser creado.\n", argv[2]);
       return -3; //Devolvemos un -3 indicando un error de apertura de fichero
}
  //
  //Variable para almacenar el número de iteraciones
int iContIter = 1;
while ((bytesLeidos = read(fPasswd,buffer,tam_buffer))>0)
{ 
	bytesEscritos = write(fCopia, buffer, bytesLeidos);
        printf("Iteración %d, leídos= %d bytes escritos= %d bytes \n",iContIter, bytesLeidos,bytesEscritos);
        iContIter++;
}
 //
// 2 llamadas de open, 2 de close más iContIter*2 de read/write
//
printf("Las llamadas al sistema que ha generado este programa son: %d\n",(iContIter*2)+4);
fragmentacion = (tam_buffer - bytesEscritos); //Calculamos los bytes libres y no utilizados en el último bloque.
printf("La fragmentación interna en el último bloque es:%d\n",fragmentacion);
    
// Cerrar ficheros
close(fPasswd);
close(fCopia);
return 0; //Devolvemos el código de error 0 que indica que todo ha ido bien
}
