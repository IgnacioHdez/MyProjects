// Proyecto
#include "futil.cpp"
using namespace std;

double* acel(double**X, int j, int n)
{double *a   = numbersv(3,(double)0);
 double *A   = numbersv(3,(double)0);
 double *r1  = numbersv(3,(double)0);
 double *r2  = numbersv(3,(double)0);
 double *r12 = numbersv(3,(double)0);
 double s=0;
 r1[0] = X[j][1];
 r1[1] = X[j][2];
 r1[2] = X[j][3];
    for(int i=0;i<n;i++)
          {if (i==j)
            {}
           else
            {//Recopilo posiciones iniciales
             r2[0] = X[i][1];
             r2[1] = X[i][2];
             r2[2] = X[i][3];
             //Busco la acelracion
              for (int l=0;l<3;l++)
                {r12[l]=r2[l]-r1[l];}
             s=0;
              for (int q=0;q<3;q++)
                {s=s+(r12[q]*r12[q]);}
             s = sqrt(s);

              for (int p=0;p<3;p++)
                {A[p]=6.67384e-11*X[i][0]*r12[p]/(s*s*s);}

             a[0] = a[0]+A[0];
             a[1] = a[1]+A[1];
             a[2] = a[2]+A[2];}}
    return(a);}










int main()
{
    //Primero defino las variables
    double d, m2;
    double *a   = numbersv(3,(double)0);
    double *v   = loadv(3,"Casos/condjupiter.txt");
    double n    = v[0];
    double iter = v[1];
    double tf   = v[2];
    double *r12 = numbersv(3,(double)0);
    double *t   = linspacev(0.0,tf,iter);
    double dt   = t[1]-t[0];
    double **X  = loadm(n,7,"Casos/initjupiter.txt");
    double **R  = numbersm(iter,3*n,(double)0);
    double **V  = numbersm(iter,3*n,(double)0);
    double *r1  = numbersv(3,(double)0);
    double s;
    int h=0;
for (int h=0; h<iter; h++)
    {for (int j=0;j<n;j++)
     {//Guardo las posiciones originales
       r1[0] = X[j][1];
       r1[1] = X[j][2];
       r1[2] = X[j][3];
    //Saco la aceleración en cada eje
             a=acel(X,j,n);
    //Avanzo medio paso

             X[j][4] = X[j][4]+a[0]*dt/2;
             X[j][5] = X[j][5]+a[1]*dt/2;
             X[j][6] = X[j][6]+a[2]*dt/2;

    //Utilizo la nueva velocidad para calcular la nueva posición medio paso más alla

             X[j][1] = X[j][1]+X[j][4]*dt/2;
             X[j][2] = X[j][2]+X[j][5]*dt/2;
             X[j][3] = X[j][3]+X[j][6]*dt/2;
    //Saco la aceleración en el medio paso
             a=acel(X,j,n);
    //Avanzo medio paso

             X[j][4] = X[j][4]+a[0]*dt/2;
             X[j][5] = X[j][5]+a[1]*dt/2;
             X[j][6] = X[j][6]+a[2]*dt/2;
    //Utilizo la nueva velocidad para calcular la nueva posición medio paso más alla

             X[j][1] = X[j][1]+X[j][4]*dt/2;
             X[j][2] = X[j][2]+X[j][5]*dt/2;
             X[j][3] = X[j][3]+X[j][6]*dt/2;

      if(h%2000==0)

       {for (int k=0;k<3*n;k=k+3)
       {R[h/2000][k]=X[k/3][1];
        R[h/2000][k+1]=X[k/3][2];
        R[h/2000][k+2]=X[k/3][3];
        V[h/2000][k]=X[k/3][4];
        V[h/2000][k+1]=X[k/3][5];
        V[h/2000][k+2]=X[k/3][6];}
                cout<<h*100/iter<<endl;}
}}


    writem(iter/2000,3*n,R,"Plot/R.txt");
    writem(iter/2000,3*n,V,"Plot/V.txt");
    return 0;
}
