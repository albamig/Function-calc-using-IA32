#include <stdio.h>

double x, y;
double calculo();

void main(){
	printf("Introduce un valor de x\n");
	scanf("%f", &x);
	y = calculo();
	printf("El valor de y es: %f", y);
}
