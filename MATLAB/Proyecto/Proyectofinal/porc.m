por=i/(N-1)*100;
    if floor(por)~=ppo
        clc
        disp('PORCENTAJE DE SIMULACION COMPLETO = ')
        disp(ppo+1)
    end
    ppo=floor(por);