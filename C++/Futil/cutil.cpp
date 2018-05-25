//Useful classes (cutil.cpp)
//Ignacio Hernández-Ros. Last Updated on 09/08/2014
#include "futil.cpp"

//----------List of Classes----------

//1:My class: An empty-structured class to use as a template
//class myclass;

//1:Angle: Angle between 0 and 2pi rad
class angle;

//2: Complex number: Work with polar or a+bi form
class cmplx;

//3: Vector: Array of doubles where v(i) refers to a value and v(i,a) change the value [v(i)=a]
class vect;

//4: Matrix: Array of Array of doubles where A(i,j) refers to a value and v(i,j,a) change the value [A(i,j)=a]
class matrix;

//5: Particle: It represents a particle with a mass, a charge, a position and a velocity associated.
class particle;

//6: Time: It manages the time from a given start point to an end point walking steps of dt size.
class settime;

//7: Simulation: It manages a box of n particles and allows to simulate the process backwards or forwards
class simulation;

//8: Wave: It manages a complex wave flowing through a 3-dimensional space
class cmplxwave;

//-----------CLASSES------------

//--------------------------------------------------------------------------------------------
//0:

/*
class myclass{

public:

    //VALUES--------------------

    //m: Definition of the class values
    double m;

    //DECLARATIONS--------------

    //Definition of the functions
    double getm();

    //CONSTRUCTORS--------------

    //Empty constructor
    myclass()
	{m=0;}

    //General constructor
    myclass(double m1)
	{m=m1;}

};

//FUNCTIONS-----------------

//Implementation of the functions
double myclass::getm()
{return this->m;}

//OPERATORS----------------------------

//implementation of operators
myclass operator+(myclass m1, myclass m2)
{myclass m3(m1.m+m2.m);
return m3;}
*/

//--------------------------------------------------------------------------------------------
//1:

class angle{
   public:

    //VALUES--------------------------
        //theta: The value of the angle between 0 and 2*pI
        double theta;
        //n: keeps the number of rounds needed to put the original value of theta to a value from 0 to 2*pi i.e: 4*pi=> 2*pi and n=1
        int n;
        //v: 1 if the angle was originally given in rad and 2 if angle was originally given in deg
        int v;

    //DECLARATIONS

        //Creates an angle where alpha is in rad
        void anglerad(double alpha);
        //Creates an angle where alpha is in deg
        void angledeg(double alpha);
        //Returns theta in rad
        double getrad();
        //Returns theta in deg
        double getdeg();
        //Returns full theta in rad (with n rounds)
        double getfullrad();
        //Returns full theta in deg (with n rounds)
        double getfulldeg();
        //Transforms an angle in rad to the interval 0,2*pi
        void restructurate(double alpha);

    //CONSTRUCTOR---------------------

       angle(double theta1)
       {theta=theta1;
        n=0;
        v=1;
        restructurate(theta);
       }

       angle()
       {theta=0;
        n=0;
        v=0;}
};

//FUNCTIONS----------------------------

//Creates an angle where alpha is in rad
void angle::anglerad(double alpha)
  {theta=alpha;
   restructurate(theta);
   v=1;}

//Creates an angle where alpha is in deg
void angle::angledeg(double alpha)
  {theta=alpha*pi/180;
   restructurate(theta);
   v=2;}

//Returns theta in rad
double angle::getrad()
  {return(theta);}

//Returns theta in deg
double angle::getdeg()
  {return(theta*180/pi);}

//Returns full theta in rad (with n rounds)
double angle::getfullrad()
  {double alpha=theta+n*2*pi;
   return(alpha);}

//Returns full theta in deg (with n rounds)
double angle::getfulldeg()
  {double alpha=theta+n*2*pi;
   return(alpha*180/pi);}

//Transforms an angle in rad to the interval 0,2*pi
void angle::restructurate(double alpha)
   {while (theta<0)
       {theta=theta+2*pi;
        n--;}
    while (theta>=2*pi)
       {theta=theta-2*pi;
        n++;}}

