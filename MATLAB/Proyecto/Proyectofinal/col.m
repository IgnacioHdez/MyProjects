function v=col(rx,ry,rz,vx,vy,vz,s)

%Funcion de colision de las particulas.
%Consideramos la existencia de una distancia limite que las particulas no
%pueden superar que actua como las paredes de una caja. Esta caja tiene uno
%de sus vertices en el origen y su volumen se encuentra en el cuadrante
%positivo del sistema de referencia (x,y,z).
%La funcion col cambia el sentido de la comoponente de la velocidad 
%perpendicular al plano de la pared al llegar la particula a la distancia 
%minima "s".

if rx>=s
    vx=-vx;
end
if rx<=0
    vx=-vx;
end
if ry>=s
    vy=-vy;
end
if ry<=0
    vy=-vy;
end
if rz>=s
    vz=-vz;
end
if rz<=0
    vz=-vz;
end
v=[vx,vy,vz];
end