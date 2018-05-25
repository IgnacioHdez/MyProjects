
#include <iostream>
#include <string>
#include <cmath>
using namespace std;
class angulo {

public:
// variables
double grados; int  vueltas;
//constructores
angulo(double gr_in){
vueltas=0;
    if (gr_in >=0){
              while (gr_in>=360) {gr_in=gr_in-360; vueltas=vueltas+1;}

                 }
    else
    {
        while(abs(gr_in)>=360){gr_in=gr_in+360; vueltas=vueltas-1;}
        if(gr_in<0){gr_in=360+gr_in; vueltas= vueltas-1;}
    }

    grados=gr_in;
                    }

 angulo(){}

// funciones
     void mos_angulo()
     {

       cout<<"\n"<<"grados: "<<this->grados<<"\n"<<"vueltas: "<<this->vueltas;
     }

};
// OPERADORES
 angulo operator + (angulo a, angulo b)
  {

    double gra, vlt;
      gra=a.grados+b.grados;
      vlt=a.vueltas+b.vueltas;
     gra=gra+360*vlt;

    angulo c (gra);
   return(c);
  }





int main ()
{
angulo a (390);
angulo b (50);

angulo c=a+b;
c.mos_angulo();
return (0);
}
