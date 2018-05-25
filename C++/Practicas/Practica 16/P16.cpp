#include"C:\Users\Ignacio\Google Drive\Documentos\C++\Futil\futil.cpp"
using namespace std;


//y''=p(t)y'+q(t)y+r(t)
double p(double t)
{return (-2/t);}
double q(double t)
{return (0);}
double r(double t)
{return (0);}
double u(double t)
{return ((110.0*0.05/t)*((0.1-t)/(0.05)));}

void difin(double *t, int n, double* y)
{double **A;
double *f=numbersv(n-2,0);
double h;
A=numbersm(n-2,n-2,0);

double* w=numbersv(n-2,0);
h=(t[0]-t[n])/n;

//Relleno la matriz A
   for(int i=0; i<n-2; i++)
   {for(int j=0; j<n-2; j++)
      {A[i][j]=0;
      if (i==j)
      {A[i][j]=2+h*h*q(t[i+1]);}
      if (i==j-1)
      {A[i][j]=-1-1*h*p(t[i+1])/2;}
      if (i==j+1)
      {A[i][j]=-1+h*p(t[i+1])/2;}
      }
   }
//plotm(n-2,n-2,A);
//Relleno el vector f
   for(int i=0; i<n-2; i++)
   {f[i]=-h*h*r(t[i+1]);}
f[0]=f[0]-y[0]*(-1-h*p(t[1])/2);
f[n-3]=f[n-3]-y[n-1]*(-1+h*p(t[n-2])/2);
//    plotv(n-2,f);

//Resuelvo el sistema A*x=f

w=lusystem(A,n-2,n-2,f);
//plotv(n-2,w);
for (int i=1;i<n-1;i++)
{y[i]=w[i-1];}

//y=lusystem(A,n,f);
}

int main()
{double*t;
double*y;
double y0, yf, t0, tf;
int n;
y0=110;
yf=0;
t0=0.05;
tf=0.1;
n=10;
t=linspacev(t0,tf,n);
y=numbersv(n,0);
y[0]=y0;
y[n-1]=yf;
difin(t,n,y);
double* er=numbersv(n,0);
double* U=numbersv(n,0);
for (int i=0;i<n;i++)
{U[i]=u(t[i]);
er[i]=u(t[i])-y[i];}
plotv(n,er);
system("pause");
return 0;
}
