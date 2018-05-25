%PROYECTO FINAL COMPUTACION I

%INTERACCION DE DOS CARGAS PUNTUALES EN UN CAMPO MAGNETICO UNIFORME
  
%Ignacio Hernandez-Ros, Alvaro Gonzalez Cervera
  
clear all

%--Condiciones iniciales--

c=menu('Condiciones iniciales','Par positron-electron','Espiral 1','Espiral 2','Esfera','Parabola','Hiperbola','Repulsion');
if c==1
   condposel
elseif c==2 
   condespirales1
elseif c==3
   condespirales2
elseif c==4
   condesfera
elseif c==5
   condparabola
elseif c==6
    condhiperbola
elseif c==7
    condinic
end

%--Runge Kutta--

run rungekutta

%--Grafica de energías y trayectoria--

run plots