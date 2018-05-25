function pl=cutplotH(d,n,l,m,p,N3,C)

%Number of iterations

N=floor(N3^(1/3));

%Quantum Numbers


%d=(n^2)*1.5e-10;
x=linspace(-d,d,N);
y=linspace(-d,d,N);
z=linspace(-d,d,N);

%Calculum

for i=1:N
    
    for j=1:N
        for k=1:N
            
            r=sqrt(x(i)^2+y(j)^2+z(k)^2);
            theta=(acos(z(k)/r));
            phy=(atan(y(j)/x(i)));
             if phy<0
                 phy=phy+pi;
             end

            
            P(i,j,k)=real(WaveValH(r,theta,phy,n,l,m).*WaveValH(r,theta,phy,n,l,m));
        end
    end
    
end

%Plot

%isosurface(x*1e9,y*1e9,z*1e9,P,p)
pl = patch(isosurface(x*1e9,y*1e9,z*1e9,P,p));
pl.FaceColor = C;

end