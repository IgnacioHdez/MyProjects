// Practica 7
#include "futil.cpp"
using namespace std;

/*futil.cpp es un archivo que viene con este en el que estan recogidas todas las funciones que hemos
trabajado durante el curso y alguna mas que he retocado de cosas que he trabajado por mi cuenta
Al incluir "futil.cpp" puedo usar cualquira de esas funciones y el programa principal me queda mucho mas corto.
En general loadmat y writemat son funciones que hice para grabar matrices y leeras de un txt y
plotm las pone por pantalla. La funcion que resuelve el sistema lu es lusystem*/

int main ()
{cout<<"Practica 7. Ignacio Hernandez-Ros"<<endl;
double** A;double** b;double **X;
int fa=5;
A=loadmat(fa,fa,"coef.txt");
cout<<endl;
plotm(fa,fa,A);
cout<<endl;
b=loadmat(fa,1,"tindep.txt");
cout<<endl;
plotm(fa,1,b);
X=lusystem(A,fa,fa,b);
cout<<endl;
cout<<"La solucion es:"<<endl<<endl;
plotm(fa, 1, X);
cout<<endl;
writemat(fa,1,X,"sol.txt");
system ("pause");
return 0;
}
