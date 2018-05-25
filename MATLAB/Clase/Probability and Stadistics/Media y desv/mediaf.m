function [medes]=mediaf(A)
%Función que develve en forma de vector la media y la desviación tipica de
%los valores
s=size(A);
suma=0;
%Media
for n=1:s(1,2)
suma=suma+A(1,n);
med=suma/(s(1,2));
end
sq=0;
%Desviación típica
for n=1:s(1,2)
sq=sq+(A(1,n)-med)^2;
desv=sqrt(1/(s(1,2)-1)*sq);
end
medes=[med,desv];
