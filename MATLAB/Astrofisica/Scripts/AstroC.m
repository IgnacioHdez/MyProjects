clc
clear all
close all


%Loads,HIP, BV, e_BV, VI, e_V, Pl, ePlx, Vmag, SpType as vectors



load('../Data/data.mat');
Plx=Pl;
N=max(size(Plx));
n=(1:N)';

%Obtenci�n de la magnitud absoluta
Mabs=Vmag+5+5*log10(Plx/1000);

%Obtencion de la correcci�n bolom�trica seg�n la clasf espc
load('../Data/Correction.mat');

disp('Correcting Magnitude')
%For every star
BC=linspace(0,0,N)';
for i=1:N
    if HIP(i)==3829 || HIP(i)==84405
        BC(i)=0;
        
    else
        %First look for the caracter
        for j=1:max(size(Sp1))
            if ISpType(i,2)==Sp1(j) && BC(i)==0;
                %Then look for its position in the vector of Bc
                if Sp1(j)=='B' || Sp1(j)=='F' || Sp1(j)=='G'
                    nmax=4;
                else
                    nmax=3;
                end
                
                %Creates auxiliar vectors
                for k=0:nmax-1
                    x(k+1)=Sp2(j+k);
                    y(k+1)=Bc(j+k);
                end
                
                %Now interpolates an save data in BC
                if min(abs(str2num(ISpType(i,3))-x))==0
                    BC(i)=interp1(x,y,str2num(ISpType(i,3)));
                elseif x(nmax)<str2num(ISpType(i,3))
                    p=polyfit([x(nmax-1),x(nmax)],[y(nmax-1),y(nmax)],1);
                    BC(i)=p(1)*str2num(ISpType(i,3))+p(2);
                else
                    BC(i)=interp1(x,y,str2num(ISpType(i,3)));
                end
                
                %Clear auxiliar vectors
                clear x y p
                break
            end
        end
    end
end
clear i j k Bc Sp1 Sp2

%Obtenci�n de la correcci�n bolom�trica absoluta
MB=Mabs+BC;

%Obtenci�n de la luminosidad en luminosidades solares
L=10.^((4.74-MB)/2.5);

%Obtencion de casos extremos
m=mean(L);
s=std(L);
h=0;
for i=1:N 
    if L(i)>5 
        h=h+1;
        rare(h)=i;
        
    end
end
clear m s h nmax

disp('Saving Results')
save('../Data/result.mat')