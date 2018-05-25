//Funciones para go
#include <iostream>
#include <cmath>
#include <fstream>
#include <stdlib.h>

using namespace std;

//1:(F) Muestra la matriz A(i,j) en forma de tablero por pantalla
void plotm(int i, int j, double **A);
//2:(F) Graba la matriz A(n,m) en mat.txt
void writemat(int n, int m, double **A);
//3:(F) Crea la matriz A(fa,ca) con n
double** numbersm(int fa, int ca, double n);
//4:(F) Lee la matriz A(n,m) de mat.txt
double** loadmat(int n, int m);

//--------------------------------------------------------------------------------------------
//1:

void plotm(int i, int j, double **A)
{cout<<" ";
for (int n=0; n<j; n++)
{cout<<" "<<n+1;}
cout<<endl;
for (int f=0; f<i; f++)
 {cout<<f+1;
for (int c=0; c<j; c++){
     if (A[f][c]==0)
     {cout<<"| ";}
     if (A[f][c]==1)
     {cout<<"|+";}
     if (A[f][c]==2)
     {cout<<"|O";}
 if (c==j-1)
 {cout<<"|";}
}
cout<<endl;}
}

//--------------------------------------------------------------------------------------------
//2:

void writemat(int n, int m, double **A)
{
 ofstream sal("mat.txt");
 for (int i=0; i<n; i++)
 {for (int j=0; j<m; j++)
 {
 sal<<A[i][j]<<" ";
 }
 sal<<endl;
 }
 sal.close();
}

//--------------------------------------------------------------------------------------------
//3:

double** numbersm(int fa, int ca, double n)
{
double **A;
A=new double*[fa];
int k=0;
while (k<fa)
{A[k]=new double[ca];
k=k+1;}
for (int i=0;i<fa;i++){for (int j=0;j<ca;j++){A[i][j]=n;}}
return(A);}

//--------------------------------------------------------------------------------------------
//4:

double** loadmat(int n, int m)
{ifstream ent("mat.txt");
double **A=numbersm(n,m,0);
 for (int i=0; i<n; i++)
 {for (int j=0; j<m; j++)
    ent>>A[i][j];}
 ent.close();
 return A;
}

