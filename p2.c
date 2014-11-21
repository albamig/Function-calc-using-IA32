#include <stdio.h>

double x, y, a1, a2, a3, a4, a5, a6;
double calculo();

void main(){
	printf("Introduce un valor de x: ");
	scanf("%lf", &x);
	calculo();
	printf("\nEl valor de y es: %lf\n", y);
	printf("\nEl valor de a1 es: %lf\n", a1);
	printf("\nEl valor de a2 es: %lf\n", a2);
	printf("\nEl valor de a3 es: %lf\n", a3);
	printf("\nEl valor de a4 es: %lf\n", a4);
	printf("\nEl valor de a5 es: %lf\n", a5);
}
