#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


void funcion_ejemplo() {
    int variable_stack = 42; // Se almacena en la PILA (Stack)
    int *variable_heap = (int *)malloc(sizeof(int)); // Se asigna en el MONTÍCULO (Heap)
    *variable_heap = 100;


    printf("=== DIRECCIONES DE MEMORIA ===\n");
    printf("Dirección en la PILA (Stack):    %p\n", (void*)&variable_stack);
    printf("Dirección en el MONTÍCULO (Heap): %p\n", (void*)variable_heap);


    printf("\nPID del proceso: %d\n", getpid());
    printf("Presiona Enter para finalizar el programa...");
    getchar(); // Pausa para permitir la inspeccion del proceso


    free(variable_heap); // Liberación de memoria dinamica
}


int main() {
    funcion_ejemplo();
    return 0;
}
