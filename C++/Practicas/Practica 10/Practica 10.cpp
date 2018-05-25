#include "futil.cpp"
using namespace std;

double f(double x, double y, double z)
{return x*cos(y)-2.0/3.0;}
double g(double x, double y, double z)
{return cos(z)+0.91*x*sin(y+z)-1.22;}
double h(double x, double y, double z)
{return 0.76*x*cos(y+z)-sin(z);}

int main()
{cout<<"Practica 10:"<<endl<<endl<<"Apartado a)"<<endl<<endl;;
double* x0;
x0=numbersv(3,0.1);
x0[0]=1;
cout<<"Valores iniciales para (I,fi,delta):"<<endl;
plotv(3,x0);cout<<endl;
double* x;
x=newrap3(f,g,h,x0,1e-7);
cout<<"Solucion:"<<endl;
plotv(3,x);cout<<endl<<"------------------------"<<endl<<endl<<"Apartado b)"<<endl<<endl;
double* y0;
y0=numbersv(3,1);
cout<<"Valores iniciales para (I,fi,delta):"<<endl;
plotv(3,y0);cout<<endl<<"Solucion:"<<endl;
double* y;
y=newrap3(f,g,h,y0,1e-7);
plotv(3,y);
cout<<"La discusion de los resultados se hara en el informe"<<endl;
system("pause");
return 0;
}
