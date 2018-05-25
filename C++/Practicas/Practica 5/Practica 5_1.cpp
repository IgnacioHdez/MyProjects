//Practica 5
//Apartado 1
#include "futil.cpp"
using namespace std;

double mc(int n, double *v)
{double s=0;
for (int i=0;i<n;i++)
{s=s+(v[i]*v[i]);}
return (sqrt(s/n));
}
double ma(int n, double *v)
{double s=0;
for (int i=0;i<n;i++)
{s=s+1/v[i];}
return (n/s);
}

main ()
{
double v[3]={1,2,3};
int n=3;
double m1=mc(n,v);
cout<<"mc="<<m1<<endl;
double m2=ma(n,v);
cout<<"ma="<<m2<<endl;
system ("pause");
return 0;
}
