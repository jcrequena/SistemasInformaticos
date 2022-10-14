#include <stdio.h>
#include <string.h>

void main(int argc, char *argv[]){
    int i, j, k, suma;

    if (argc == 4) {
        i = atoi(argv[1]);
        j = atoi(argv[2]);
        k = atoi(argv[3]);
        if (i<=0 || j<=0 || k<=0) {  
            printf("Ningún parametro puede ser <= 0\n");
        } else {
            suma = i + j + k;
            printf("%d + %d + %d = %d\n", i, j, k, suma);
            if (suma == 0) {
                printf("¡Conseguido! Has accedido al Área privada\n");
            }
        }   
    } else {
        printf("Error: Indica tres parámetros (números positivos) separados por un espacio\n");
    }
}
