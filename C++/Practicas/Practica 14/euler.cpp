#include"C:\Users\Ignacio\Google Drive\Documentos\C++\Futil\futil.cpp"

using namespace std;

double dydx(double x, double y)
{double l=9.81/(57*57);
 return(9.81-l*y*y);}

double f(double x)
{double l=9.81/(57*57);
return tanh(sqrt(9.81*l)*x)*sqrt(9.81/l);}

double* euler(double (*dydx)(double,double),double* x,int n,double y0)
{double h;double* y=numbersv(n,0);
 y[0]=y0;
 for(int i=1; i<n; i++)
 {h=(x[i]-x[i-1]);
  y[i]=y[i-1]+h*dydx(x[i-1],y[i-1]);}
 return y;}

int main()
{int n=20;
 double y0=0;
 double x0=0;
 double xf=30;
 double *x=linspacev(x0,xf,n);
 double *yeu=euler(dydx,x,n,y0);
 double *yrk=edof(dydx,x,n,y0);
 double *ytc=numbersv(n,0);
 double **A=numbersm(n,4,0);
 for(int i=0; i<n; i++)
 {ytc[i]=f(x[i]);
  A[i][0]=x[i];
  A[i][1]=yeu[i];
  A[i][2]=yrk[i];
  A[i][3]=ytc[i];}
 writem(n,4,A,"vel.txt");
 matplotv(n,x,"x.txt",yeu,"yeu.txt","ploteu.m");
 matplotv(n,x,"x.txt",yrk,"yrk.txt","plotrk.m");
 matplotv(n,x,"x.txt",ytc,"ytc.txt","plottc.m");
 system("pause");
return(0);}
