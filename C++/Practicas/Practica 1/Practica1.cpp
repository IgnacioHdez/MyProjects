//Practica 1
#include <iostream>
#include <cmath>
using namespace std;
main()
      {float ap;
      cout<<"Apartado (1,2,3): ";
      cin>>ap;
      if (ap==1)
         {float end=1;
         {while (end==1)
         {cout<<"Numero de pasos: "<<endl;
         float n;
         cin>>n;
         float i=1;
         double s=0;
                while (i<=n)
                {s=s+1/(i*i);i=i+1;}
         cout<<sqrt(6*s)<<endl;
         cout<<"Repetir (1/0): ";
         cin>>end;}}        
         return 0;}
      if (ap==2)
         {
                
                }      
      if (ap==3)   
         {float n;
         
         double s=1, p=1;
         for (n=0;n<=100;n=n+1)
             {for (s=1;s<=n;s=s+1){p=p*s;}cout<<p<<endl;}
         cin>>n;
         return 0;}
      }
