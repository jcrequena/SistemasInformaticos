#include <stdio.h>
// El archivo de cabecera de la biblioteca estándar de C limits.h 
// se utiliza para establecer mediante constantes ciertas propiedades de las variables de tipo entero, 
// propiedades como por ejemplo la definición de su rango.
#include <limits.h>

int main()

{
   char a=127,b=127,c;
   c=a+b;
   printf("a=%d b=%d c=a+b=%d",a,b,c);
   return 0;
}
