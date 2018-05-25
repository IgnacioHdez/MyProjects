function nt=fbuclenmov1(A)
%--Calcula los cuatro movimientos
A11=Mov(1,A);
A12=Mov(2,A);
A13=Mov(3,A);
A14=Mov(4,A);
%--Calcula el mayor numero de ceros si hiciera un paso mas
n1=fbuclenmov2(A11);
n2=fbuclenmov2(A12);
n3=fbuclenmov2(A13);
n4=fbuclenmov2(A14);

nt=[n1;n2;n3;n4];
%disp(nt)
end