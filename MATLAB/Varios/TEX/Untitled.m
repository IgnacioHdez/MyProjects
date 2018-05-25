clear all

%Loading Data
A1=load('Data1.txt');
A2=load('Data2.txt');
A3=load('Data3.txt');
A4=load('Data4.txt');

%x vectors

x1=A1(:,1);
xr1=x1-x1(1);

x2=A2(:,1);
xr2=x2-x2(1);

x3=A3(:,1);
xr3=x3-x3(1);

x4=A4(:,1);
xr4=x4-x4(1);

%y vectors

y1=A1(:,2);
yr1=-y1+max(y1)/2;

y2=A2(:,2);
yr2=-y2+max(y2)/2;

y3=A3(:,2);
yr3=-y3+max(y3)/2;

y4=A4(:,2);
yr4=-y4+max(y4)/2;

%Fourier limits

 N=5e3;
 m=2*pi/0.013;
 M=2*pi/0.02;

 %Fourier transform
 
k1=linspace(m,M,N);
ft1=linspace(0,0,N);
for j=1:N
    for i=1:size(xr1)-1
        dx1=x1(i+1)-x1(i);
        ft1(j)=ft1(j) + y1(i)*exp(-1i*k1(j)*x1(i))*dx1;
    end
end

ftr1=ft1.*conj(ft1);

k2=linspace(m,M,N);
ft2=linspace(0,0,N);
for j=1:N
    for i=1:size(xr2)-1
        dx2=x2(i+1)-x2(i);
        ft2(j)=ft2(j) + y2(i)*exp(-1i*k2(j)*x2(i))*dx2;
    end
end

ftr2=ft2.*conj(ft2);

k3=linspace(m,M,N);
ft3=linspace(0,0,N);
for j=1:N
    for i=1:size(xr3)-1
        dx3=x3(i+1)-x3(i);
        ft3(j)=ft3(j) + y3(i)*exp(-1i*k3(j)*x3(i))*dx3;
    end
end

ftr3=ft3.*conj(ft3);

k4=linspace(m,M,N);
ft4=linspace(0,0,N);
for j=1:N
    for i=1:size(xr4)-1
        dx4=x4(i+1)-x4(i);
        ft4(j)=ft4(j) + y4(i)*exp(-1i*k4(j)*x4(i))*dx4;
    end
end

ftr4=ft4.*conj(ft4);


%K of maximum

for i=1:N
    if ftr1(i)==max(ftr1)
        kfit1=k1(i);
    end
end

for i=1:N
    if ftr2(i)==max(ftr2)
        kfit2=k2(i);
    end
end

for i=1:N
    if ftr3(i)==max(ftr3)
        kfit3=k3(i);
    end
end

for i=1:N
    if ftr4(i)==max(ftr4)
        kfit4=k4(i);
    end
end
 
%Plot

 figure(1)

plot(4*pi./k1*1e2,ftr1/max(ftr1),'b-','LineWidth',2)
hold on
plot(4*pi./k2*1e2,ftr2/max(ftr2),'r-','LineWidth',2)
plot(4*pi./k3*1e2,ftr3/max(ftr3),'g-','LineWidth',2)
plot(4*pi./k4*1e2,ftr4/max(ftr4),'m-','LineWidth',2)
hold off

xlabel('Wave Length (cm)')
ylabel('Normalized Fourier Analisys')
legend('Onda Estacionaria','Interferómetro de Michelson','Fabry-Perot Outside','Fabry-Perot Inside')
grid on

disp(sum(4*pi./[kfit1,kfit2,kfit3,kfit4])/4*1e2)

% figure(2)
% 
% plot(xr1,y1,'b')
% hold on
% xr1=linspace(min(xr1),max(xr1),N);
% plot(xr1,max(y1)*cos(kfit1*xr1-1.1)/2+max(y1)/2,'r')
% hold off
% 
% figure (3)
% 
% plot(xr2,y2,'b')
% hold on
% xr2=linspace(min(xr2),max(xr2),N);
% plot(xr2,max(y2)*cos(kfit2*xr2+pi/2+1.5)/2+max(y2)/2,'r')
% hold off
% 
% figure (4)
% 
% plot(xr3,y3,'b')
% hold on
% xr3=linspace(min(xr3),max(xr3),N);
% plot(xr3,max(y3)*cos(kfit2*xr3+pi/2+1.5)/2+max(y3)/2,'r')
% hold off