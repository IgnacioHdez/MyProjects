function nn=fbuclenmov2punt(C)
%Dada una matriz C Calcula sus cuatro posibles cambios y te da los 0 de
%cada uno
C1=Mov(1,C);
C2=Mov(2,C);
C3=Mov(3,C);
C4=Mov(4,C);
nn=[0,0,0,0];
nn(1)=fpunt(C1);
nn(2)=fpunt(C2);
nn(3)=fpunt(C3);
nn(4)=fpunt(C4);
end