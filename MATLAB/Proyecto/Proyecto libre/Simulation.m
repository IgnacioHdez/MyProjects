clear all
%--Condiciones iniciales

c=menu('Condiciones iniciales','Predefinidas','Aleatorias','Espiral','Esfera');

if c==1
    condinic
elseif c==2 
    condal
elseif c==3
   condespirales
elseif c==4
   condesfera
end

%--M�todo de Euler

%euler

%--Runge Kutta--

run rungekutta

%--Grafica de energ�as y trayectoria

run plots