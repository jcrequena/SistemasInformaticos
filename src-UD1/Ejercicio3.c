#include <stdio.h>
#include <ctype.h>
#include <string.h>


// Escribe el binario del número que le pasamos como argumento a la función
void printbitssimple(int n) {
    unsigned int i;
    i = 1<<31;
    /*Esta operación, mueve los bits a la izquierda (desplazamineto) tantas veces como mida el número.
    Como en este caso son 32 bits, el 1 que es 0x00000001 se mueve 31 bits y queda 0x80000000
    */
    while (i > 0) {
        if (n & i) // Este & lógico queda a 1 si en la posición del bit i hay un 1
            printf("1");
        else
            printf("0");
        i >>= 1; // desplazamos el 1 a la derecha para probar el siguiente bit
    }
}

void printbitsdoble(long long int n) {
    unsigned long long int i=1;
         i = i<<63;
         /*Esta operación, mueve los bits a la izquierda (desplazamineto) tantas veces como mida el número.
          Como en este caso son 64 bits, el 1 que es 0x0000000000000001 se mueve 63 bits y queda 0x8000000000000000
          */
         while (i > 0) {
                 if (n & i) // Este & lógico queda a 1 si en la posición del bit i hay un 1
                         printf("1");
                 else
                         printf("0");
                 i >>= 1; // desplazamos el 1 a la derecha para probar el siguiente bit
         }
 }
//
//Función principal
//
int main()
{

double realdoble;
// Lo capturamos con toda la precisión posible
printf("Escribe un número con decimales:\n");
scanf("%lf",&realdoble);
//
//Lo transformamos en las otras representaciones
//
float real=(float)realdoble;
int n = (int)realdoble;

printf("|        | Binario                          | Octal       | Hexadecimal | Decimal\n");
printf("| Entero |");
// C no puede representar binario directamente, hace falta realizar una función a mano.
printbitssimple(n);
printf(" |%12o |  %#010X | %i\n",n,n,n);


// primero de todo, hace falta hacer un cast del float a int (los dos a 32 bits) para que printf y la función funcionen
unsigned int rr;
memcpy(&rr, &real, sizeof(rr));

printf("| Simple |");
printbitssimple(rr);
printf(" |%12o |  %#010x | %.20f\n",rr,rr,real);


unsigned long long int rrealdoble;
memcpy(&rrealdoble, &realdoble, sizeof(rrealdoble));

printf("| Doble  |");
printbitsdoble(rrealdoble);
printf(" | %llo |  %#018llX | %.20f\n ",rrealdoble,rrealdoble,realdoble);

return 0;
}