//OPERATORS----------------------------

//Sum of two angles
angle operator +(angle a1,angle a2)
      {double alpha1=a1.getfullrad();
       double alpha2=a2.getfullrad();
       angle a3(alpha1+alpha2);
       return (a3);}

//Sum of angle and double
angle operator +(angle a1,double a2)
      {double alpha1=a1.getfullrad();
       int v1=a1.v;
       //If angle a1 was given in deg then a2 is treated as deg
       if (v1==2)
         {angle a3(alpha1+a2*pi/180);
         return (a3);}
       else
         {angle a3(alpha1+a2);
         return (a3);}
}

//Sum of double and angle
angle operator +(double a2,angle a1)
      {double alpha1=a1.getfullrad();
       int v1=a1.v;
       //If angle a1 was given in deg then a2 is treated as deg
       if (v1==2)
         {angle a3(alpha1+a2*pi/180);
         return (a3);}
       else
         {angle a3(alpha1+a2);
         return (a3);}
      }

//Definition of minus an angle (-theta)
angle operator -(angle a1)
      {double alpha1=a1.getfullrad();
       angle a3(-alpha1);
       return (a3);}

//Subtraction of two angles
angle operator -(angle a1,angle a2)
      {double alpha1=a1.getfullrad();
       double alpha2=a2.getfullrad();
       angle a3(alpha1-alpha2);
       return (a3);}

//Subtraction of an Angle and a double
angle operator -(angle a1,double a2)
      {double alpha1=a1.getfullrad();
       int v1=a1.v;
       //If angle a1 was given in deg then a2 is treated as deg
       if (v1==2)
         {angle a3(alpha1-a2*pi/180);
         return (a3);}
       else
         {angle a3(alpha1-a2);
         return (a3);}
}

//Subtraction of a double and an Angle
angle operator -(double a2,angle a1)
      {double alpha1=a1.getfullrad();
       int v1=a1.v;
       //If angle a1 was given in deg then a2 is treated as deg
       if (v1==2)
         {angle a3(-alpha1+a2*pi/180);
         return (a3);}
       else
         {angle a3(-alpha1+a2);
         return (a3);}
      }

//Product of two Angles
angle operator *(angle a1,angle a2)
      {double alpha1=a1.getfullrad();
       double alpha2=a2.getfullrad();
       angle a3(alpha1*alpha2);
       return (a3);
      }

//Product of an Angle and a double
angle operator *(angle a1,double p)
      {double alpha1=a1.getfullrad();
       angle a2(alpha1*p);
       return (a2);
}

//Product of a double and an Angle
angle operator *(double p,angle a1)
      {double alpha1=a1.getfullrad();
       angle a2(alpha1*p);
       return (a2);
      }

//Division of two Angles
angle operator /(angle a1,angle a2)
      {double alpha1=a1.getfullrad();
       double alpha2=a2.getfullrad();
       angle a3(alpha1/alpha2);
       return (a3);
      }

//Division of a double and an Angle
angle operator /(double p,angle a1)
      {double alpha1=a1.getfullrad();
       angle a2(p/alpha1);
       return (a2);
      }

//Division of an Angle and a double
angle operator /(angle a1,double p)
      {double alpha1=a1.getfullrad();
       angle a2(alpha1/p);
       return (a2);
      }

//--------------------------------------------------------------------------------------------
//2:

class cmplx {
public:

    //VALUES--------------------------

    //a: Real part of the complex number
    //b: Complex part of the complex number
    //r: Module of the complex number
    double a, b, r;
    //theta: Angle of the complex number with the real axis
    angle theta;

    //DECLARATIONS--------------------

    //Show the complex number through console
    void show();
    //Conjugates the complex number c1 so c1.conjugate=a-bi
    cmplx conjugate();
    //Assign a double to the real part of a complex number
    void operator=(double a);

    //CONSTRUCTORS--------------------

