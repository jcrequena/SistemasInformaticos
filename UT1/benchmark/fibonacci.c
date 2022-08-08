#include <stdio.h>
#include <time.h>

int main(void)
{
  int x,y,z,cont;

  clock_t start, end;
  float cpu_time_used;

  x=0;
  y=1;
 printf("---Resultados de la serie de fibonacci---\n");
 //Tiempo al inicio
 start = clock();
 for (cont=1;cont<=20;cont=cont+1)
  {
      z=x+y;
      printf("%d\n",z);
      x=y;
      y=z;
  }
 
   //Tiempo al fin
end = clock();


printf("--Resultados computacionales---\n");
//CLOCKS_PER_SECOND : the number of clock ticks per second
printf("Starting Time:%lu\n",start);
printf("Ending Time:%lu\n",end);
//printf("Starting Time:%g\n", (double) start);
//printf("Ending Time:%g\n", (double) end);

printf("CLOCKS_PER_SEC:%lu",CLOCKS_PER_SEC);
printf("\nNumber of clock ticks:%lu\n",(end - start));

cpu_time_used = (float)(end - start)/CLOCKS_PER_SEC;
//Tiempo transcurrido durante la realización de las 4 operaciones matemáticas
printf("Tiempo transcurrido: %f segundos\n",cpu_time_used);   
  
}
