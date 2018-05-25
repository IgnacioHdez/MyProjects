//Practica 5
//Apartado 2
#include "futil.cpp"
using namespace std;
main ()
{double v[3]={2,2,0};
double w[3]={1,0,0};
cout<<"v=";plotv(3,v);cout<<"w=";plotv(3,w);
double pe=prodescv(3,v,w);
cout<<"v*w="<<pe<<endl;
double nv=normv(3,v);
cout<<"v*v="<<nv<<endl;
double a=angv(3,v,w);
cout<<"v^w="<<cos(a)<<endl;
system ("pause");
return 0;}
