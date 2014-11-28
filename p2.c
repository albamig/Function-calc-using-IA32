#include <stdio.h>

double x, y;
double calculo();

void main(){
	printf("Introduce un valor de x: ");
	scanf("%lf", &x);
	calculo();
	printf("El valor de y es: %lf\n", y);
}
