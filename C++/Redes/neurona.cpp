#include"C:\Users\Ignacio\Google Drive\Documentos\C++\Futil\futil.cpp"
using namespace std;

class neuron {
  public:
       double q;
       double qmax;
       //Constructor
       neuron(double carga, double V)
           {q=carga;
           qmax=V;}

      // Metodos

      void readstate ()
      {cout<<q;}

      //Tengo que actualizar este metodo para que se cargue como un condensador
      void charge (double qplus)
      {q += qplus;}

      int respuesta()
      {if (q>qmax)
        {q=0;
         return 1;}
       if (q<(-1*qmax))
        {q=0;
         return -1;}

        return 0;}

//Tengo que hacer un metodo para que me de la respuesta de la neurona
};

class network {
    public:
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
          {neurons[i] = new neuron(0,5);}

        //Ahora va la matriz de sinapsis

         srand(time (0));
         S=numbersm(n,n,1);
         for (int i=0;i<n;i++)
         {for (int j=0;j<n;j++)
          {if (i==j)
           {S[i][j]=0;}
           else
          {double r=rand()%100;
           S[i][j]=(r/50)-1;}
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
          {double r=rand()%100;
           P[i][j]=r/100+0.3;}
           //P[i][j]=1;}
         }
        }
    P[0][n-1]=0;
    P[n-1][0]=0;
  }

//Metodos

//Esta función me permite manipular la neurona i

void change(int numb, neuron n1)
{
 (*neurons[numb])=n1;
}

//Esta función me permite cargar la neurona i

void chargeneuron(int numb, double qmas)
{
 (*neurons[numb]).charge(qmas);
}

//Esta función me permite mostrar el estado de la red
void readstate()
{for (int i=0;i<n;i++)
{(*neurons[i]).readstate();
 cout<<","<<(*neurons[i]).respuesta()<<endl;}

}

//--Esta función avanza un paso en la red--

int step()
 {//Primero creo el vector donde voy a guardar lo que emite cada una
     int* v = new int[n];
     for (int i=0; i<n; i++)
     {v[i]=(*neurons[i]).respuesta();}


  //Ahora le sumo a cada una lo que le corresponde
    for (int i=0; i<n; i++)
     {for (int j=0; j<n; j++)

      {double qmas=0;
       double r=rand()%100;
       double p=r/100;
       if (p<P[i][j])
       {qmas+=v[j]*S[i][j];}
      (*neurons[i]).charge(qmas);
      }
     }
    if ((*neurons[n-1]).q>(*neurons[n-1]).qmax || (*neurons[n-1]).q<(-1*(*neurons[n-1]).qmax))
        {int a=1;
        return (a);}
    else
        {return 0;}
  }

int compute(int m, double input)
{int cnt=0;
for (int i=1;i<m;i++)
 {cnt=cnt+(this->step());
  this->chargeneuron(0,input);}
  return cnt;
 }

void train(int nexp, double* inputs, double* outputs,double eps)
{}

};

int main() {
int n=5;
int m=10000;
network try1(n);
int c=try1.compute(m,1);


system("pause");
return 0;}
