// sistemas de ec diff
#include<iostream>
#include<cmath>
#include<fstream>
#include <stdlib.h>
  using namespace std;
  // comienza la funcion que muestra la matriz
 void muestra_mat (int fa, int cb, double **C)
{
   for(int i=0;i<fa;i++)
          {
               for(int j=0;j<cb;j++)
                 {
                   cout <<C[i][j]<<"\t"<<"          ";
                 }
             cout<<"\n";
          }
}
   // ACELERACIONES
  double ac1(double x1, double x2, double v1, double v2)
  {
     double k1, k2, m1;
     m1=2;
      k1=2.5;
      k2=3.5;
     double a=k1/m1;
     double b=k2/m1;
  return( -a*x1-b*(x1-x2));

  }

    double ac2(double x1, double x2, double v1, double v2)
  {
     double k2, m2;
     m2=3.5;
     k2=2.5;

     double c=k2/m2;

  return( -c*(x2-x1));

  }
// RUNGE KUTA 4 ORDEN +++++SISTEMA
  void RK4(double x10,double x20,double v10,double v20,double (*ac1)(double,double,double,double),double (*ac2)(double,double,double,double),double t0, double tf,int n,double *x1,double *x2,double *T,double *v1,double *v2)
  {
     double h;
          h=(tf-t0)/n;
          v1[0]=v10;
          v2[0]=v20;
          T[0]=t0;
          x1[0]=x10;
          x2[0]=x20;

          double k1, k2,k3,k4,l1, l2, l3 ,l4;
          for(int i=1; i<n; i++)
      {
          T[i]=T[i-1]+h;
          k1=ac1(x1[i-1],x2[i-1],v1[i-1],v2[i-1]);
          k2=ac1(x1[i-1]+0.5*k1*h, x2[i-1]+0.5*k1*h,v1[i-1],v2[i-1]);
          k3=ac1(x1[i-1]+0.5*k2*h, x2[i-1]+0.5*k2*h,v1[i-1],v2[i-1]);
          k4=ac1(x1[i-1]+h*k3,x2[i-1]+k3*h,v1[i-1],v2[i-1]);

          v1[i]=v1[i-1]+(1.0/6.0)*(k1+2*k2+2*k3+k4)*h;


          l1=ac2(x1[i-1],x2[i-1]);
          l2=ac2(x1[i-1]+0.5*h*l1, x2[i-1]+0.5*l1*h);
          l3=ac2(x1[i-1]+0.5*h*l2, x2[i-1]+0.5*l2*h);
          l4=ac2(x1[i-1]+h+l3,x2[i-1]+l3*h);

          v2[i]=v2[i-1]+(1.0/6.0)*(l1+2*l2+2*l3+l4)*h;

          x1[i]=x1[i-1]+v1[i]*h;
          x2[i]=x2[i-1]+v2[i]*h;

      }



  }


    // COMIENZA EL PROGRAMA
  int main()
  {
      double x10, x20, v10, v20, t0, tf ;
      int n;
      x10=3;
      x20=4;
      v10=0;
      v20=0;
      t0=0;
      tf=100;
      n=1000;
    double *x1;
    x1=new double[n];

    double *x2;
    x2=new double[n];

    double *v1;
    v1=new double[n];

    double *v2;
    v2=new double[n];

    double *T;
    T=new double[n];
  RK4(x10, x20,v10,v20,ac1,ac2,t0,tf,n,x1,x2,T,v1,v2) ;

   //...............................
  double **A;
  int m=3;
   A= new double* [n];
    for(int i=0; i<n; i++)
   {
     A[i]= new double [m];
   }

   for(int i=0; i<n; i++)
   {
      A[i][0]=T[i] ;
      A[i][1]=x1[i] ;
      A[i][2]=x2[i] ;
   }

   muestra_mat (n,m,A);

   ofstream salida("muelle.txt");

    for (int i=0; i<n; i++)
     {
      salida<<"   "<< A[i][0]<<"          "<<A[i][1]<<"         "<<  A[i][2]<<"\n";
     }
     salida.close();


 system("pause");
    return(0);
  }


