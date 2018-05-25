// Practica 7
#include "C:\Users\Ignacio\Documents\C++\Futil\futil.cpp"
using namespace std;

int main ()
{double** A;double** b;double **X;
int fa=5;
A=loadmat(fa,fa,"coef.txt");
plotm(fa,fa,A);
b=loadmat(fa,1,"tindep.txt");
plotm(fa,1,b);
X=LU(A,fa,fa,b);
cout<<"La solucion es:"<<endl;
plotm(fa, 1, X);
writemat(fa,1,X,"sol.txt");
system ("pause");
return 0;
}
