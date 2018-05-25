//Ignacio Hernandez-ROs
// Practica 12
#include "futil.cpp"
using namespace std;

double f(double x)
{return(x*x*exp(-x));}

double g(double x)
{return(2.0/(x*x-4.0));}

double h(double x)
{return(sin(pi*x));}

double trap(double (*f)(double), double a, double b,int n)
{double s=0;
 double h =(b-a)/n;
 for(int i=1;i<n;i++ )
 {s=s+f(a+h*i);}
 return((h/2.0)*(f(a)+f(b)+2.0*s));}

double simp1(double (*f)(double), double a, double b,int n)
{while(n%2!=0){n++;}
 double h=(b-a)/n;double s2=0;double s4=0;
 for(int i=1;i<n; i++)
 {if (i%2==0){s2=s2+f(a+h*i);}
  else{s4=s4+f(a+h*i);}}
return((h/3)*(f(a)+f(b)+2*s2+4*s4));}

double simp2(double (*f)(double), double a, double b,int n)
{while(n%3!=0){n++;cout<<"n=:"<<n<<endl;}
 double h=(b-a)/n;double s3=0;double s2=0;
 for(int i=1;i<n;i++)
 {if(i%3==0){s2=s2+f(a+h*i);}
  else{s3=s3+f(a+h*i);}}
 return((3.0*h/8.0)*(f(a)+f(b)+3*s3+2*s2));}

int main()
{double** mtr;mtr=numbersm(300,2,1);
double** nsm1;nsm1=numbersm(15,2,2);
double** nsm2;nsm2=numbersm(10,2,3);

for(int i=0;i<300;i++)
{mtr[i][0]=i+1;
 mtr[i][1]=trap(f,0,1,i+1);}
writem(300,2,mtr,"intftrap.txt");
for(int i=0;i<15;i++)
{nsm1[i][0]=2*(i+1);
 nsm1[i][1]=simp1(f,0,1,2*(i+1));}
writem(15,2,nsm1,"intfsimp1.txt");
for(int i=0;i<10;i++)
{nsm2[i][0]=3*(i+1);
 nsm2[i][1]=simp2(f,0,1,3*(i+1));}
writem(10,2,nsm2,"intfsimp2.txt");

cout<<endl<<"Error calculado mediante Valor exacto-Valor hallado:"<<endl;
cout<<endl<<"1. Error en f: "<<endl;
cout<<"   a. Trapecio: "<<2-5/exp(1)-mtr[299][1]<<endl;
cout<<"   b. Simpson 1/3: "<<2-5/exp(1)-nsm1[14][1]<<endl;
cout<<"   c. Simpson 3/8: "<<2-5/exp(1)-nsm2[9][1]<<endl<<endl;


for(int i=0;i<300;i++)
{mtr[i][0]=i+1;
 mtr[i][1]=trap(g,0,0.35,i+1);}
writem(300,2,mtr,"intgtrap.txt");
for(int i=0;i<15;i++)
{nsm1[i][0]=2*(i+1);
 nsm1[i][1]=simp1(g,0,0.35,2*(i+1));}
writem(15,2,nsm1,"intgsimp1.txt");
for(int i=0;i<10;i++)
{nsm2[i][0]=3*(i+1);
 nsm2[i][1]=simp2(g,0,0.35,3*(i+1));}
writem(10,2,nsm2,"intgsimp2.txt");

cout<<endl<<"2. Error en g: "<<endl;
cout<<"   a. Trapecio: "<<0.5*log(1.65/2.35)-mtr[299][1]<<endl;
cout<<"   b. Simpson 1/3: "<<0.5*log(1.65/2.35)-nsm1[14][1]<<endl;
cout<<"   c. Simpson 3/8: "<<0.5*log(1.65/2.35)-nsm2[9][1]<<endl<<endl;

for(int i=0;i<300;i++)
{mtr[i][0]=i+1;
 mtr[i][1]=trap(h,0,1,i+1);}
writem(300,2,mtr,"inthtrap.txt");
for(int i=0;i<15;i++)
{nsm1[i][0]=2*(i+1);
 nsm1[i][1]=simp1(h,0,1,2*(i+1));}
writem(15,2,nsm1,"inthsimp1.txt");
for(int i=0;i<10;i++)
{nsm2[i][0]=3*(i+1);
 nsm2[i][1]=simp2(h,0,1,3*(i+1));}
writem(10,2,nsm2,"inthsimp2.txt");

cout<<endl<<"3. Error en h: "<<endl;
cout<<"   a. Trapecio: "<<2/pi-mtr[299][1]<<endl;
cout<<"   b. Simpson 1/3: "<<2/pi-nsm1[14][1]<<endl;
cout<<"   c. Simpson 3/8: "<<2/pi-nsm2[9][1]<<endl<<endl;

system ("PAUSE");
return 0;}
