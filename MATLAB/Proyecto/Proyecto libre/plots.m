%Plots
%Grafica de energias

for j=1:N-1
x(j)=t(j+1);
end

figure (2)

    plot(x,E1)
    hold on
    plot(x,E2,'r')
    plot(x,E3,'m')
    %plot(x,E4,'c')
    plot(x,Et,'g')
    legend('Energía potencial electrica','Energía cinética','Enegía potencial gravitatoria','Energía total')%,%'Energía magnética
    xlabel('Tiempo (s)')
    ylabel('Energía (J)')
    title('Energías')
    grid
    hold off

%Control de errores    

disp('Energia Media (J) = ')
disp(mean(Et))
disp('Energia inicial (J) = ')
disp(E0)
disp('Error medio (%) =')
Error=abs((((mean(Et)-E0)/E0))*100);
disp(Error)
Er=abs((Et-E0)/E0)*100;
disp('Error final (%) =')
disp(abs((Et(i)-E0)/E0)*100)

figure (3)

    plot(x,Er)
    xlabel('Tiempo (s)')
    ylabel('Error (%)')
    title('Error estimado en cada instante')

%Grafica de Trayectoria

figure (1)

    plot3(rax,ray,raz,'-')
    hold on
    plot3(rbx,rby,rbz,'-r')
    plot3(rax(i+1),ray(i+1),raz(i+1),'.')
    plot3(rbx(i+1),rby(i+1),rbz(i+1),'.r')
    axis([-0.5 s+0.5 -0.5 s+0.5 -0.5 s+0.5])
    xlabel('Eje x')
    ylabel('Eje y')
    zlabel('Eje z')
    legend('Part. A','Part. B')
    title('Trayectoria')
    grid on
    
hold off