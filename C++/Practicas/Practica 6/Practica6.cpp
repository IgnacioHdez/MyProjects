#include <iostream>
#include <cmath>
using namespace std;

//Define constantes matemáticas

const double ne=2.718281828459;

//Primero defino como constantes los datos del ejercicio

const double V0=50*pow(10.0,6.0)*1.6*pow(10.0,-19.0);
const double r0=1.5*pow(10.0,-15.0);

//Despues defino las funciones. fx es una funcion que he usado para comprobar si los metodos funcionaban
double fx(double x){return(x*x-4);}

//fr es la fuerza en funcion del radio
double fr(double r)
{return(-(V0/r0)*(pow(r0/r,2)+(r0/r))*pow(ne,-r/r0));}

//frfr0 es la diferencia del valor de fr con el 1% de fr(r0)
double frfr0(double r)
{return(fr(r)-0.01*fr(r0));}

//Metodo de la biseccion
double biseczerof(double (*f)(double),double x1,double x2,double err)
{
double x3=(x1+x2)/2,i=0;
while(abs(x2-x1)>err)
{x3=(x1+x2)/2;
i=i+1;
if(f(x3)*f(x2)<=0)
    {x1=x3;}
else
    {x2=x3;}
}
cout<<"Iteraciones biseccion="<<i<<endl;
 return (x3);
}

//Metodo de la secante
double seczerof(double (*f)(double),double x1,double x2,double err)
{double x3 , i=0;
 while(fabs(x1-x2)>err)
 {
  x3=x1-f(x1)*((x1-x2)/(f(x1)-f(x2)));
  x2=x1;
  x1=x3;
  i=i+1;
 }
 cout<<"Iteraciones secante="<<i<<endl;
 return (x3);
}

//Metodo de calculo de la derivada de f para Newton
double dervf(double (*f)(double),double x0,double dx)
{return (-f(x0-dx)+f(x0+dx))/(2*dx);}


//Metodo de newton
double newtzerof(double (*f)(double),double x1,double err)
{
double x2=x1-f(x1)/(dervf(f,x1,err/1000000)),dx=x1-x2,i=0;
 while (fabs(dx)>err)
 {
  x2=x1-f(x1)/(dervf(f,x1,err/1000000));
  dx=x1-x2;
  x1=x2;
  i=i+1;
  }
  cout<<"Iteraciones newton="<<i<<endl;
 return(x1);
}


int main()
{cout<<"Practica 6. Ignacio Hernandez-Ros"<<endl<<endl;
double xf=3 , i=0;
while((fr(xf*r0)/fr(r0))>(0.01))
{xf=xf+0.0001;i=i+1;}
cout<<"Iteraciones en el apartado 1="<<i<<endl;
cout<<"Solucion al apartado 1) x="<<xf<<endl<<endl;
cout<<"Solucion al apartado 2) mediante biseccion x="<<biseczerof(frfr0,r0*3,r0*4,0.0001*r0)/r0<<endl<<endl;
cout<<"Solucion al apartado 2) mediante secante x="<<seczerof(frfr0,r0*3,r0*4,0.0001*r0)/r0<<endl<<endl;
cout<<"Solucion al apartado 2) mediante newton x="<<newtzerof(frfr0,r0*4,0.0001*r0)/r0<<endl<<endl;
return 0;
}
