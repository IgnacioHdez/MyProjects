//Practica 5
//Apartado 2
#include "futil.cpp"
using namespace std;

double Fx(double (*f)(double),double x0)
{
    if(f(x0)<1){return (2.5);}
    if(f(x0)<2){return (2);}
    if(f(x0)<3){return (1.5);}
    if(f(x0)>=3){return (1);}
}

double gx(double x)
{
    return(4*sin(x));
}

main ()
{
double x;
double vx[40], vy[40];
int i=0;
for (x=0;x<=4;x=x+0.1)
   {vx[i]=x;
   vy[i]=gx(x);
   cout<<"x="<<x<<"   g(x)="<<gx(x)<<"   F(g(x))="<<Fx(gx,x)<<endl;
   i=i+1;
}
matplot(40,vx,vy);
system("pause");
return 0;
}
