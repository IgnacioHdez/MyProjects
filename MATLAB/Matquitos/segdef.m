disp('---')
disp('Los origenes deben tomar valores en el intervalo [-6,6]')
disp ('escritos en forma [x,y] (escribir corchetes)')
disp('---')
display('Barco A de longitud 3:')
disp('---')
a=input('Origen de A [x,y]=');
disp('---')
x=a(1,1);
y=a(1,2);
phi=input('Orientación en grados=');
phir=phi*pi/180;
A1=[x,y];
m=3;
A2=barco(A1,phir,m);
%---
disp('---')
display('Barco B de longitud 3:')
disp('---')
a=input('Origen de B [x,y]=');
disp('---')
x=a(1,1);
y=a(1,2);
phi=input('Orientación en grados=');
phir=phi*pi/180;
B1=[x,y];
m=3;
B2=barco(B1,phir,m);
%---
disp('---')
display('Barco C de longitud 3:')
disp('---')
a=input('Origen de C [x,y]=');
x=a(1,1);
y=a(1,2);
disp('---')
phi=input('Orientación en grados=');
disp('---')
phir=phi*pi/180;
C1=[x,y];
m=3;
C2=barco(C1,phir,m);