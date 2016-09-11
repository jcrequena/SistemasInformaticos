#include <stdio.h>
// El archivo de cabecera de la biblioteca estándar de C limits.h 
// se utiliza para establecer mediante constantes ciertas propiedades de las variables de tipo entero, 
// propiedades como por ejemplo la definición de su rango.
// http://www.tutorialspoint.com/c_standard_library/limits_h.htm
// http://tigcc.ticalc.org/doc/limits.html
#include <limits.h>

int main()
{
   printf("Storage size for int : %d \n", (int) sizeof(int));
   return 0;
}
