//---------------------------------------------------------------------------
#include <iostream>
#include <cstdlib>
#include <ctime>
#include <vcl>
//---------------------------------------------------------------------------
using namespace std;
int main ()
{
int a,b;
cout<< "�Cuantos numeros necesitas? " << endl; // Imprime en pantalla el numero del numero aleatorio para saber al final cuantos se generaron
cin>>a; // Entrada de datos (cuantos n�meros a generar)
cout<< "los numeros aleatorios seran del 0 a este numero --> "; //Pregunta a partir del 0 cual es el m�ximo numero a generar
cin>>b;// Entrada de datos (m�ximo numero del 0 a este, para sortear)
srand (time (0)); //Esta funci�n permite usar una semilla dentro de su par�ntesis a fin de que no se generan series repetitivas "srand ()"
//y usando "time (0)" dentro del par�ntesis de srand (time (0)) logra que la funci�n srand() incorpore la hora del sistema que estamos
// usando como semilla que al ser variable por segundos la vuelve en un constante cambio dando la sensaci�n de aleatoriedad a los resultados obtenidos.
for (int i=1; i<=a; i++){// Condici�n para generar la cantidad de n�meros aleatorios deseada, y usando la variable de entrada a
cout<< i << " ---> "; //Imprime en pantalla el numero Contador de n�meros aleatorios --> Seguido del n�mero generado
cout<< 1+(rand()% b) << endl;//Imprime el numero generado del pues de su contador de n�meros aleatorios
}
system("pause" ) ;
return 0;
}
