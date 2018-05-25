#include "C:\Users\Ignacio\Google Drive\Documentos\C++\Futil\cutil.cpp"
//#include "cutil.cpp"
using namespace std;

int main()
{
angle a1(0);
a1.angledeg(0);
complexnum c1(2,45-a1);
complexnum c2(2,a1-45);
complexnum c3=c1*c2;
cout<<"c1:"<<endl;
c1.plotcomplex();
cout<<"c2:"<<endl;
c2.plotcomplex();
cout<<"c3:"<<endl;
c3.plotcomplex();
system("pause");
return 0;
}
