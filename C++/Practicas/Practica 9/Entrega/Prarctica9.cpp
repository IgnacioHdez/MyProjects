//Practica 9
#include "futil.cpp"
using namespace std;

int main()
{
int n=4;
double **A;
A=numbersm(n,n,1);
for (int i=0;i<n;i++)
{for (int j=0; j<n; j++)
A[i][j]=A[i][j]/(i+j+1);
}
cout<<"A:"<<endl;
plotm(n,n,A);
double **b;
b=numbersm(n,1,1);
for (int i=0;i<n;i++)
{for (int j=0;j<1;j++)
b[i][j]=1;
}
cout<<"b:"<<endl;
plotm(n,1,b);
double **Ain;
Ain=invm(A,n);
cout<<endl<<"Solucion="<<endl;
plotm(n,1,prodm(Ain,n,n,b,n,1));
writem(n,1,prodm(Ain,n,n,b,n,1),"sol.txt");
system ("pause");
return 0;
 }
