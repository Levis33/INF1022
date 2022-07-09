#include <math.h>
int saida(int W, int X, int Y, int Z){
int A;
A = W;
 A=A*W;
 A=A/X;
 A=pow(A,Y);
 if(X){
	Y += 1;
}
else{
	Z = 0;
}
return A;
}