#include <stdio.h>
// El archivo de cabecera de la biblioteca estándar de C limits.h 
// Se utiliza para establecer mediante constantes ciertas propiedades de las variables de tipo entero, 
// propiedades como por ejemplo la definición de su rango.
// http://www.tutorialspoint.com/c_standard_library/limits_h.htm
// http://tigcc.ticalc.org/doc/limits.html
#include <limits.h>
//
// El archivo de cabecera de la biblioteca estándar de C float.h 
// Se utiliza para establecer mediante constantes ciertas propiedades de las variables de tipo float, 
// propiedades como por ejemplo la definición de su rango. FLT_MIN,FLT_MAX
#include <float.h>

void main()
{
   printf("Storage size for int : %d \n", (int) sizeof(int)); //Devuelve el tamaño en bytes del tipo entero (int).
   printf ("Mínimo y máximo valor del tipo de datos int valor= %d\t\t%d\n",INT_MIN,INT_MAX);
   printf ("Mínimo y máximo valor del tipo de datos float valor= %f\t\t%f\n",FLT_MIN,FLT_MAX);
}

//
//Referencias para códigos de formatos en la función printf
//https://msdn.microsoft.com/es-es/library/aa291517(v=vs.71).aspx
//http://es.cppreference.com/w/cpp/io/c/printf_format
