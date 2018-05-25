//Practica 2
//Apartado 2
#include <iostream>
#include <cmath>
using namespace std;
main()
{int n=10;
cout<<"WHILE: "<<endl;

while (n<=100)
{cout<<n<<endl;n=n+10;}
cout<<endl<<"FOR: "<<endl;

for (n=10;n<=100;n=n+10)
{cout<<n<<endl;}

n=10;
cout<<endl<<"DO WHILE: "<<endl;

do{cout<<n<<endl;n=n+10;}while (n<=100);
system("pause");
return 0;
}
