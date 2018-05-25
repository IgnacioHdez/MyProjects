// Practica 11
#include "futil.cpp"
using namespace std;

int main()
{
int n=4;
double **A;
double **U;
double **Ad;
A=loadm(n,n,"A.txt");
cout<<"A:"<<endl;
plotm(n,n,A);
Ad=diagm(A,n,1e-10);
U=autovectm(A,n,1e-10);
cout<<"A diagonal:"<<endl;
plotm(n,n,Ad);
cout<<"U:"<<endl;
plotm(n,n,U);
cout<<endl<<"Comprobaciones:"<<endl<<"Suma de la diagonal de A:"<<endl;
double s=0;
for(int i=0; i<n; i++)
    s=s+A[i][i];
cout<<s<<endl;
s=0;
cout<<endl<<"Suma de la diagonal de A diagonalizada:"<<endl;
for(int i=0; i<n; i++)
    s=s+Ad[i][i];
cout<<s<<endl;
writem(n,n,Ad,"sol.txt");
system ("pause");
return(0);
}




