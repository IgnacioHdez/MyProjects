//Practica 2
//Apartado 1
#include <iostream>
#include <cmath>
using namespace std;
main()
{float x, end=1;
while (end==1)
{cout<<"x:";
cin>>x;
double t=1, i=0, p=1, r=1;
while (r>=0.00001)
      {p=p+t*x/(i+1);
      t=t*x/(i+1);
      i=i+1;
      cout<<p<<endl;
      r=fabs(t);}
cout<<"END"<<endl;
cout<<"Repetir (1/0):";
cin>>end;
}
return 0;
}