    cmplx(double a1, double b1)
    {a=a1;
     b=b1;
     r=sqrt(a*a+b*b);
     this->theta.anglerad(atan(b/a));
    }
    cmplx(double r1, angle theta1)
    {r=r1;
     this->theta=theta1;
     a=r*cos(theta.getrad());
     b=r*sin(theta.getrad());
    }
    cmplx()
    {a=0;
     b=0;
     r=0;
     this->theta.anglerad(0);
    }

};

//FUNCTIONS----------------------------------

//Show the complex number through console
void cmplx::show()
{if (b>0)
        std::cout<<a<<"+"<<b<<"i"<<std::endl;
     if (b==0)
        std::cout<<a<<std::endl;
     if (b<0)
        std::cout<<a<<b<<"i"<<std::endl;
     std::cout<<"r="<<r<<" and theta(deg)="<<theta.getdeg()<<std::endl;}

//Conjugates the complex number c1 so c1.conjugate=a-bi
cmplx cmplx::conjugate()
      {cmplx c1(this->a,-this->b);
       return c1;}

//OPERATORS----------------------------------

//Sum of two complex numbers
cmplx operator +(cmplx c1,cmplx c2)
      {double a=c1.a+c2.a;
       double b=c1.b+c2.b;
       cmplx c3(a,b);
       return (c3);}

//Sum of a complex and a number
cmplx operator +(double c1,cmplx c2)
      {double a=c1+c2.a;
       double b=c2.b;
       cmplx c3(a,b);
       return (c3);}

//Sum of a number and a complex
cmplx operator +(cmplx c2,double c1)
      {double a=c1+c2.a;
       double b=c2.b;
       cmplx c3(a,b);
       return (c3);}

//Definition of -z
cmplx operator -(cmplx c1)
      {double a=-c1.a;
       double b=-c1.b;
       cmplx c3(a,b);
       return (c3);}

//Subtraction of two complex numbers
cmplx operator -(cmplx c1,cmplx c2)
      {double a=c1.a-c2.a;
       double b=c1.b-c2.b;
       cmplx c3(a,b);
       return (c3);}

//Subtraction of a complex and a number
cmplx operator -(double c1,cmplx c2)
      {double a=c1-c2.a;
       double b=c2.b;
       cmplx c3(a,b);
       return (c3);}

//Subtraction of a number and a complex
cmplx operator -(cmplx c2,double c1)
      {double a=-c1+c2.a;
       double b=-c2.b;
       cmplx c3(a,b);
       return (c3);}

//Product of two complex numbers
cmplx operator *(cmplx c1,cmplx c2)
      {double r=c1.r*c2.r;
       angle th=c1.theta+c2.theta;
       cmplx c3(r,th);
       return (c3);}

//Product of a number and a complex
cmplx operator *(double c1,cmplx c2)
      {double r=c1*c2.r;
       angle th=c2.theta;
       cmplx c3(r,th);
       return (c3);}

//Product of a complex and a number
cmplx operator *(cmplx c2,double c1)
      {double r=c1*c2.r;
       angle th=c2.theta;
       cmplx c3(r,th);
       return (c3);}

//Division of two complex numbers
cmplx operator /(cmplx c1,cmplx c2)
      {double r=c1.r/c2.r;
       angle th=c1.theta-c2.theta;
       cmplx c3(r,th);
       return (c3);}

//Division of a number and a complex
cmplx operator /(double c1,cmplx c2)
      {double r=c1/c2.r;
       angle th=-c2.theta;
       cmplx c3(r,th);
       return (c3);}

//Division of a complex and a number
cmplx operator /(cmplx c2,double c1)
      {double r=c2.r/c1;
       angle th=c2.theta;
       cmplx c3(r,th);
       return (c3);}

//Asignation of the real value of a complex
void cmplx::operator=(double a)
    {cmplx z(a,this->b);
     this->a=z.a;
     this->b=z.b;
     this->r=z.r;
     this->theta=z.theta;}





