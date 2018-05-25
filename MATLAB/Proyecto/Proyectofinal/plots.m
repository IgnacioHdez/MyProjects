%Plots

for j=1:N-1
x(j)=t(j+1);
end

%Grafica de Trayectoria----------------------------------------------------

figure (1)

    plot3(rax,ray,raz,'-')
    hold on
    plot3(rbx,rby,rbz,'-r')
    plot3(rax(i+1),ray(i+1),raz(i+1),'.')
    plot3(rbx(i+1),rby(i+1),rbz(i+1),'.r')
    axis([0 s 0 s 0 s])
    xlabel('Eje x')
    ylabel('Eje y')
    zlabel('Eje z')
    legend('Part. A','Part. B')
    grid on
    hold off

%Grafica de energias-------------------------------------------------------

figure (2)

    %subplot(3,1,1),plot(x,E1)
    hold on
    plot(x,E2,'r')
    plot(x,Et,'g')
    legend('Energía potencial electrica','Energía cinética',...
        'Energía total')
    xlabel('Tiempo (s)')
    ylabel('Energía (J)')
    grid
    hold off

%Control de errores--------------------------------------------------------    

figure (3)

disp('Energia Media = ')
disp(mean(Et))
disp('Energia inicial = ')
disp(E0)
disp('Energia de la particula A = ')
disp(mean(Eta))
disp('Energia de la particula B = ')
disp(mean(Etb))
disp('Error medio (%) =')
Error=abs((((mean(Et)-E0)/E0))*100);
disp(Error)
Er=abs((Et-E0)/E0)*100;
disp('Error final (%) =')
disp(abs((Et(i)-E0)/E0)*100)

    plot(x,Er)
    xlabel('Tiempo (s)')
    ylabel('Error (%)')
    grid on
    legend('Error en la energía mecánica')
    
%Distancia entre las particulas--------------------------------------------

%subplot(3,1,3),plot(x,dist,'k')
%xlabel('Tiempo (s)')
%ylabel('Distancia entre las particulas (m)')
%grid on





