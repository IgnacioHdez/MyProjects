clear all
close all
%Radio inicial

R(1,1)=0;
R(1,2)=0;

V(1,1)=0;
V(1,2)=0;

rs=1;
%Número de pasos

N=100;
t=linspace(0,1,N);
dt=t(2)-t(1);

prob=90;

for i=1:N-1
    
    for j=1:rs
      p=100*rand;
        if p>prob
            
            rs=rs+1;
            
            R(rs,1)=R(j,1);
            R(rs,2)=R(j,2);
                    
            V(rs,1)=(1-2*rand)/(2^(0.5));
            V(rs,2)=(1-2*rand)/(2^(0.5));
            
            Vs=[V(j,1),V(j,2)];
            Vrs=[V(rs,1),V(rs,2)];
                        
            V(j,1)=(V(j,1)/norm(Vs))*(norm(Vs)-norm(Vrs));
            V(j,2)=(V(j,2)/norm(Vs))*(norm(Vs)-norm(Vrs));
                       
        end
    end
    
    for j=1:rs
        R(j,1)=R(j,1)+V(j,1)*dt;
        R(j,2)=R(j,2)+V(j,2)*dt;
    end
    clc
    disp(100*i/(N-1))
    plotr
end