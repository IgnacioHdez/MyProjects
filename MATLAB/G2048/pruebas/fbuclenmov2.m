function nn=fbuclenmov2(C)
%Dada una matriz C Calcula sus cuatro posibles cambios y te da los 0 de
%cada uno
C1=Mov(1,C);
C2=Mov(2,C);
C3=Mov(3,C);
C4=Mov(4,C);
nn=[0,0,0,0];
for i=1:4
    for j=1:4
        if C1(i,j)==0
            nn(1)=nn(1)+1;
        end
    end
end
for i=1:4
    for j=1:4
        if C2(i,j)==0
            nn(2)=nn(2)+1;
        end
    end
end
for i=1:4
    for j=1:4
        if C3(i,j)==0
            nn(3)=nn(3)+1;
        end
    end
end
for i=1:4
    for j=1:4
        if C4(i,j)==0
            nn(4)=nn(4)+1;
        end
    end
end
end