//--------------------------------------------------------------------------------------------
//3:

class vect{

public:

    //VALUES----------------------

    //dim: integer that keeps the size of the vector
    int dim;
    //v: Array that keeps the content of the vector when they are double
    double* v;

    //DECLARATIONS----------------

    //Returns the norm
    double norm();
    //Show vector through console
    void show();
    //Keeps the vector in the archive namev
    void save(const char* namev);
    //Allow to get the content of a vector this way v(i)
    double operator()(int n);
    //Allow to save the i-value this way v(i,s) will make v(i)=s
    void operator()(int n, double a);

    //CONSTRUCTORS----------------

    vect()
    {v=numbersv(0,0);
     dim=0;}

    vect(int n)
    {v=numbersv(n,0);
     dim=n;}

     vect(int n, double a)
    {v=numbersv(n,a);
     dim=n;}

};

//FUNCTIONS------------------

//Returns the norm
double vect::norm()
{return normv(dim,v);}

//Show vector through console
void vect::show()
{plotv(this->dim,this->v);}

void vect::save(const char* namev)
{writev(dim,v,namev);}


//OPERATORS----------------------------

//Sum of two vectors
vect operator+(vect v1,vect v2)
{if (v1.dim==v2.dim)
    {vect v3;
     for (int i=1;i<=v1.dim;i++)
        v3(i,v1(i)+v2(i));
     return v3;
    }
 else{std::cout<<"Can't add vectors of different size."<<std::endl;
    return 0;}}

//Definition of minus a vector (-v)
vect operator-(vect v1)
{vect v3;
     for (int i=1;i<=v1.dim;i++)
        v3(i,-v1(i));
     return v3;}

//Subtraction of two vectors
vect operator-(vect v1,vect v2)
{if (v1.dim==v2.dim)
    {vect v3;
     for (int i=1;i<=v1.dim;i++)
        v3(i,v1(i)-v2(i));
     return v3;
    }
 else{std::cout<<"Can't add vectors of different size."<<std::endl;
    return 0;}}

//Scalar product of two vectors
double operator*(vect v1,vect v2)
{if (v1.dim==v2.dim)
    {return prodescv(v1.dim,v1.v,v2.v);}
 else{std::cout<<"Can't do scalar product to vectors of different size."<<std::endl;
    return 0;}}

//Product of an scalar and a vector
vect operator*(double a,vect v1)
{vect v3;
 for (int i=1;i<=v1.dim;i++)
 v3(i,v1(i)*a);
 return v3;}

//Product of a vector and a scalar
vect operator*(vect v1,double a)
{vect v3;
 for (int i=1;i<=v1.dim;i++)
 v3(i,v1(i)*a);
 return v3;}

//Division of a vector and a scalar
vect operator/(vect v1,double a)
{vect v3;
 for (int i=1;i<=v1.dim;i++)
 v3(i,v1(i)/a);
 return v3;}

//Allow to get the content of a vector this way v(i)
double vect::operator()(int n)
{return (this->v[n-1]);}

//Allow to save the i-value this way v(i,s) will make v(i)=s
void vect::operator()(int n, double value)
{if (n>dim)
        {double* vtemp=numbersv(n,0);
         for(int i=0;i<dim;i++)
            {vtemp[i]=v[i];}
         vtemp[n-1]=value;
         clearv(v);
         v=numbersv(n,0);
         v=vtemp;
         dim=n;}
     v[n-1]=value;
}

//--------------------------------------------------------------------------------------------
//4:

class matrix{
public:

    //VALUES--------------------

    //r: Integer that keeps the number of rows
    //c: Inter that keeps the number of columns
    int r,c;
    //A: Array of Arrays that keeps the values of the matrix
    double** A;

    //DECLARATIONS

