clear all
hold off

N=25;

lx=3;
ly=3;
lz=3;

x=linspace(-lx/2,lx/2,N);
y=linspace(-ly/2,ly/2,N);
z=linspace(-lz/2,lz/2,N);

%Forma cuadrática
A=[1,2,0
  0,1,2
  -1,2,1];


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

for i=1:N
    for j=1:N
        for k=1:N
            if x(i)==lx/2 || y(j)==ly/2 || z(k)==lz/2 || x(i)==-lx/2 || y(j)==-ly/2 || z(k)==-lz/2
            %if x(i)==lx/2 || y(j)==ly/2 || z(k)==lz/2 % || x(i)==-lx/2 && y(j)==-ly/2 && z(k)==-lz/2    
                v=[x(i),y(j),z(k)];
                
                %--Aplicación lineal--
                
                %fv=vt+v*A;
                
                %--Forma cuadrática--
                
                %fv=v/((v*A*v')); %Normalización
                fv=v*((v*A*v'));
                %fv=v+(v/norm(v)*(v*A*v'));
                
                c=[i/N,j/N,k/N];
                plot3(fv(1),fv(2),fv(3),'Color',c,'Marker','.')
                hold on     
                plot3(x(i),y(j),z(k),'Color',c,'Marker','.')
                
            end
        end
    end
end
axis equal
grid