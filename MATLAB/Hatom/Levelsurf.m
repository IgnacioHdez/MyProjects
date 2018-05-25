%Test function
clear all
clc

%Number of iterations

N3=5000;
N=floor(N3^(1/3));

%Probcut
p=0.5;

%Quantum Numbers

n=4;
l=3;
m=0;

%Coordinates

dmax=(n^2)*1.5e-10;

th=linspace(0,pi,N);
ph=linspace(0,2*pi,N);
h=1;
%Calculum
for i=1:N
    theta=th(i);
    for j=1:N;
        phy=ph(j);
        r=0;
        Pac=0;
        while r<=dmax
            P=real(WaveValH(r,theta,phy,n,l,m)*WaveValH(r,theta,phy,n,l,m));
            Pac=Pac+P;
            if Pac>p
                x(h)=r*sin(theta)*cos(phy);
                y(h)=r*sin(theta)*sin(phy);
                z(h)=r*cos(theta);
                h=h+1;
                break
            end
            r=r+dmax/N;
                
        end
    end
end

%Plot

exsurf(x,y,z)

xlabel('x(nm)')
ylabel('y(nm)')
zlabel('z(nm)')