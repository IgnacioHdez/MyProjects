// jacobi y gaus seidel punteros
#include <iostream> 
#include <cmath> 
#include <fstream> 
const int n=5;
const double tolerancia=1e-7;
using namespace std; 
//Cuerpo de las funciones
//comienz la función qe me calcula el PRODUCTO ESCALAR
float producto_escalar(double a[], double b[], int n) 
{ 
float sum=0; 
for (int i=0;i<n; i++) 
       {
          sum= sum+ a[i]*b[i]; 
       }
double pe=sum;       
return pe;
}
// comienza función qe calcula NORMA
float norma( double a[], int n) 
{ 
float x , norm; 
x = producto_escalar(a, a, n); 
norm = sqrt(x); 
return norm; 
}

void jacobi(double A[n][n], double b[n], double x[n], const int n)
{
double oldx[n];
int c=0;
//Primera aproximación de x. 
for(int i=0; i<n; i++)
  {
     x[i]=b[i]/A[i][i]; 
  }
  
do
   {
      for (int i=0; i<n; i++)
         {
          oldx[i]=x[i];
         }
      for (int i=0; i<n; i++)
         {
              x[i]=b[i]/A[i][i];
              for (int j=0; j<n; j++)
                {
                  if (j!=i) //si  j distinto de i
                     {
                         x[i]=x[i]- (   (A[i][j]/A[i][i])*oldx[j]   );
                     }
                }
         }
      c=c+1; // contador de iteraciones 
      }
while ((fabs(norma(x, n)-norma(oldx,n)))>tolerancia);

cout<<"\n"<<"La solucion con Jacobi es: "<<"\n"; 
for (int i=0; i<n; i++) 
    { 
       cout<<"x"<<i+1<<"= "<<x[i]<<endl; 
    } 
cout<<"Iteracciones con Jacobi: "<<c<<"\n";
}
//comenza la función Gauss- seidel
void gauss_seidel (double A[n][n], double b[n], double x[n], const int n)
{
double oldx[n]; 
int c=0;
//Vamos a hacer una primera aproximación de x.
for(int i=0; i<n; i++)
     {
       x[i]=b[i]/A[i][i]; 
     }
do 
  {
      for (int i=0; i<n; i++)
         {
            oldx[i]=x[i];
         }
      for (int i=0; i<n; i++)
         {
              x[i]=b[i]/A[i][i];
              for (int j=0; j<n; j++)
                  {
                     if (j!=i)
                        {
                           x[i]=x[i]-(A[i][j]/A[i][i])*x[j];
                        }
                  }
         }
   c=c+1;
  }
while ((fabs(norma(x, n)-norma(oldx,n)))>tolerancia);
cout<<"\n"<<"La solución con Gauss-Seidel es: "<<"\n"; 
for (int i=0; i<n; i++) 
   { 
        cout<<"x"<<i+1<<"= "<<x[i]<<endl; 
   } 
cout<<"Iteracciones con Gauss-Seidel: "<<c<<"\n";
} 
// comienza el programa principal
int main() 
{ 
double A[n][n]={-5,1,1,1,1,1,-5,1,1,1,1,1,-5,1,1,1,1,1,-5,1,1,1,1,1,-5}; 
double b[n]={14,-10,4,6,12}; 
double x[n]; 
 
cout<<"La matriz A introducida es: "<<"\n"; 
for (int i=0; i<n; i++) 
   {
    for (int j=0; j<n; j++) 
       { 
         cout<<A[i][j]<<" "; 
         if (j==n-1) 
            {
               cout<<"\n";
            } 
       }
    }     
cout<<"\n"<<"El vector b es : "<<"\n"; 
for (int i=0; i<n; i++) 
   { 
     cout<<b[i]<<" "<<endl; 
   } 
jacobi(A, b, x, n);
gauss_seidel (A, b, x, n);
 
system ("PAUSE"); 
return 0; 
} 
 
