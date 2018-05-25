clear all
m=0;
x=linspace(0,14,1000000);
J1=besselj(m,x);
J2=besselj(m,2*x);
Y1=bessely(m,x);
Y2=bessely(m,2*x);

f=J1.*Y2-J2.*Y1;
ct=1;
z(1)=nan;
for i=2:1000000
    lastf=abs(f(i-1));
    if abs(f(i))<lastf && ct==0
        ct=1; 
    end
    z(i)=nan;
    if abs(f(i))>lastf && ct==1
        disp(x(i))
        ct=0; 
        z(i)=f(i);
    end
end
plot(x,f,'.')
hold on
plot(x,z,'or')
grid on