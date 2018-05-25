#include "C:\Users\Ignacio\Documents\C++\Futil\futil.cpp"
using namespace std;

double *tridiag(double **A, double *s, int n);

int main()
{
int n=1000;
double **A;
A=numbersm(n,n,0);
double *b;
b=numbersv(n,200);
b[0]=100;
b[n-1]=100;
for (int i=0;i<n;i++)
    {for (int j=0;j<n;j++)
        {if (i==j)
            A[i][j]=4;
        else if (i-j==1)
            A[i][j]=-1;
        else if (j-i==1)
            A[i][j]=-1;
    }   }
// llamada a la funcion Tridiag para resolver el sistema
double *x;
x=numbersv(n,0);
x=tridiag(A,b,n);
// grabamos la solucion
writev(n,x,"sol.txt");
return 0;
}



double *tridiag(double **A, double *s, int n)
{double *a; a=numbersv(n,0);
double *b; b=numbersv(n,0);
double *c; c=numbersv(n,0);
double *x; x=numbersv(n,0);
double *af; af=numbersv(n,0);
double *bt; bt=numbersv(n,0);
double *z; z=numbersv(n,0);
for (int i=0;i<n;i++)
{for (int j=0;j<n;j++)
{if (i==j)
    b[i]=A[i][j];
        else if (i-j==1)
    a[i]=A[i][j];
        else if (j-i==1)
    c[i]=A[i][j];
}}

bt[0]=b[0];
z[0]=s[0];

for (int i=1; i <=n-1; i++)
{af[i]=a[i]/bt[i-1];
bt[i]=b[i]-af[i]*c[i-1];
 z[i]=s[i]-af[i]*z[i-1];}

x[n-1]=z[n-1]/bt[n-1];

for (int i=n-2; i >=0; i--)
{x[i]=(z[i]-c[i]*x[i+1])/bt[i];}
return x;}
