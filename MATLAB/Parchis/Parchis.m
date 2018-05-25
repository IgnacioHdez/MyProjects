clear all
g=zeros(4);
e=0;
while e==0
    %Cada i equivale a cada jugador
    for i=1:4
        %Tira el dado
        d=randi(6);
        %Convierte 6 en 7
        s=0;
        if d==6
            for j=1:4
                if g(i,j)~=0
                    s=s+1;
                    if s==4
                        d=7;
                    end
                end
            end
        end
        %Saca de casa la ficha
        m=0;
        if d==5
            for j=1:4
                if g(i,j)==0
                    g(i,j)=1;
                    m=1;
                    break
                end
            end
        end
        %Mueve la mas pequeña
        if m==0
            move
        end
    end
    pause 
    disp(g)
end