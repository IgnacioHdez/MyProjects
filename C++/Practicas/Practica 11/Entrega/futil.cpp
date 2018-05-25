//Funciones utiles (futil.cpp)
//Ignacio Hernández-Ros. Actualizado el 14 de Octubre de 2014
#include <iostream>
#include <cmath>
#include <fstream>
#include <stdlib.h>
//using namespace std;

//Define constantes matemáticas

const double pi=4*atan(1);
const double e=exp(1.0);

//----------INDICE DE LAS FUNCIONES----------

//1:(M) Muestra la matriz A(i,j) por pantalla
void plotm(int i, int j, double **A);

//2:(M) Devuelve el producto de la matriz A(af,ac)*B(bf,bc)
double** prodm(double **A,int af,int ac,double **B,int bf,int bc);

//3:(M) Crea una matriz cuyos elementos son todos n
double** numbersm(int fa, int ca, double n);

//4:(M) Toma datos por pantalla para crear una matriz
double** elementm(int af,int ac);

//5:(F) Toma una funcion de x y devuelve la derivada en x0
double dervf(double (*f)(double),double x0,double dx);

//6:(V) Calcula el producto escalar de dos vectores
double prodescv(int n, double *v, double *w);

//7:(V) Calcula la norma de un vector
double normv(int n, double *v);

//8:(V) Muestra el vector por pantalla
void plotv(int i, double *v);

//9:(V) Calcula el angulo de dos vectores
double angv(int n, double *v, double *w);

//10:(V) Crea un script básico de MATLAB que representa los datos de vy frente a vx
void matplotv(int n, double *vx, double *vy);

//11:(F) Crea un script básico de MATLAB que representa los datos de f en el intervalo (x1,x2)
void matplotf(double (*f)(double), double x1, double x2,int n);

//12:(F) Busca el cero de la funcion f en el intervalo (x1,x2) con el método de la bisección
double biseczerof(double (*f)(double),double x1,double x2,double err);

//13:(F) Busca el cero de la funcion f en el intervalo (x1,x2) con el método de la secante
double seczerof(double (*f)(double),double x1,double x2,double err);

//14:(F) Busca el cero de la funcion f en el intervalo (x1,x2) con el método de Newton
double newtzerof(double (*f)(double),double x1,double err);

//15:(M) Graba una matriz en el archivo namemat y si no existe previamente lo crea
void writem(int n, int m, double **A, const char* namemat);

//16:(M) Lee los datos del archivo namemat
double** loadm(int n, int m, const char* namemat);

//17:(E) Resolucion de un sistem de ecuaciones lineales mediante LU
double** lusystem(double **A,int fa,int ca,double **b);

//18:(E) Resolucion de un sistem de ecuaciones lineales mediante Gauss-Seidel
double** gssystem(double** A,int n , double** b,double err);

//19:(V) Crea un vector cuyos elementos son todos n
double* numbersv(int d, double n);

//20:(V) Graba un vector en el archivo namev
void writev(int n, double *v, const char* namev);

//21:(V) Lee un vector del archivo namev
double* loadv(int n, const char* namev);

//22:(F) Calcula la derivada parcial numérica de F(x,y) sobre x si xy=1 o y si xy=2
double derparxy(double (*F)(double,double),double x0,double y0,double dx,int xy);

//23:(F) Calcula la derivada parcial numérica de F(x,y,z) sobre x si xyz=1, sobre y si xyz=2 y sobre z si xyz=3
double derparxyz(double (*F)(double,double,double),double x0,double y0,double z0,double dx,int xyz);

//24:(M) Crea una matriz identidad
double** idm(int n);

//25:(M) Devuelve la inversa
double **invm(double **A,int n);

//26:(M) Elimina la memoria que ocupa A
void clearm(double **A,int n);

//27:(V) Elimina la memoria que ocupa v
void clearv(double *v,int n);

//28:(F) Busca la solución de un sistema de ecuaciones no lineales
double *newrap3(double (*f)(double,double,double),double (*g)(double,double,double),double (*h)(double,double,double),double* x0,double tol);

//29:(M) Devuelve la traspuesta de la matriz A
double** trasm(double **A, int n);

//30:(M) Devuelve la matriz de rotacion de angulo theta en el plano i,j
double **Rotm(int i, int j,double theta,int n);

//31:(M) Devuelve la matriz diagonal de A
double** diagm(double** A,int n, double tol);

//32:(M) Devuelve la matriz de autovectores de A
double** autovectm(double** A,int n, double tol);
//-----------CONTENIDO DE LAS FUNCIONES------------

