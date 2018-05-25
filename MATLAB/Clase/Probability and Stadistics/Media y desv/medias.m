%inputs
A=input('Matriz de valores = ');
disp('---')
s=size(A);
suma=0;
for n=1:s(1,2)
suma=suma+A(1,n);
med=suma/(s(1,2));
end
%Display
disp('Media = ')
disp(' ')
disp(med)
disp('---')
%Desviación típica
sq=0;
for n=1:s(1,2)
sq=sq+(A(1,n)-med)^2;
desv=sqrt(1/(s(1,2)-1)*sq);
end
%Display
disp('Desviación típica = ')
disp(' ')
disp(desv)
disp('---')