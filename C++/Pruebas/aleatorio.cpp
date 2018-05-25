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
cout<< "¿Cuantos numeros necesitas? " << endl; // Imprime en pantalla el numero del numero aleatorio para saber al final cuantos se generaron
cin>>a; // Entrada de datos (cuantos números a generar)
cout<< "los numeros aleatorios seran del 0 a este numero --> "; //Pregunta a partir del 0 cual es el máximo numero a generar
cin>>b;// Entrada de datos (máximo numero del 0 a este, para sortear)
srand (time (0)); //Esta función permite usar una semilla dentro de su paréntesis a fin de que no se generan series repetitivas "srand ()"
//y usando "time (0)" dentro del paréntesis de srand (time (0)) logra que la función srand() incorpore la hora del sistema que estamos
// usando como semilla que al ser variable por segundos la vuelve en un constante cambio dando la sensación de aleatoriedad a los resultados obtenidos.
for (int i=1; i<=a; i++){// Condición para generar la cantidad de números aleatorios deseada, y usando la variable de entrada a
cout<< i << " ---> "; //Imprime en pantalla el numero Contador de números aleatorios --> Seguido del número generado
cout<< 1+(rand()% b) << endl;//Imprime el numero generado del pues de su contador de números aleatorios
}
system("pause" ) ;
return 0;
}
