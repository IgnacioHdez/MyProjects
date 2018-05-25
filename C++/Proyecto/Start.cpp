// Proyecto
#include "C:\Users\Ignacio\Google Drive\Documentos\C++\Futil\futil.cpp"
using namespace std;

int main()
{int n, sel, cont=0;
double**A;
double**B;
while (cont==0)
 {cout<<"Elija condiciones:"<<endl<<"1: Sistema solar"<<endl<<"2: Jupiter y sus lunas"<<endl<<"3: Condiciones generadas"<<endl;cin>>sel;
    {if(sel==1)
    {B=loadm(1,3,"Casos/condsolar.txt");
     n=B[0][0];
     A=loadm(n,7,"Casos/initsolar.txt");
     writem(n,7,A,"Casos/init.txt");
     writem(1,3,B,"Casos/cond.txt");
     cont=1;}
    if(sel==(int)2)
    {cont=1;
     B=loadm(1,3,"Casos/condjupiter.txt");
     n=B[0][0];
     A=loadm(n,7,"Casos/initjupiter.txt");
     writem(n,7,A,"Casos/init.txt");
     writem(1,3,B,"Casos/cond.txt");
     cont=1;
    }
    if(sel==3)
     B=loadm(1,3,"Casos/condgen.txt");
     n=B[0][0];
     A=loadm(n,7,"Casos/initgen.txt");
     writem(n,7,A,"Casos/init.txt");
     writem(1,3,B,"Casos/cond.txt");
     cont=1;
    }
 }
system("sim.exe");
return 0;
}
