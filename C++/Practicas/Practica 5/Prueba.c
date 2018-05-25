#include "futil.cpp"
using namespace std;

double fx(double x)
{
    return (sin(x));
}

double main()
{
    matplotf(fx,-10,10,500);
    return 0;
}
