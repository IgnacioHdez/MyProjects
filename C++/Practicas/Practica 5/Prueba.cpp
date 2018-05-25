#include "futil.cpp"
using namespace std;

double fx(double x)
{
    return (sin(x)+npi);
}

int main()
{
    matplotf(fx,-10,10,500);
    return 0;
}
