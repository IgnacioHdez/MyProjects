#include <iostream> 
#include <cmath> 
#include <fstream> 
using namespace std; 
int main()
{ofstream sal("Datos2.txt");
 ifstream ent("Datos1.txt");
 float a;
  while (ent.eof()==0)
  {ent>>a;
  cout<<a<<"->"<<sqrt(a);
   if (a>=1){sal<<sqrt(a)<<" ";cout<<" Grabado"<<endl;}
   else  {cout<<" No grabado"<<endl;}
  }
 sal.close();
 ent.close();
 system("pause");
 return 0;
}
