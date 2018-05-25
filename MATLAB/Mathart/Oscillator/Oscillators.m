clear all
N=750;
t=linspace(0,1,N);
f=[10,10,5];
d=[0,0,0];
A=[pi,pi/2,1];
c=[1,0.5,1];


for i=1:20
       
fi=pi+A(1)*sin(2*pi*(f(1)*t+d(1)));
te=pi/2+A(2)*sin(2*pi*(f(2)*t+d(2)));
ro=abs(A(3)*sin(2*pi*(f(3)*t+d(3))));


x=ro.*cos(fi).*sin(te);
y=ro.*sin(fi).*sin(te);
z=ro.*cos(te);

figure (1)

plot3(x,y,z,'-','color',c);
axis ([-1,1,-1,1,-1,1])
xlabel('x')
ylabel('y')
zlabel('z')
c(1)=c(1)/1.2; 
c(3)=c(3)/1.2;
A(3)=sin(i);

pause(0.05)
end
