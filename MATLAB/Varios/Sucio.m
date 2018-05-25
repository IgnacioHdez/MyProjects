ac=0.717;
aA=28.1;
ap=34;

for A=1:300
    a1=113.69;
    a2=ac/A^(1/3)+aA*4/A;
    Zmin=floor(a1/(2*a2));
    
    %A Par
    if floor(A/2)==A/2
        %Z Par
        if floor(Zmin/2)==Z/2
        Bp=ap*A^(-3/4);    
        else
        Bp=0;
        end
        
    else
        %Z Par
        if floor(Zmin/2)==Z/2
        Bp=0;    
        else
        Bp=-ap*A^(-3/4);
        end 
    end
    
    Emin0(1)=-a1*Zmin+a2*Zmin^2+Bp;
    
    Zmin=Zmin+1;
    
    %A Par
    if floor(A/2)==A/2
        %Z Par
        if floor(Zmin/2)==Z/2
        Bp=ap*A^(-3/4);    
        else
        Bp=0;
        end
        
    else
        %Z Par
        if floor(Zmin/2)==Z/2
        Bp=0;    
        else
        Bp=-ap*A^(-3/4);
        end 
    end
    
    Emin0(2)=-a1*Zmin+a2*Zmin^2+Bp;
    
    if Emin0(1)>Emin0(2)
    
        Z(A)=Zmin;
    
    else
        
        Z(A)=Zmin-1;
        
    end
    
    
end
A=1:300;




plot(A-Z,Z,'b')
xlabel('N')
ylabel('Z')
grid on

hold on 
plot(Z,Z,'r-')
hold off

