clear all
%--Condiciones iniciales

c=menu('Condiciones iniciales','Predefinidas','Aleatorias','Espiral','Esfera','Par positr�n electr�n');

if c==1
    run condinic
elseif c==2 
    run condal
elseif c==3
   run condespirales
elseif c==4
   run condesfera
elseif c==5
   run condposel
end

%--M�todo de Euler

%euler

%--Runge Kutta--

run rungekutta

%--Grafica de energ�as y trayectoria

run plots