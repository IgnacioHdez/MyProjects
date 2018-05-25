//Practica 4
//Apartado 1
#include <iostream>
#include <cmath>
#include "futil.cpp"
using namespace std;

main()
{
//Ejercicio 1
cout<<"Apartado 1"<<endl;
int n;
cout<<"Dimension: ";
cin>>n;
int *v;
v=new int[n];
int kk=0;
while (kk<n)
{v[kk]=kk+1;
cout<<v[kk];
kk=kk+1;}
cout<<endl<<endl;

//Ejercicio 2

cout<<"Apartado 2"<<endl;
int fa, ca;
cout<<"Filas de A: ";
cin>>fa;
cout<<"Columnas de A: ";
cin>>ca;
double **A;
A=new double*[fa];
A=element(fa,ca);
cout<<endl<<"A:"<<endl;
plotm(fa,ca,A);
cout<<endl<<endl;

//Ejercicio 3

cout<<"Apartado 3"<<endl;

int fb, cb;
cout<<"Filas de B: ";
cin>>fb;
cout<<"Columnas de B: ";
cin>>cb;
double **B;
B=new double*[fb];
B=element(fb,cb);
 cout<<endl<<"B:"<<endl;
 plotm(fb,cb,B);
 if (ca!=fb)
 {cout<<"No se puede realizar el producto"<<endl;system ("pause");return 0;};
 cout<<endl;
double **C;
C=new double*[fa];
int d=0;
while (d<fa)
{C[d]=new double[cb];
d=d+1;};

C=prodm(A,fa,ca,B,fb,cb);
cout<<"A*B:"<<endl;
plotm(fa,cb,C);
system("pause");
return 0;
}