    //Show matrix through console
    void show();
    //Returns the transposed matrix
    matrix tras();
    //Saves the matrix in the archive name
    void save(const char* name);
    //Allow to get the content of a matrix this way A(i,j)
    double operator()(int i, int j);
    //Allow to save the i,j-value this way A(i,j,s) will make A(i,j)=s
    void operator()(int i, int j, double a);

    //CONSTRUCTORS--------------

    matrix(int i,int j)
    {r=i;
     c=j;
     A=numbersm(r,c,0);}

     matrix(int i)
    {r=i;
     c=i;
     A=numbersm(r,c,0);}

    matrix()
     {r=0;
      c=0;
      A=numbersm(r,c,0);}

};

//FUNCTIONS-----------------


//Show matrix through console
void matrix::show()
{plotm(this->r,this->c,this->A);}

//Returns the transposed matrix
matrix matrix::tras()
{if (r==c)
    {matrix B(r);
     double**C=trasm(A,r);
     for (int i=1;i<=r;i++)
        for (int j=1;j<=r;j++)
         {B(i,j,C[i-1][j-1]);}
        return B;}
 else
    {std::cout<<"Can't transpose a non-square matrix"<<std::endl;
     return 0;}
}
void matrix::save(const char* name)
{writem(r,c,A,name);}

//OPERATORS----------------------------

//Sum of two matrix
matrix operator+(matrix A,matrix B)
{if (A.r==B.r && A.c==B.c)
    {matrix C;
     for (int i=1;i<=A.r;i++)
        for (int j=1;j<=A.c;j++)
        C(i,j,A(i,j)+B(i,j));
     return C;
    }
 else{std::cout<<"Can't add matrix of different size."<<std::endl;
    return 0;}}

//Definition of -A
matrix operator-(matrix A)
{matrix C;
     for (int i=1;i<=A.r;i++)
        for (int j=1;j<=A.c;j++)
        C(i,j,-A(i,j));
     return C;
}

//Subtraction of two matrix
matrix operator-(matrix A,matrix B)
{if (A.r==B.r && A.c==B.c)
    {matrix C;
     for (int i=1;i<=A.r;i++)
        for (int j=1;j<=A.c;j++)
        C(i,j,A(i,j)-B(i,j));
     return C;
    }
 else{std::cout<<"Can't add matrix of different size."<<std::endl;
    return 0;}}

//Product of two matrix
matrix operator*(matrix A,matrix B)
{if (A.c==B.r)
    {matrix C;
     double**C1=prodm(A.A,A.r,A.c,B.A,B.r,B.c);
     for (int i=0;i<A.r;i++)
        for (int j=0;j<B.c;j++)
        {C(i+1,j+1,C1[i][j]);}
     return C;
    }
 else{std::cout<<"Can't multiply matrix of incongruent size."<<std::endl;
    return 0;}}

//Product of a number and a matrix
matrix operator*(double a,matrix A)
{matrix C;
     for (int i=1;i<=A.r;i++)
        for (int j=1;j<=A.c;j++)
        {C(i,j,a*A(i,j));}
 return C;
}

//Product of a matrix and a number
matrix operator*(matrix A,double a)
{matrix C;
     for (int i=1;i<=A.r;i++)
        for (int j=1;j<=A.c;j++)
        {C(i,j,a*A(i,j));}
 return C;
}

//Division of a matrix and a number
matrix operator/(matrix A,double a)
{matrix C;
     for (int i=1;i<=A.r;i++)
        for (int j=1;j<=A.c;j++)
        {C(i,j,A(i,j)/a);}
 return C;
}

//Allow to get the content of a matrix this way A(i,j)
double matrix::operator()(int i, int j)
{if (i-1>r)
 return 0;
 else if (j-1>c)
 return 0;
 else
 return A[i-1][j-1];}

