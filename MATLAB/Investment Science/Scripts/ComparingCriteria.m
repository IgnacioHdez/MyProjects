clear all
addpath('C:\Users\Ignacio\Google Drive\Documentos\MATLAB\Investment Science\Functions')
r=0.1;
years=5;

for n=1:years  
   
    for i=1:years
        if i<n
            v(i)=2+i-1;
        elseif i==1 || i==n
            v(i)=10;
        elseif i>n
            v(i)=2+i-n-1;
        end
    end
            
    PV(n)=PresentValuef(v,r);
end

figure(1)
title('PV')
plot(1:years,PV,'-b')

