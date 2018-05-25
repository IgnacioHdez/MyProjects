//Practica 9
#include "C:\Users\Ignacio\Documents\C++\Futil\futil.cpp"
using namespace std;

int main()
{
int n=4;
double **A;
A=loadm(n,n,"ma.txt");

plotm(n,n,A);

double **b;
b=loadm(n,1,"b.txt");
double **Ain;
Ain=invm(A,n);
cout<<endl<<"Solucion="<<endl;
plotm(n,1,prodm(Ain,n,n,b,n,1));
writem(n,1,prodm(Ain,n,n,b,n,1),"sol.txt");
system ("pause");
return 0;
 }
