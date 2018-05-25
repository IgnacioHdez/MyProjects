// Practica 13
#include "C:\Users\Ignacio\Google Drive\Documentos\C++\Futil\futil.cpp"
using namespace std;

double xt(double t)
{return (10*(log(t+1))*(t+1));}
double vt(double t)
{return (10*(1+log(t+1)));}
double act(double t)
{return (10/(t+1));}

int main()
{double** V=loadm(100,2,"velocidad.txt");
double* x=numbersv(100,0);double* v=numbersv(100,0); double* a=numbersv(100,0); double* t=numbersv(100,0);
for (int i=0;i<100;i++)
{v[i]=V[i][1];t[i]=V[i][0];}
matplotv(100,t,"t.txt",v,"vel.txt","vel.m");
matplotf(vt,0,10,100,"t.txt","veltrc.txt","veltrc.m");
a=dervxy(100,t,v);
matplotv(100,t,"t.txt",a,"aceleracion.txt","acel.m");
matplotf(act,0,10,100,"t.txt","aceleraciontrc.txt","aceltrc.m");
x=integralxy(100,t,v);
matplotv(100,t,"t.txt",x,"posicion.txt","pos.m");
matplotf(xt,0,10,100,"t.txt","posiciontrc.txt","postrc.m");
system ("pause");
return 0;
}
