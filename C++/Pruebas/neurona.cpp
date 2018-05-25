#include"C:\Users\Ignacio\Google Drive\Documentos\C++\Futil\futil.cpp"
using namespace std;

class neuron {
  public:
       double q;
       double answer;
       double qmax;
       //Constructor
       neuron(double carga, double V)
           {q=carga;
           answer=0;
           qmax=V;}

      // Metodos

      void readstate ()
      {cout<<q<<endl;}

      //Tengo que actualizar este metodo para que se cargue como un condensador
      void charge (double qplus)
      {answer=0;
      q += qplus;
      if (q>qmax)
       {answer=q;
        q=0;
       }
      }
      //Tengo que hacer un metodo para que me de la respuesta de la neurona
};

class network
{public:
    //Variables

    int n;
    double** S;
    double** P;
    neuron **neurons;


    //Constructor

    network(int number)
    {//Ahora van las neuronas
    n=number;
    neurons = new neuron*[n];
    for (int i=0; i<n; i++)
    {neurons[i] = new neuron(0,10);}
    //(*neurons[i]).readstate();
    //Ahora va la matriz de sinapsis

        srand(time (0));

        S=numbersm(n,n,1);
        for (int i=0;i<n;i++)
        {for (int j=0;j<n;j++)
            {if (i==j)
                {S[i][j]=0;}
             else
                {double r=rand()%10000;
                    S[i][j]=(r/1000)-5;}
            }
        }
        S[0][n-1]=0;
        S[n-1][0]=0;


     //Ahora va la matriz de probabilidad de conexión
        P=numbersm(n,n,1);
        for (int i=0;i<n;i++)
        {for (int j=0;j<n;j++)
            {if (i==j)
                {P[i][j]=0;}
             else
                {double r=rand()%10000;
                 P[i][j]=r/10000;}
            }
        }
        P[0][n-1]=0;
        P[n-1][0]=0;

}

//Metodos

double result(double input)
{

}

void train(int nexp, double* inputs, double* outputs,double eps)
{
}

};

int main() {
int n=3;
int m=10;
network try1(n);
for (int i=0; i<100; i++)

//plotm(n,n,try1.S);
//plotm(n,n,try1.P);
system("pause");
return 0;}