//--------------------------------------------------------------------------------------------
//1:
void plotm(int i, int j, double **A)
{
for (int f=0; f<i; f++)
 {for (int c=0; c<j; c++){
 std::cout<<A[f][c];
 if (c!=j-1)
 {std::cout<<" , ";}
}
std::cout<<std::endl;}
std::cout<<std::endl;
}
//--------------------------------------------------------------------------------------------
//2:
double** prodm(double **A,int af,int ac,double **B,int bf,int bc)
{
double **C;
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
double** elementm(int af,int ac)
{
double **C;
C=new double*[af];
int h=0;
while (h<af)
{C[h]=new double[ac];
h=h+1;};
double s=0;
for (int i=0;i<af;i++)
 {for (int j=0;j<ac;j++)
  {
   std::cin>>s;
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
{
double s=0;
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
{
std::cout<<"[";
 for (int f=0; f<i; f++){
 std::cout<<v[f];
 if (f!=i-1)
 {std::cout<<" , ";}}
std::cout<<"]"<<std::endl;
}
//--------------------------------------------------------------------------------------------
//9:
double angv(int n, double *v, double *w)
{
return(acos(prodescv(n,v,w)/(normv(n,v)*normv(n,w))));
}
//--------------------------------------------------------------------------------------------
//10:
void matplotv(int n, double *vx, double *vy)
{
std::ofstream salx("vx.txt");
std::ofstream saly("vy.txt");
std::ofstream salmat("matplot.m");
std::cout<<"Creando los archivos vx.txt y vy.txt"<<std::endl;
for (int i=0; i<n; i++)
 {salx<<vx[i]<<" ";saly<<vy[i]<<" ";}
salmat<<"x=importdata('vx.txt');"<<std::endl<<"y=importdata('vy.txt');"<<std::endl<<"plot(x,y)";
salx.close();
saly.close();
salmat.close();
std::cout<<"Se ha creado el archivo vx.txt, vy.txt, matplot.m"<<std::endl;
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
{
double x3=(x1+x2)/2;
while(fabs(x2-x1)>err)
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
{
double x3;
 while(fabs(x1-x2)>err)
 {x3=x1-f(x1)*((x1-x2)/(f(x1)-f(x2)));
  x2=x1;
  x1=x3;}
 return (x3);
}
//--------------------------------------------------------------------------------------------
//14:
double newtzerof(double (*f)(double),double x1,double err)
{
double x2=x1-f(x1)/(dervf(f,x1,err/1000000)),dx=x1-x2;
 while (fabs(dx)>err)
 {x2=x1-f(x1)/(dervf(f,x1,err/1000000));
  dx=x1-x2;
  x1=x2;}
 return(x1);
}
//--------------------------------------------------------------------------------------------
//15:
void writem(int n, int m, double **A, const char* namemat)
{
 std::ofstream sal(namemat);
 std::cout<<"Grabando matriz en el archivo "<<namemat<<" ..."<<std::endl;
 for (int i=0; i<n; i++)
 {for (int j=0; j<m; j++)
 {sal<<A[i][j]<<" ";}
 sal<<std::endl;}
 std::cout<<"Grabado completado "<<std::endl;
 sal.close();
}
//--------------------------------------------------------------------------------------------
//16:
double** loadm(int n, int m, const char* namemat)
{
std::ifstream ent(namemat);
double **A=numbersm(n,m,0);
std::cout<<"Leyendo matriz del archivo "<<namemat<<" ..."<<std::endl;
 for (int i=0; i<n; i++)
 {for (int j=0; j<m; j++)
    ent>>A[i][j];}
 ent.close();
 std::cout<<"Lectura completada "<<std::endl;
 return A;
}
//--------------------------------------------------------------------------------------------
//17:
double* lusystem(double **A,int fa,int ca,double *b)
{
double **U;double **L;double *Z;double *X;double sum1;double sum2;double sum3;double sum4;
 U=numbersm(fa,ca,0);
 L=numbersm(fa,ca,0);
 Z=numbersv(fa,0);
 X=numbersv(fa,0);
 Z[0]=b[0];
 L[0][0]=1;
 U[0][0]=A[0][0];
 for(int i=0;i<fa;i++)
{for(int j=0; j<ca ;j++)
{if (i<=j)
 {sum1=0;
  for(int k=0; k<i;k++ )
   {sum1=sum1+L[i][k]*U[k][j];}
  U[i][j]=A[i][j]-sum1;
  if (i<j)
  {L[i][j]=0;}
  else
  {L[i][j]=1;}}
 else
 {sum2=0;
  for(int k=0; k<j;k++ )
   {sum2=sum2+L[i][k]*U[k][j];}
  L[i][j]=(A[i][j]-sum2)/U[j][j];}}}
for(int i=0;i<fa;i++)
{sum3=0;
for(int j=0;j<i;j++)
 {sum3=sum3+L[i][j]*Z[j];}
Z[i]=b[i]-sum3;}

X[0]=Z[0]/U[0][0];
for(int i=fa-1;i>=0;i--)
{sum4=0;
for (int j=i+1;j<fa;j++)
{sum4=sum4+U[i][j]*X[j] ;}
X[i]=(Z[i]-sum4)/ U[i][i];}
return(X);
}
//--------------------------------------------------------------------------------------------
//18:
double* gssystem(double** A,int n , double* b,double err)
{
double *oldx; double *x; double dx[n];
oldx=numbersv(n,0);
x=numbersv(n,0);
for(int i=0; i<n; i++)
 {x[i]=b[i]/A[i][i];}
do
 {for (int i=0; i<n; i++)
  {oldx[i]=x[i];}
  for (int i=0; i<n; i++)
   {x[i]=b[i]/A[i][i];
     for (int j=0; j<n; j++)
        {if (j!=i)
          {x[i]=x[i]-(A[i][j]/A[i][i])*x[j];}
 }dx[i]=fabs(x[i]-oldx[i]);}
 }while ((normv(n,dx))>err);
return(x);}
//--------------------------------------------------------------------------------------------
//19:
double* numbersv(int d, double n)
{
double *v;
v=new double[d];
for (int i=0;i<d;i++){v[i]=n;}
return(v);
}
//--------------------------------------------------------------------------------------------
//20:
void writev(int n, double *v, const char* namev)
{
 std::ofstream sal(namev);
 std::cout<<"Grabando vector en el archivo "<<namev<<" ..."<<std::endl;
 for (int i=0; i<n; i++)
 {sal<<v[i]<<std::endl;}
 std::cout<<"Grabado completado "<<std::endl;
 sal.close();
}
//--------------------------------------------------------------------------------------------
//21:
double* loadv(int n, const char* namev)
{
std::ifstream ent(namev);
double *v=numbersv(n,0);
std::cout<<"Leyendo vector del archivo "<<namev<<" ..."<<std::endl;
 for (int i=0; i<n; i++)
    {ent>>v[i];}
 ent.close();
 std::cout<<"Lectura completada "<<std::endl;
 return v;
}
//--------------------------------------------------------------------------------------------
//22:
double derparxy(double (*F)(double,double),double x0,double y0,double dx,int xy)
{
    if (xy==1)return (-F(x0-dx,y0)+F(x0+dx,y0))/(2*dx);
    if (xy==2)return (-F(x0,y0-dx)+F(x0,y0+dx))/(2*dx);
}
//--------------------------------------------------------------------------------------------
//23:
double derparxyz(double (*F)(double,double,double),double x0,double y0,double z0,double dx,int xyz)
{
    if (xyz==1)
    {return (-F(x0-dx,y0,z0)+F(x0+dx,y0,z0))/(2*dx);}
    if (xyz==2)
    {return (-F(x0,y0-dx,z0)+F(x0,y0+dx,z0))/(2*dx);}
    if (xyz==3)
    {return (-F(x0,y0,z0-dx)+F(x0,y0,z0+dx))/(2*dx);}
}
//--------------------------------------------------------------------------------------------
//24:
double** idm(int n)
{
double **A;
A=numbersm(n,n,0);
for (int i=0;i<n;i++){A[i][i]=1;}
return(A);
}
//--------------------------------------------------------------------------------------------
//25:
double **invm(double **A,int n)
{
double m;
double **B;
B=idm(n);
for (int i=0; i<n; i++)
{m=A[i][i];
 for(int k=0;k<n ;k++)
  {A[i][k]=A[i][k]/m;B[i][k]=B[i][k]/m;}
 for(int h=i+1; h<n; h++)
  {m=A[h][i];
   for(int k=0; k<n; k++)
    {A[h][k]=A[h][k]-A[i][k]*m;B[h][k]=B[h][k]-B[i][k]*m;}}}
m=A[n-1][n-1];
for (int i=0; i<n; i++)
{A[n-1][i]=A[n-1][i]/m;B[n-1][i]=B[n-1][i]/m;}
for (int i=n-1; i>=0; i--)
{for(int h=i-1; h>=0; h--)
 {m=A[h][i];
  for(int k=n-1; k>=0; k--)
   {A[h][k]=A[h][k]-A[i][k]*m;B[h][k]=B[h][k]-B[i][k]*m;}}}
return B;
}
//--------------------------------------------------------------------------------------------
//26:
void clearm(double **A,int fa)
{
for(int i=0;i<fa;i++){delete [] A[i];}delete [] A;}
//--------------------------------------------------------------------------------------------
//27:
void clearv(double *v,int n)
{
delete [] v;}
//--------------------------------------------------------------------------------------------
//28:
double *newrap3(double (*f)(double,double,double),double (*g)(double,double,double),double (*h)(double,double,double),double* x0,double tol)
{double* x;double* F;double* vx;double* oldx;double** J=numbersm(3,3,0);x=numbersv(3,0);F=numbersv(3,0);vx=numbersv(3,0);oldx=numbersv(3,0);
for (int i=0;i<3;i++){x[i]=x0[i];}
do
{for (int i=0;i<3;i++){oldx[i]=x[i];}
F[0]=-f(x[0],x[1],x[2]);
F[1]=-g(x[0],x[1],x[2]);
F[2]=-h(x[0],x[1],x[2]);
for (int j=0;j<3;j++)
 {J[0][j]=derparxyz(f,x[0],x[1],x[2],1e-7,j+1);
  J[1][j]=derparxyz(g,x[0],x[1],x[2],1e-7,j+1);
  J[2][j]=derparxyz(h,x[0],x[1],x[2],1e-7,j+1);}
 vx=lusystem(J,3,3,F);
 for (int i=0;i<3;i++){x[i]=oldx[i]+vx[i];}
}while (fabs(normv(3,x)-normv(3,oldx))>tol);
return x;}
//--------------------------------------------------------------------------------------------
//29:
double** trasm(double **A, int n)
{double **At;
At=numbersm(n,n,0);
for(int i=0; i<n; i++)
{for(int j=0; j<n; j++)
    {At[i][j]=A[j][i];At[j][i]=A[i][j];}}
return(At);}
//--------------------------------------------------------------------------------------------
//30:
double **Rotm(int i, int j,double theta,int n)
{double** R;
R=idm(n);
R[i][i]=cos(theta);
R[i][j]=-sin(theta);
R[j][i]=sin(theta);
R[j][j]=cos(theta);
return(R);
}
//--------------------------------------------------------------------------------------------
//31:
double** diagm(double** A,int n, double tol)
{int i, j;double h, theta;double**R;double b=0;
do
{b=0;
 for(int k=0; k<n; k++){for(int l=k; l<n; l++)
  {if(k==l){}else{if(fabs(A[k][l])>=b){b=fabs( A[k][l]);i=k;j=l;}}}}
 if(A[i][i]==A[j][j])
   {theta=pi/4.0;}
 else
 {theta=0.5*atan((2.0*A[i][j])/(A[i][i]-A[j][j]));}
 R=Rotm(i,j,theta,n);
A=prodm(trasm(R,n),n,n,prodm(A,n,n,R,n,n),n,n);
b=0;
 for(int k=0; k<n; k++){for(int l=k; l<n; l++)
  {if(k==l){}else{if(fabs(A[k][l])>=b){b=fabs( A[k][l]);i=k;j=l;}}}}}
while(b>tol);

for (i=0;i<n;i++)
{for (j=0;j<n;j++)
 {if (fabs(A[i][j])<tol)
    A[i][j]=0;
 }
}
return(A);
}
//--------------------------------------------------------------------------------------------
//32:
double** autovectm(double** A,int n, double tol)
{int i, j;double h, theta;double**R;double b=0;
double**U;
U=idm(n);
do
{b=0;
 for(int k=0; k<n; k++){for(int l=k; l<n; l++)
  {if(k==l){}else{if(fabs(A[k][l])>=b){b=fabs( A[k][l]);i=k;j=l;}}}}
 if(A[i][i]==A[j][j])
  {theta=pi/4.0;}
 else
  {theta=0.5*atan((2.0*A[i][j])/(A[i][i]-A[j][j]));}
 R=Rotm(i,j,theta,n);
 A=prodm(trasm(R,n),n,n,prodm(A,n,n,R,n,n),n,n);
 U=prodm(U,n,n,R,n,n);
 b=0;
 for(int k=0; k<n; k++){for(int l=k; l<n; l++)
  {if(k==l){}else{if(fabs(A[k][l])>=b){b=fabs( A[k][l]);i=k;j=l;}}}}}
while(b>tol);
return(U);
}