//Allow to save the i,j-value this way A(i,j,s) will make A(i,j)=s
 void matrix::operator()(int i, int j, double value)
{if (i>r)
    {double** Atemp=numbersm(i,c,0);
       for(int i2=0;i2<r;i2++)
          for (int j2=0;j2<c;j2++)
           {Atemp[i2][j2]=A[i2][j2];}
         clearm(A,r);
         A=numbersm(i,c,0);
         A=Atemp;
         r=i;}
if (j>c)
    {double** Atemp=numbersm(r,j,0);
       for(int i2=0;i2<r;i2++)
         for (int j2=0;j2<c;j2++)
           {Atemp[i2][j2]=A[i2][j2];}
         clearm(A,r);
         A=numbersm(r,j,0);
         A=Atemp;
         c=j;}
A[i-1][j-1]=value;}

//--------------------------------------------------------------------------------------------
//5:

class particle{

public:

    //VALUES--------------------

    //m: Mass of the particle
    //q: Charge of the particle
    double m,q;
    //r: Position vector
    vect r;
    vect v;

    //DECLARATIONS--------------

    //Returns the information about the particle through console
    void show();

    //Returns the momentum of the particle
    vect momentum();

    //Returns the force created by particle p2 over the target particle
    vect force(particle p2);

    //CONSTRUCTORS--------------

    particle()
    {q=0;
     m=0;
     r=vect(3,0);
     v=vect(3,0);}

    particle(double ms, double qh, vect rq, vect vq)
    {q=qh;
     m=ms;
     if (rq.dim==3 && vq.dim==3)
        {r=rq;
         v=vq;}
     else
        {std::cout<<"Position and velocity vector should have 3 entries"<<std::endl;
         std::cout<<"Position and velocity were set to (0,0,0) by default"<<std::endl;
         r=vect(3,0);
         v=vect(3,0);}
     }

};

//INTERNAL FUNCTIONS------------------------

void particle::show()
{std::cout<<"Mass= "<<this->m<<std::endl;
 std::cout<<"Charge= "<<this->q<<std::endl;
 std::cout<<"Position: ";this->r.show();
 std::cout<<"Velocity: ";this->v.show();
}

vect particle::momentum()
{vect p;
p=this->m*this->v;
return p;
}

vect particle::force(particle p)
{vect f=-(q*p.q)/((r-p.r).norm()*(r-p.r).norm()*(r-p.r).norm())*(p.r-r)/m;
 return f;}

//EXTERNAL FUNCTIONS------------------------

//Returns an array of particles
particle* partgroup(int N)
{particle *v;
v=new particle[N];
for (int i=0;i<N;i++){v[i]=particle();}
return(v);}

//OPERATORS------------------------

//The sum of particles keeps the global momentum and the center of mass not alterable.
particle operator+(particle p1, particle p2)
{//Conservation of the mass
double m3=p1.m+p2.m;
//Conservation of the charge
double q3=p1.q+p2.q;
//Conservation of the center of masses
vect r3=(p1.r*p1.m+p2.r*p2.m)/(p1.m+p2.m);
//Conservation of momentum
vect v3=(p1.momentum()+p2.momentum())/(p1.m+p2.m);
particle p3(m3,q3,r3,v3);
return p3;
}

//--------------------------------------------------------------------------------------------
//6:

class settime {

public:

   //VALUES--------------------

    //t: The actual time
    //dt: The length of the steps ou can do
    double t, dt;

   //DECLARATIONS--------------

   //It moves the time i steps forward
   void jumpstep(int i);

   //Exports actual situation through console
   void show();

   //CONSTRUCTOR---------------

   settime()
   {t=0;
    dt=0;}

   settime(double t0,double dt0)
   {t=t0;
    dt=dt0;}

   settime(double t0,double tf,int N)
   {t=t0;
    dt=(tf-t0)/double(N);}

};

//FUNCTIONS--------------------

void settime::jumpstep(int i)
{t=t+dt*i;}

void settime::show()
{std::cout<<"Actual time: "<<t<<std::endl;
 std::cout<<"Actual differential of time: "<<dt<<std::endl;
}

//--------------------------------------------------------------------------------------------
//7:

