#include <stdlib.h>
#include <iostream>
#include <cmath>
using namespace std;

int main()
{int a;
cout<<"Que quieres calcular?"<<endl<<"\t"<<"1: Bruto"<<endl<<"\t"<<"2: Neto"<<endl<<"\t"<<"3: IVA"<<endl;
cout<<"Escribe el Numero de lo que quieres saber y pulsa Enter"<<endl;
cin>>a;
cout<<endl;

    if (a==1)
        {double neto;
         double iva;
         cout<<"Dime el neto y pulsa enter: ";cin>>neto;cout<<endl;
         cout<<"Dime el iva y pulsa enter: ";cin>>iva;cout<<endl<<endl;
         cout<<"El bruto es: "<<neto*(1+iva/100)<<endl<<endl;}

    if (a==2)
        {double bruto;
         double iva;
         cout<<"Dime el bruto y pulsa enter: ";cin>>bruto;cout<<endl;
         cout<<"Dime el iva y pulsa enter: ";cin>>iva;cout<<endl<<endl;
         cout<<"El bruto es: "<<bruto/(1+iva/100)<<endl<<endl;}

    if (a==3)
        {double bruto;
         double neto;
         cout<<"Dime el bruto y pulsa enter: ";cin>>bruto;cout<<endl;
         cout<<"Dime el neto y pulsa enter: ";cin>>neto;cout<<endl<<endl;
         cout<<"El IVA es: "<<(bruto/neto-1)*100<<endl<<endl;}

system ("pause");
return 0;
}
