p=floor(100-(floor(t/5)+h));
disp('Puntuaci�n')
disp(' ')
disp(p)
disp(' ')
c=0;
    if p>=97
        disp('Mar�cula matem�tica')
        c=1;
    elseif p>=95
        if c==0
            disp('Trofeo de Au')
            c=1;
        end
    elseif p>=85
        if c==0
            disp('Trofeo de Ag')
            c=1;
        end
    elseif p>=70
        if c==0
            disp('Trofeo de Cu')
            c=1;
        end
    else
        if c==0
            disp('Fracaso Absoluto')
            c=1;
        end
    end
disp('---')