class simulation{

public:

    //VALUES--------------------

    //t: Time of the simulation
    settime t;
    //p: Array of articles of the simulation
    particle* p;
    //k: Constant of the gauge interaction between particles
    //N: Keeps the initial number of particles
    //it: Keeps the number of iterations
    //actit: Keeps the number of the last iteration
    int N, it, actit;

    //DECLARATIONS--------------

    //Integrates the position of the particles step-times by the Euler method
    void inteulerstep(int steps);

    //---Integrates the position of the particles until the end point by the Euler method
    void inteulerend();

    //Saves the current state of all the particles in a matrix in the archive "dir"
    void savestate(const char* dir);

    //Saves the whole movement of all the particles in a matrix in the archive "dir"
    void savesim(const char* dir);

    //CONSTRUCTORS--------------

    simulation()
	{}

    simulation(int n, double T, int itt)
    {N=n;
     it=itt;
     actit=1;
     t=settime(0,T,it);
     p=partgroup(n);}

    simulation(int n, double T,particle* P, int itt)
    {N=n;
     it=itt;
     t=settime(0,T,it);
     p=P;
     actit=1;}

};

//FUNCTIONS-----------------

void simulation::inteulerstep(int steps)
{//Loop of time
 for (int i=actit; i<=steps; i++)
    {if (t.t<=t.dt*double(it))
      {//Loop of particles
       for (int j=0; j<N; j++)
        {//Calculation of acceleration over particle j
         vect ac(3,0);
         //Loop over the rest of the particles
         for (int k=0; k<N; k++)
            {if (k==j) {}
             else{ac=ac+p[j].force(p[k]);}}
         p[j].v=p[j].v+ac*t.dt;
         p[j].r=p[j].r+p[j].v*t.dt;
         //---Check if particles collides
         for (int k=0; k<N; k++)
            {if (k==j) {}
             else{
                if ((p[j].r-p[k].r).norm()<((p[j].v-p[k].v).norm()*t.dt*10))
                    {if (j<k);
                        {vect ac(3,0);
                         for (int h=0; h<N; h++)
                           {if (k==h) {}
                            else ac=ac+p[k].force(p[h]);}
                         p[k].v=p[k].v+ac*t.dt;
                         p[k].r=p[k].r+p[k].v*t.dt;}

                     t.show();
                     particle *ptemp=partgroup(N-1);
                     int h=0;
                     for (int i=0; i<N; i++)
                        {if (i==minimum(j,k))
                            {ptemp[h]=p[j]+p[k];
                             h++;}
                         else if (i==maximum(j,k))
                            {h++;}
                         else
                            {ptemp[h]=p[h];
                             h++;}}
                    p=ptemp;
                    N=N-1;}}}
         //---End of colliding check
        }
      t.jumpstep(1);}
    else
      {std::cout<<"The simulation has already ended"<<std::endl;
       break;}}
}

//--------------------------------------------------------------------------------------------
//9:

/*
class cmplxwave{

public:

    //VALUES--------------------

    //cminval: value at dt0 and vr0 of the wave
    //cmw: Frequency of oscillation of the wave
    //cmk: It represents the wave number
    cmplx cminval, cmw, cmk;

    //dt0: The start time of the wave
    double dt0;

    //vr0: The start position of the wave
    vector vr0;

    //fspectdist: The function of the spectral distribution of the wave
    cmplx *fspectdist(vector vr);

    //DECLARATIONS--------------

    //Definition of the functions
    double cmplxwave();

    //CONSTRUCTORS--------------

    //Empty constructor
    cmplxwave()
	{m=0;}

    //General constructor
    cmplxwave(double m1)
	{m=m1;}

};

//FUNCTIONS-----------------

//Implementation of the functions
double myclass::getm()
{return this->m;}

//OPERATORS----------------------------

//implementation of operators
myclass operator+(myclass m1, myclass m2)
{myclass m3(m1.m+m2.m);
return m3;}
*/



