//Funciones
//Ignacio Hernández-Ros. Actualizado el 30 de Septiembre de 2014
#include <iostream>
#include <cmath>
#include <fstream>
#include <stdlib.h>
using namespace std;

//Define constantes matemáticas

const double npi=3.1415926536;
const double ne=2.718281828459;

//1:(F) Muestra la matriz A(i,j) por pantalla
void plotm(int i, int j, double **A);
//2:(F) Devuelve el producto de la matriz A(af,ac)*B(bf,bc)
double** prodm(double **A,int af,int ac,double **B,int bf,int bc);
//3:(T) Crea una matriz cuyos elementos son todos n
double** numbersm(int fa, int ca, double n);
//4:(F) Toma datos por pantalla para crear una matriz
double** elementm(int af,int ac);
//5:(F) Toma una funcion de x y devuelve la derivada en x0
double dervf(double (*f)(double),double x0,double dx);
//6:(F) Calcula el producto escalar de dos vectores
double prodescv(int n, double *v, double *w);
//7:(F) Calcula la norma de un vector
double normv(int n, double *v);
//8:(F) Muestra el vector por pantalla
void plotv(int i, double *v);
//9:(F) Calcula el angulo de dos vectores
double angv(int n, double *v, double *w);
//10:(F) Crea un script básico de MATLAB que representa los datos de vy frente a vx
void matplotv(int n, double *vx, double *vy);
//11:(F) Crea un script básico de MATLAB que representa los datos de f en el intervalo (x1,x2)
void matplotf(double (*f)(double), double x1, double x2,int n);
//12:(F) Busca el cero de la funcion f en el intervalo (x1,x2) con el método de la bisección
double biseczerof(double (*f)(double),double x1,double x2,double err);
//13:(F) Busca el cero de la funcion f en el intervalo (x1,x2) con el método de la secante
double seczerof(double (*f)(double),double x1,double x2,double err);
//13:(F) Busca el cero de la funcion f en el intervalo (x1,x2) con el método de Newton
double newtzerof(double (*f)(double),double x1,double err);
//--------------------------------------------------------------------------------------------
//1:
void plotm(int i, int j, double **A)
 {for (int f=0; f<i; f++)
 {for (int c=0; c<j; c++){
 cout<<A[f][c];
 if (c!=j-1)
 {cout<<",";}

}
cout<<endl;}
}
//--------------------------------------------------------------------------------------------
//2:
double** prodm(double **A,int af,int ac,double **B,int bf,int bc)
{double **C;
C=new double*[af];
int h=0;
while (h<af)
{C[h]=new double[bc];
h=h+1;};
for (int i=0;i<af;i++)
 {for (int j=0;j<bc;j++)
  {double s=0;
      for (int k=0;k<ac;k++)
      {s=s+A[i][k]*B[k][j];}
   C[i][j]=s;}}
return (C);
}
//--------------------------------------------------------------------------------------------
//3:
double** numbersm(int fa, int ca, double n)
{double **A;
A=new double*[fa];
int k=0;
while (k<fa)
{A[k]=new double[ca];
k=k+1;}
for (int i=0;i<fa;i++){for (int j=0;j<ca;j++){A[i][j]=n;}}
return(A);}
//--------------------------------------------------------------------------------------------
//4:
double** elementm(int af,int ac)
{double **C;
C=new double*[af];
int h=0;
while (h<af)
{C[h]=new double[ac];
h=h+1;};
double s=0;
for (int i=0;i<af;i++)
 {for (int j=0;j<ac;j++)
  {
   cin>>s;
   C[i][j]=s;}}
return (C);
}
//--------------------------------------------------------------------------------------------
//5:
double dervf(double (*f)(double),double x0,double dx)
{
    return (-f(x0-dx)+f(x0+dx))/(2*dx);
    }
//--------------------------------------------------------------------------------------------
//6:
double prodescv(int n, double *v, double *w)
{double s=0;
for (int i=0;i<n;i++)
{s=s+(v[i]*w[i]);}
return (s);}
//--------------------------------------------------------------------------------------------
//7:
double normv(int n, double *v)
{
return (sqrt(prodescv(n,v,v)));
}
//--------------------------------------------------------------------------------------------
//8:
void plotv(int i, double *v)
 {cout<<"(";
 for (int f=0; f<i; f++){
 cout<<v[f];
 if (f!=i-1)
 {cout<<",";}}
cout<<")"<<endl;
}
//--------------------------------------------------------------------------------------------
//9:
double angv(int n, double *v, double *w)
{return(acos(prodescv(n,v,w)/(normv(n,v)*normv(n,w))));}
//--------------------------------------------------------------------------------------------
//10:
void matplotv(int n, double *vx, double *vy)
{ofstream salx("vx.txt");
 ofstream saly("vy.txt");
 ofstream salmat("matplot.m");
 for (int i=0; i<n; i++)
 {
     salx<<vx[i]<<" ";
     saly<<vy[i]<<" ";
 }
 salmat<<"x=importdata('vx.txt');"<<endl<<"y=importdata('vy.txt');"<<endl<<"plot(x,y)";
 salx.close();
 saly.close();
 salmat.close();
 cout<<"Se ha creado el archivo vx.txt, vy.txt, matplot.m"<<endl;
}
//--------------------------------------------------------------------------------------------
//11:
void matplotf(double (*f)(double), double x1, double x2,int n)
{
    double vx[n], vy[n];
    for (int i=0;i<n;i++)
    {vx[i]=x1+((x2-x1)/n)*i;
     vy[i]=f(vx[i]);}
    matplotv(n,vx,vy);
}
//--------------------------------------------------------------------------------------------
//12:
double biseczerof(double (*f)(double),double x1,double x2,double err)
{double x3=(x1+x2)/2;
while(abs(x2-x1)>err)
{x3=(x1+x2)/2;
if(f(x3)*f(x2)<=0)
    {x1=x3;}
else
    {x2=x3;}
}
 return (x3);
}
//--------------------------------------------------------------------------------------------
//13:
double seczerof(double (*f)(double),double x1,double x2,double err)
{double x3;
 while(fabs(x1-x2)>err)
 {
  x3=x1-f(x1)*((x1-x2)/(f(x1)-f(x2)));
  x2=x1;
  x1=x3;
 }
 return (x3);
}
//--------------------------------------------------------------------------------------------
//14:
double newtzerof(double (*f)(double),double x1,double err)
{

}
//--------------------------------------------------------------------------------------------
//15:

//--------------------------------------------------------------------------------------------
//16:
