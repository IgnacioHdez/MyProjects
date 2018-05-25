#include "fungo.cpp"
 using namespace std;

 int main()
 {int n=5,m=5;
  double **B=loadmat(n,m);
  plotm(n,m,B);
  system("pause");
  return 0;
 }
