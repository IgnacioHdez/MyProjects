clear all
x=linspace(0.1,2,2000);
B=2;
A=3;
y=A*exp(B./x);
y2=A*exp(B*(1-x));
plot(x,y,'.b')
hold on
plot(x,y2,'.r')
hold off
