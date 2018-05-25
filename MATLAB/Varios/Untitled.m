clear all

Res=1e3;

% N: Number of spins
% m0: Permeabitly in vacuum
% H: External magnetic field*permeavility
% m: Dipole value
% T: Temperature of the system
% eps: Energy of one interaction
% k: Boltzmann constant
N=10^23;
m0=4*pi*1e-7;
H1=2/m0;
H2=0.2/m0;
m=9.274e-24;
T=linspace(0,3e6,Res);
eps1=2*m*H1;
eps2=2*m*H2;
k=1.38e-23;


%------------------------------------
figure(1)

disp('Bohr Magneton')

%E: Internal Energy
subplot(2,2,1)
    E1=N*eps1*exp(-eps1./(k.*T))./(1+exp(-eps1./(k.*T)));
    E2=N*eps2*exp(-eps2./(k.*T))./(1+exp(-eps2./(k.*T)));
        plot(T,E1,'.')
        hold on
        plot(T,E2,'r.')
        hold off
        title('Interna Energy')
        xlabel('Temperature (K)')
        ylabel('Energy (J)')
        legend('B = 2T','B = 0.2T')
        grid on
        

%S: Entropy
subplot(2,2,2)
    S1=N*k*( (E1/(N*eps1)-1).*log(1-(E1/(N*eps1))) - (E1/(N*eps1)).*log((E1/(N*eps1))) );
    S2=N*k*( (E2/(N*eps2)-1).*log(1-(E2/(N*eps2))) - (E2/(N*eps2)).*log((E2/(N*eps2))) );
    TestS=linspace(N*k*log(2),N*k*log(2),Res);  
    plot(T,S1,'.')
        hold on
        plot(T,S2,'r.')
        plot(T,TestS,'k')
        hold off
        title('Entropy')
        xlabel('Temperature (K)')
        ylabel('Entropy (J/K)')
        legend('B = 2T','B = 0.2T', 'R*log(2)')
        grid on

%C: Specific Heat
subplot(2,2,3)
    C1=N*eps1^2./(k*T.*T).*exp(-eps1./(k.*T))./((1+exp(-eps1./(k.*T))).^2);
    C2=N*eps2^2./(k*T.*T).*exp(-eps2./(k.*T))./((1+exp(-eps2./(k.*T))).^2);
    for i=1:Res
        if C1(i)==max(C1)
            Tmax1=T(i);
        end
        if C2(i)==max(C2)
            Tmax2=T(i);
        end
    end
    disp('B=2 T')    
    disp('    Temperature of maximum C =')
    disp(Tmax1)
    disp('B=0.2 T')    
    disp('    Temperature of maximum C =')
    disp(Tmax2)
        plot(T,C1,'.')
        hold on
        plot(T,C2,'r.')
        plot(Tmax1,max(C1),'bo')
        plot(Tmax2,max(C2),'ro')
        hold off
        title('Specific Heat')
        xlabel('Temperature (K)')
        ylabel('Specific Heat (J/K)')
        legend('B = 2T','B = 0.2T')
        grid on
        
%M: Imanation
subplot(2,2,4)
    M1=H1*m0-(2*E1/eps1-N)*m;
    M2=H2*m0-(2*E2/eps2-N)*m;
    TestM1=linspace(H1*m0,H1*m0,Res);
    TestM2=linspace(H2*m0,H2*m0,Res);
        plot(T,M1,'.')
        hold on
        plot(T,M2,'r.')
        plot(T,TestM1,'k')
        plot(T,TestM2,'k')
        hold off
        title('Total Magnetic Field (External+imanation)')
        xlabel('Temperature (K)')
        ylabel('Magnetic Field (T)')
        legend('(M1+H1)*Permeability','(M2+H2)*Permeability','B = 2T','B = 0.2T')
        grid on
        
%----------------------------------------------------- 

m=5.05e-27;
T=linspace(0,1e3,Res);
eps1=2*m*H1;
eps2=2*m*H2;
k=1.38e-23;

figure(2)

disp('Nuclear Magneton')

%E: Internal Energy
subplot(2,2,1)
    E1=N*eps1*exp(-eps1./(k.*T))./(1+exp(-eps1./(k.*T)));
    E2=N*eps2*exp(-eps2./(k.*T))./(1+exp(-eps2./(k.*T)));
        plot(T,E1,'.')
        hold on
        plot(T,E2,'r.')
        hold off
        title('Interna Energy')
        xlabel('Temperature (K)')
        ylabel('Energy (J)')
        legend('B = 2T','B = 0.2T')
        grid on

%S: Entropy
subplot(2,2,2)
    S1=N*k*( (E1/(N*eps1)-1).*log(1-(E1/(N*eps1))) - (E1/(N*eps1)).*log((E1/(N*eps1))) );
    S2=N*k*( (E2/(N*eps2)-1).*log(1-(E2/(N*eps2))) - (E2/(N*eps2)).*log((E2/(N*eps2))) );
    TestS=linspace(N*k*log(2),N*k*log(2),Res);  
    plot(T,S1,'.')
        hold on
        plot(T,S2,'.r')
        plot(T,TestS,'k')
        hold off
        title('Entropy')
        xlabel('Temperature (K)')
        ylabel('Entropy (J/K)')
        legend('B = 2T','B = 0.2T', 'R*log(2)')
        grid on

%C: Specific Heat
subplot(2,2,3)
    C1=N*eps1^2./(k*T.*T).*exp(-eps1./(k.*T))./((1+exp(-eps1./(k.*T))).^2);
    C2=N*eps2^2./(k*T.*T).*exp(-eps2./(k.*T))./((1+exp(-eps2./(k.*T))).^2);
    for i=1:Res
        if C1(i)==max(C1)
            Tmax1=T(i);
        end
        if C2(i)==max(C2)
            Tmax2=T(i);
        end
    end
    disp('B=2 T')    
    disp('    Temperature of maximum C =')
    disp(Tmax1)
    disp('B=0.2 T')    
    disp('    Temperature of maximum C =')
    disp(Tmax2)
        plot(T,C1,'.')
        hold on
        plot(T,C2,'r.')
        plot(Tmax1,max(C1),'bo')
        plot(Tmax2,max(C2),'ro')
        hold off
        title('Specific Heat')
        xlabel('Temperature (K)')
        ylabel('Specific Heat (J/K)')
        legend('B = 2T','B = 0.2T')
        grid on
     
        
%M: Imanation
subplot(2,2,4)
    M1=H1*m0-(2*E1/eps1-N)*m;
    M2=H2*m0-(2*E2/eps2-N)*m;
    TestM1=linspace(H1*m0,H1*m0,Res);
    TestM2=linspace(H2*m0,H2*m0,Res);
        plot(T,M1,'.')
        hold on
        plot(T,M2,'r.')
        hold off
        title('Total Magnetic Field (External+imanation)')
        xlabel('Temperature (K)')
        ylabel('Magnetic Field (T)')
        legend('B = 2T','B = 0.2T')
        grid on
       
       
        