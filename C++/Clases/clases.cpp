#include"C:\Users\Ignacio\Google Drive\Documentos\C++\Futil\cutil.cpp"

using namespace std;

class particle {
   private:
      // Datos que no puedo acceder
   public:
       double *r, *v, m, q;
       //Constructor
       particle(double* rq, double* vq, double masa, double carga)
           {r=rq;
            v=vq;
            m=masa;
            q=carga;}

      // Funciones

      void lee ()
      {cout<<"Posicion:"<<endl;
       plotv(3,r);
       cout<<"Velocidad:"<<endl;
       plotv(3,v);
       cout<<"Masa, Carga:"<<endl;
       cout<<m<<", "<<q<<endl;}
};

/*Operador suma de particulas
      particula operator +(particula p1,particula p2)
      {double* v1=p1.posicion();
      double* v2=p2.posicion();
      double* v3=numbersv(3,3);
      for (int i=0;i<3;i++)
      {v3[i]=v1[i]+v2[i];};
      particula p3(v3[0],v3[1],v3[2],1,1);
      return p3;}


class settime {
   public:
       double t, dt;
       //Construdtor
       settime(double t0,double tf,int N)
       {t=t0;
        dt=(tf-t0)/double(N);}
       //Funciones
       void step(int i)
       {t=t+dt*i;}

};
*/
class sim {
public:
    int n;


};

int main() {
double* r1=numbersv(3,0);
double* v1=numbersv(3,0);
r1[0]=1;
r1[1]=2;
r1[2]=3;
v1[0]=4;
v1[1]=5;
v1[2]=6;
   particle p1(r1,v1,10,20);
   p1.lee();

settime t1(0,10,100);
t1.step(1);
cout<<t1.t;
   return 0;
}
