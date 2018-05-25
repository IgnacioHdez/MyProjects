clear all
close all

n=2;
N=10000;

p=0.01;
h=0;

C=[1,0,1];
for l=0:1:n-1
    
    for m=-l:1:l
        figure(1)
    
        C=C-[0,0,0.2];
        
        p1=cutplotH(n^2*1.5e-10+0.25*n^2*2e-10,n,l,m,p,N,C); 

        h=h+1;
        view(3);
        xlabel('x(nm)')
        ylabel('y(nm)')
        zlabel('z(nm)')
        axis('equal')
    
    
        hold on
        clc
        disp(n^2-h);
    
    end
    
end

hold off