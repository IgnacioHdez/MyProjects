// Practica 8
#include "C:\Users\Ignacio\Documents\C++\Futil\futil.cpp"
using namespace std;

double* jac(double** A,int n , double* b,double err)
{int c=0;

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
          {x[i]=x[i]-(A[i][j]/A[i][i])*oldx[j];}
 }dx[i]=fabs(x[i]-oldx[i]);}
 c++;}while ((normv(n,dx))>err);
cout<<"Iteraciones por jacobi: "<<c<<endl;
return(x);}

double* gssystemit(double** A,int n , double* b,double err, double fr)
{int c=0;
double *oldx; double *x; double dx[n];
oldx=numbersv(n,0);
x=numbersv(n,0);
for(int i=0; i<n; i++)
 {x[i]=b[i]/A[i][i];}
do
 {for (int i=0; i<n; i++)
  {oldx[i]=x[i];}
  for (int i=0; i<n; i++)
   {x[i]=oldx[i]+fr*b[i]/A[i][i];
     for (int j=0; j<n; j++)
        {if (j!=i)
          {x[i]=x[i]-fr*(A[i][j]/A[i][i])*x[j];}
         else
         {x[i]=x[i]-fr*oldx[j]*(A[i][j]/ A[i][i]);}
        }dx[i]=fabs(x[i]-oldx[i]);
    }
 c++;}while ((normv(n,dx))>err);
cout<<"Iteraciones por gauss: "<<c<<endl;
return(x);}

int main ()
{double** A;double* b;double *x;double* y;double* z;double* w;
int fa;
cout<<"Dimension de A: ";
cin>>fa;
cout<<endl;
A=loadm(fa,fa,"coef.txt");
plotm(fa,fa,A);
b=loadv(fa,"tindep.txt");
plotv(fa,b);
cout<<endl;
x=lusystem(A,fa,fa,b);
cout<<"La solucion por LU es:"<<endl;
plotv(fa,x);cout<<endl;
y=jac(A,fa,b,1e-7);
cout<<"La solucion por jacobi es:"<<endl;
plotv(fa,y);cout<<endl;
z=gssystemit(A,fa,b,1e-7,1);
cout<<"La solucion por gauss es:"<<endl;
plotv(fa,z);cout<<endl;
w=gssystemit(A,fa,b,1e-7,1.3);
cout<<"La solucion por gauss con sobrerelajacion w = 1.3 es:"<<endl;
plotv(fa,w);cout<<endl;
writev(fa,x,"sol.txt");
system ("pause");
return 0;}
