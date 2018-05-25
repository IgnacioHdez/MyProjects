clear all
hold off

N=10;

lx=1;
ly=1;
lz=1;

x=linspace(-lx/2,lx/2,N);
y=linspace(-ly/2,ly/2,N);
z=linspace(-lz/2,lz/2,N);

%Forma cuadr�tica
A=5*[-1,1,0
      1,-3,0
      0,0,1];


%Giro
%alpha=30;
%phi=alpha/360*2*pi;

%A=[1,2,0
%   0,cos(phi),-sin(phi)
%   -1,sin(phi),cos(phi)];
%vt=[0,0,5];
%B=[1,0,0
%   0,cos(phi),sin(phi)
%   0,-sin(phi),cos(phi)];

%C=[cos(phi),0,sin(phi)
%   0,1,0
%   -sin(phi),0,cos(phi)];

%A=A*B*C;
p=1;
for i=1:N
    for j=1:N
        for k=1:N
            if i==1 || j==1 || k==1 || i==N || j==N || k==N
                v=[x(i),y(j),z(k)];
                
                %--Aplicaci�n lineal--
                
                %fv=vt+v*A;
                
                %--Forma cuadr�tica--
                
                %fv=v/((v*A*v')); %Normalizaci�n
                %fv=v*((v*A*v'))/norm(v);
                fv=v+(v/norm(v)*(v*A*v'));
                P(1)=fv(1);
                P(2)=fv(2);
                P(3)=fv(3);
                c(1)=i/N;
                c(2)=j/N;
                c(3)=k/N;
                p=p+1;
                plot3([P(1),v(1)],[P(2),v(2)],[P(3),v(3)],'.-','Color',c,'MarkerSize',20)
                hold on
            end
        end
    end
end

axis equal

hold off