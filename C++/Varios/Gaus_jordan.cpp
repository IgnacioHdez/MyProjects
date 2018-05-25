// gauss jordan
#include <iostream>
#include <cmath>
#include <fstream>
#include <twitcurl.h>
const int n=5;
const double tolerancia=1e-7;
using namespace std;
int main()
{
double a[n][n]={{-5,1,1,1,1},{1,-5,1,1,1},{1,1,-5,1,1},{1,1,1,-5,1},{1,1,1,1,-5}};
double b[n]={14,-10,4,6,12};
double x[n];
   for(int j = 0; j<=n - 2; j++)
      {   // bucle desde 0 hasta n-2 para recorrer todas las columnas excepto la última.
        double pivote =fabs(a[j][j]);
        int filapivote = j;
        double temp;
           for(int i=j+1; i<=n-1; i++)
              { // encuentra la fila pivote dentro de cada columna. pivoteo
                 if (fabs(a[i][j]) > pivote)
                     {
                       pivote=fabs(a[i][j]);
                       filapivote=i;
                     }
              } // final bucle en i
          if (filapivote != j )
           { // intercambia filas en caso de ser necesario
              for(int k=0; k<=n-1; k++)
                { // intercambia filas dadas por j y filapivote
                   temp = a[j][k];
                   a[j][k] = a[filapivote][k];
                   a[filapivote][k] = temp;
                } // final bucle en k
              temp = b[j];
              b[j] = b[filapivote];
              b[filapivote] = temp;
            }
           for (int i=j+1; i<=n-1; i++)
              { //Calcula y almacena las razones de coeficientes. Matriz L.
                a[i][j]= a[i][j]/ a[j][j];
                for (int k=j+1; k<=n-1; k++)
                   { // calcula los otros terminos, resultantes de hacer la resta
                      a[i][k]=a[i][k]-a[i][j]*a[j][k];
                   } // final bucle en k
                 b[i]=b[i]-a[i][j]*b[j];
               } // final bucle en i
     } // final bucle en j (el del comienzo) // Sustitución regresiva ? Solución
 x[n-1] = b[n-1]/a[n-1][n-1];
 for (int j=n-2; j>=0; j--)
     {
        x[j]=b[j];
        for (int k=j+1; k<=n-1; k++)
           {
               x[j]=x[j]-x[k]*a[j][k];
           } // final bucle en k
x[j]=x[j]/a[j][j];
} // final bucle en jMÉ
cout<<"\n"<<"La solucion con auss jorda es: "<<"\n";
for (int i=0; i<n; i++)
    {
       cout<<"x"<<i+1<<"= "<<x[i]<<endl;
    }

 return(0);
}
